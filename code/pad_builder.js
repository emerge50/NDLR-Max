// pad_builder.js
// inlet 0 : messages nommés
//   pool [notes...]      : pool complet des notes de l'accord
//   roles [nc r nc r...] : paires noteClass/role depuis chord_builder
//   position [0-100]     : position sur le clavier
//   range [1-22]         : nombre de notes à jouer
//   strum_on [0-1]       : active/désactive le strum
//   strum_div [1-21]     : division d'horloge entre les notes
//   strum_group [0-1]    : joue les 3 premières notes ensemble
//   strum [1-7]          : compatibilité avec l'ancien sélecteur
//   spread [1-6]         : disposition des notes
//   polychain [1-4]      : répartit les voix sur 1 à 4 canaux MIDI
//   channel [1-16]       : premier canal MIDI utilisé par Poly-Chain
//   chord_invert [0-1]   : renversement automatique à mouvement minimal
//   pad_quant [0-2]      : 0=off, 1=1/4, 2=1/8
//   beat                 : tick maître 96 PPQN pour la quantification
//   tempo [10-300]       : tempo en BPM
//   vel [0-127]          : vélocité des notes envoyées
//   start                : active le pad
//   stop                 : désactive le pad et coupe les notes actives
//   allnotesoff          : coupe toutes les notes actives
// outlet 0 : NoteOn  — [note MIDI, vélocité]
// outlet 1 : NoteOff — [note MIDI, 0]

autowatch = 1;
inlets  = 1;
outlets = 2;

var CLK_DIVISIONS = [
    {id:1,label:'1nd',ticks:576}, {id:2,label:'1n',ticks:384}, {id:3,label:'1nt',ticks:256},
    {id:4,label:'2nd',ticks:288}, {id:5,label:'2n',ticks:192}, {id:6,label:'2nt',ticks:128},
    {id:7,label:'4nd',ticks:144}, {id:8,label:'4n',ticks:96}, {id:9,label:'4nt',ticks:64},
    {id:10,label:'8nd',ticks:72}, {id:11,label:'8n',ticks:48}, {id:12,label:'8nt',ticks:32},
    {id:13,label:'16nd',ticks:36}, {id:14,label:'16n',ticks:24}, {id:15,label:'16nt',ticks:16},
    {id:16,label:'32nd',ticks:18}, {id:17,label:'32n',ticks:12}, {id:18,label:'32nt',ticks:8},
    {id:19,label:'64nd',ticks:9}, {id:20,label:'64n',ticks:6}, {id:21,label:'128n',ticks:3}
];

var currentPool     = [];
var currentRoles    = {};  // noteClass (0-11) → role
var stagedRoles     = {};  // rôles du prochain pool reçu
var currentPosition = 50;
var currentRange    = 13;
var strumEnabled    = false;
var currentStrumDiv = 17; // 32n, équivalent de l'ancien 1/32
var strumGrouped    = false;
var currentSpread   = 4;
var currentPolyChain = 1;
var currentChannel   = 1;
var chordInvert      = false;
var currentPadQuant  = 0;
var quantTick        = 0;
var pendingPool      = null;
var pendingRoles     = null;
var currentTempo    = 90;
var currentVel      = 100; // vélocité MIDI (0-127)
var isRunning              = false;
var isEnabled              = false; // état du bouton on/off local (indépendant du transport)
var globalTransportRunning = false; // true quand le transport global ndlr est actif
var activeNotes     = [];
var strumTasks      = [];
var pendingControls = {
    position: currentPosition,
    range: currentRange,
    spread: currentSpread,
    vel: currentVel,
    positionDirty: false,
    rangeDirty: false,
    spreadDirty: false,
    velDirty: false
};

// Rôles harmoniques
var ROLE_ROOT    = 0;
var ROLE_SECOND  = 1;
var ROLE_THIRD   = 2;
var ROLE_FOURTH  = 3;
var ROLE_FIFTH   = 4;
var ROLE_SIXTH   = 5;
var ROLE_SEVENTH = 6;

function getStrumDelay() {
    if (!strumEnabled) return 0;
    var quarter = 60000 / currentTempo;
    var division = CLK_DIVISIONS[Math.max(0, Math.min(CLK_DIVISIONS.length - 1, currentStrumDiv - 1))];
    return quarter * division.ticks / 96;
}

function cancelStrumTasks() {
    for (var i = 0; i < strumTasks.length; i++) {
        strumTasks[i].cancel();
    }
    strumTasks = [];
}

function channelForVoice(index) {
    return ((currentChannel - 1 + (index % currentPolyChain)) % 16) + 1;
}

function playStrumNote(note, velocity, channel) {
    outlet(0, note, velocity, channel);
}

// Retourne le rôle d'une note MIDI
function getRole(midiNote) {
    var nc = midiNote % 12;
    return (currentRoles[nc] !== undefined) ? currentRoles[nc] : ROLE_ROOT;
}

// Applique le Spread sur une liste de notes candidates
function applySpread(notes) {
    // Le firmware conserve le voicing empilé par tierces quand quatre notes
    // ou moins sont demandées, quel que soit le Spread sélectionné.
    if (currentSpread === 1 || notes.length <= 4) return notes;

    var result = [];

    switch (currentSpread) {

        case 2:
            // Tonique seule dans les graves (octave 0-2)
            // Accord ouvert en medium-bas (3-4)
            // Accord fermé en medium-haut (5-6)
            // Tonique seule dans l'aigu (7+)
            for (var i = 0; i < notes.length; i++) {
                var n    = notes[i];
                var oct  = Math.floor(n / 12);
                var role = getRole(n);
                if (oct <= 2) {
                    if (role === ROLE_ROOT) result.push(n);
                } else if (oct <= 4) {
                    result.push(n);  // accord ouvert
                } else if (oct <= 6) {
                    if (role === ROLE_ROOT || role === ROLE_THIRD ||
                        role === ROLE_FIFTH) result.push(n);
                } else {
                    if (role === ROLE_ROOT) result.push(n);
                }
            }
            break;

        case 3:
            // Tonique seule dans les graves, accord fermé en 4ème octave
            for (var i = 0; i < notes.length; i++) {
                var n    = notes[i];
                var oct  = Math.floor(n / 12);
                var role = getRole(n);
                if (oct <= 2) {
                    if (role === ROLE_ROOT) result.push(n);
                } else if (oct === 3) {
                    result.push(n);
                }
            }
            break;

        case 4:
            // 70% de chance pour chaque note
            for (var i = 0; i < notes.length; i++) {
                if (Math.random() < 0.7) result.push(notes[i]);
            }
            // Toujours au moins une note
            if (result.length === 0) result.push(notes[0]);
            break;

        case 5:
            // Tonique seule dans les graves, tonique+quinte ailleurs
            for (var i = 0; i < notes.length; i++) {
                var n    = notes[i];
                var oct  = Math.floor(n / 12);
                var role = getRole(n);
                if (oct <= 2) {
                    if (role === ROLE_ROOT) result.push(n);
                } else {
                    if (role === ROLE_ROOT || role === ROLE_FIFTH) result.push(n);
                }
            }
            break;

        case 6:
            // Tonique seule dans les graves, tierce ou 7ème au-dessus
            for (var i = 0; i < notes.length; i++) {
                var n    = notes[i];
                var oct  = Math.floor(n / 12);
                var role = getRole(n);
                if (oct <= 2) {
                    if (role === ROLE_ROOT) result.push(n);
                } else {
                    if (role === ROLE_ROOT  || role === ROLE_THIRD ||
                        role === ROLE_SEVENTH) result.push(n);
                }
            }
            break;

        default:
            return notes;
    }

    // Si le filtre est trop agressif, garder au moins la note centrale
    if (result.length === 0) {
        var mid = Math.floor(notes.length / 2);
        result.push(notes[mid]);
    }

    return result;
}

// Essaie toutes les inversions de l'accord (rotation des voix), puis toutes
// les octaves possibles. C'est la rotation qui manquait à l'ancienne
// implémentation : déplacer chaque note isolément d'une octave ne pouvait pas
// transformer G-B-D en D-G-B, donc le réglage était souvent inaudible.
function applyChordInvert(notes) {
    if (!chordInvert || activeNotes.length === 0 || notes.length === 0) return notes;
    var best = notes.slice();
    var bestScore = Infinity;

    for (var rotation = 0; rotation < notes.length; rotation++) {
        var rotated = notes.slice(rotation);
        for (var r = 0; r < rotation; r++) rotated.push(notes[r] + 12);

        for (var octave = -5; octave <= 5; octave++) {
            var candidate = [];
            var valid = true;
            for (var i = 0; i < rotated.length; i++) {
                var note = rotated[i] + octave * 12;
                if (note < 0 || note > 127) { valid = false; break; }
                candidate.push(note);
            }
            if (!valid) continue;

            var score = 0;
            for (var j = 0; j < candidate.length; j++) {
                var targetIndex = candidate.length === 1 ? 0 :
                    Math.round(j * (activeNotes.length - 1) / (candidate.length - 1));
                score += Math.abs(candidate[j] - activeNotes[targetIndex]);
            }
            // En cas d'égalité, préférer l'inversion la moins radicale.
            score += rotation * 0.001 + Math.abs(octave) * 0.0001;
            if (score < bestScore) {
                best = candidate;
                bestScore = score;
            }
        }
    }
    return best;
}

function buildPad(forceRetrigger) {
    if (!isRunning) return;
    if (currentPool.length === 0) return;

    // 1. Mapper position vers MIDI
    var midiPos = Math.round(currentPosition * 1.27);

    // 2. Trouver la note la plus proche dans le pool
    var closestIdx  = 0;
    var closestDist = 999;
    for (var i = 0; i < currentPool.length; i++) {
        var dist = Math.abs(currentPool[i] - midiPos);
        if (dist < closestDist) {
            closestDist = dist;
            closestIdx  = i;
        }
    }

    // 3. Extraire Range notes autour de closestIdx
    var half     = Math.floor(currentRange / 2);
    var startIdx = Math.max(0, closestIdx - half);
    var endIdx   = Math.min(currentPool.length - 1,
                            startIdx + currentRange - 1);

    if (endIdx - startIdx + 1 < currentRange) {
        startIdx = Math.max(0, endIdx - currentRange + 1);
    }

    var candidateNotes = [];
    for (var j = startIdx; j <= endIdx; j++) {
        candidateNotes.push(currentPool[j]);
    }

    // 4. Appliquer le Spread
    var newNotes = applyChordInvert(applySpread(candidateNotes));

    // 5. Calculer toStop et toPlay
    var previousNotes = activeNotes.slice();
    var toStop = [];
    var toPlay = [];

    if (forceRetrigger) {
        // Un changement de pool/type d'accord doit réarticuler l'accord
        // complet. Ne jouer que la différence entre les deux accords laisse
        // souvent une seule note à strummer, car leurs notes se recouvrent.
        toStop = previousNotes.slice();
        toPlay = newNotes.slice();
    } else {
        for (var k = 0; k < previousNotes.length; k++) {
            if (newNotes.indexOf(previousNotes[k]) === -1) {
                toStop.push(previousNotes[k]);
            }
        }

        for (var l = 0; l < newNotes.length; l++) {
            if (previousNotes.indexOf(newNotes[l]) === -1) {
                toPlay.push(newNotes[l]);
            }
        }
    }

    // 6. Mettre à jour les notes actives
    activeNotes = newNotes;

    // 7. Annuler les tâches strum en cours — uniquement si les notes changent réellement.
    // Sinon, un mod_matrix qui module en continu un paramètre du pad (position, range,
    // spread...) appelle buildPad() à ~25Hz et annulerait systématiquement les notes
    // de strum programmées avant qu'elles ne se déclenchent.
    if (toStop.length > 0 || toPlay.length > 0) {
        cancelStrumTasks();
    }

    // 8. NoteOff toujours immédiat
    for (var m = 0; m < toStop.length; m++) {
        outlet(1, toStop[m], 0, channelForVoice(Math.max(0, previousNotes.indexOf(toStop[m]))));
    }

    // 9. NoteOn avec ou sans strum
    if (toPlay.length > 0) {
        var delay     = getStrumDelay();
        if (delay === 0) {
            for (var p = 0; p < toPlay.length; p++) {
                outlet(0, toPlay[p], currentVel,
                    channelForVoice(Math.max(0, newNotes.indexOf(toPlay[p]))));
            }
        } else {
            var groupSize = strumGrouped ? 3 : 1;
            for (var n = 0; n < toPlay.length; n++) {
                var timeOffset;
                if (n < groupSize) {
                    timeOffset = 0;
                } else {
                    timeOffset = (n - groupSize + 1) * delay;
                }
                var t = new Task(playStrumNote, this, toPlay[n], currentVel,
                    channelForVoice(Math.max(0, newNotes.indexOf(toPlay[n]))));
                t.schedule(timeOffset);
                strumTasks.push(t);
            }
        }
    }
}

function pool() {
    var nextPool = arrayfromargs(arguments).filter(function(x) {
        return typeof x === "number";
    });
    if (currentPadQuant > 0 && isRunning) {
        pendingPool = nextPool;
        pendingRoles = copyRoles(stagedRoles);
        return;
    }
    currentPool = nextPool;
    currentRoles = copyRoles(stagedRoles);
    buildPad(true);
}

function copyRoles(source) {
    var result = {};
    for (var key in source) if (source.hasOwnProperty(key)) result[key] = source[key];
    return result;
}

// Réception des rôles : paires successives [noteClass, role, ...]
function roles() {
    var args = arrayfromargs(arguments).filter(function(x) {
        return typeof x === "number";
    });
    stagedRoles = {};
    for (var i = 0; i < args.length - 1; i += 2) {
        stagedRoles[args[i]] = args[i + 1];
    }
    // chord_builder émet toujours roles avant pool. Le pool qui suit est
    // l'unique déclencheur de reconstruction : sinon deux rebuilds successifs
    // annulent les Task du strum avant qu'elles aient pu jouer.
}

function position(v) {
    currentPosition = Math.max(0, Math.min(100, v));
    pendingControls.position = currentPosition;
    pendingControls.positionDirty = false;
    buildPad();
}

function range(v) {
    currentRange = Math.max(1, Math.min(22, v));
    pendingControls.range = currentRange;
    pendingControls.rangeDirty = false;
    buildPad();
}

function strum_on(v) {
    strumEnabled = v ? true : false;
}

function strum(v) {
    var legacyMode = Math.max(1, Math.min(7, Math.round(v)));
    strumEnabled = legacyMode !== 1;
    strumGrouped = legacyMode === 5 || legacyMode === 7;
    if (legacyMode === 2) currentStrumDiv = 17;      // 32n
    else if (legacyMode === 3) currentStrumDiv = 14; // 16n
    else if (legacyMode === 4 || legacyMode === 5) currentStrumDiv = 12; // 8nt
    else if (legacyMode === 6 || legacyMode === 7) currentStrumDiv = 11; // 8n
}

function strum_div(v) {
    currentStrumDiv = Math.max(1, Math.min(CLK_DIVISIONS.length, Math.round(v)));
}

function strum_group(v) {
    strumGrouped = v ? true : false;
}

function readClockDivisions() {
    // Table CLK_DIVISIONS hardcodée — plus de fichier externe nécessaire.
}

function configureStrumMenu() {
    if (!this.patcher || !this.patcher.getnamed) return;
    var menu = this.patcher.getnamed('pad_strum_div_menu');
    if (!menu) return;
    menu.message('clear');
    for (var i = 0; i < CLK_DIVISIONS.length; i++) menu.message('append', CLK_DIVISIONS[i].label);
    menu.message('set', currentStrumDiv - 1);
}

function loadbang() {
    readClockDivisions();
    configureStrumMenu.call(this);
    messnamed('mod_input', 'part_active', 'pad', 0);
}

function spread(v) {
    currentSpread = Math.max(1, Math.min(6, v));
    pendingControls.spread = currentSpread;
    pendingControls.spreadDirty = false;
    buildPad();
}

function polychain(v) {
    currentPolyChain = Math.max(1, Math.min(4, Math.round(v)));
    if (isRunning) buildPad(true);
}

function channel(v) {
    currentChannel = Math.max(1, Math.min(16, Math.round(v)));
}

function chord_invert(v) {
    chordInvert = v ? true : false;
    if (isRunning) buildPad(true);
}

function pad_quant(v) {
    currentPadQuant = Math.max(0, Math.min(2, Math.round(v)));
    messnamed('pad_quant_value', currentPadQuant);
    if (currentPadQuant === 0 && pendingPool) commitPendingPool();
}

function commitPendingPool() {
    if (!pendingPool) return;
    currentPool = pendingPool;
    if (pendingRoles) currentRoles = pendingRoles;
    pendingPool = null;
    pendingRoles = null;
    buildPad(true);
}

function beat() {
    quantTick++;
    if (!pendingPool || currentPadQuant === 0) return;
    var grid = currentPadQuant === 1 ? 96 : 48;
    if (quantTick % grid === 0) commitPendingPool();
}

function tempo(v) {
    currentTempo = Math.max(10, Math.min(300, v));
}

function vel(v) {
    currentVel = Math.max(0, Math.min(127, Math.round(v)));
    pendingControls.vel = currentVel;
    pendingControls.velDirty = false;
}

function position_preview(v) {
    pendingControls.position = Math.max(0, Math.min(100, Math.round(v)));
    pendingControls.positionDirty = pendingControls.position !== currentPosition;
}

function range_preview(v) {
    pendingControls.range = Math.max(1, Math.min(22, Math.round(v)));
    pendingControls.rangeDirty = pendingControls.range !== currentRange;
}

function spread_preview(v) {
    pendingControls.spread = Math.max(1, Math.min(6, Math.round(v)));
    pendingControls.spreadDirty = pendingControls.spread !== currentSpread;
}

function vel_preview(v) {
    pendingControls.vel = Math.max(0, Math.min(127, Math.round(v)));
    pendingControls.velDirty = pendingControls.vel !== currentVel;
}

// Valide ensemble les contrôles modifiés lorsque le bouton de souris est relâché.
function controls_release() {
    var rebuild = false;
    if (pendingControls.positionDirty) {
        currentPosition = pendingControls.position;
        pendingControls.positionDirty = false;
        messnamed('pad_position', currentPosition);
        rebuild = true;
    }
    if (pendingControls.rangeDirty) {
        currentRange = pendingControls.range;
        pendingControls.rangeDirty = false;
        messnamed('pad_range', currentRange);
        rebuild = true;
    }
    if (pendingControls.spreadDirty) {
        currentSpread = pendingControls.spread;
        pendingControls.spreadDirty = false;
        messnamed('pad_spread', currentSpread);
        rebuild = true;
    }
    if (pendingControls.velDirty) {
        currentVel = pendingControls.vel;
        pendingControls.velDirty = false;
        messnamed('pad_vel', currentVel);
    }
    if (rebuild) buildPad();
}

function start() {
    isEnabled = true;
    // Le bouton local arme le Pad ; seul le transport global l'autorise a jouer.
    isRunning = globalTransportRunning;
    messnamed('mod_input', 'part_active', 'pad', 1);
    if (globalTransportRunning) {
        buildPad(true);
    }
}

function stop() {
    isEnabled = false;
    isRunning = false;
    messnamed('mod_input', 'part_active', 'pad', 0);
    allnotesoff();
}

function on(v) {
    if (v) start();
    else stop();
}

// ── Synchro horloge externe (MIDI Start/Stop) ───────────────────────────────
// Appelé sur Stop MIDI : coupe le son sans changer l'état du bouton on/off
// (isEnabled), pour pouvoir redémarrer instantanément sur le prochain Start.
function transportstop() {
    globalTransportRunning = false;
    isRunning = false;
    quantTick = 0;
    allnotesoff();
}

// Appelé sur Start MIDI : ne (re)démarre que si le module est activé
// (isEnabled, via son bouton on/off local).
function transportstart() {
    globalTransportRunning = true;
    quantTick = 0;
    if (!isEnabled) return;
    isRunning = true;
    buildPad(true);
}

function allnotesoff() {
    cancelStrumTasks();
    if (activeNotes.length > 0) {
        for (var i = 0; i < activeNotes.length; i++) {
            outlet(1, activeNotes[i], 0, channelForVoice(i));
        }
        activeNotes = [];
    }
}
