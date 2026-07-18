// pad_builder.js
// inlet 0 : messages nommés
//   pool [notes...]      : pool complet des notes de l'accord
//   roles [nc r nc r...] : paires noteClass/role depuis chord_builder
//   register [-2..2]     : transposition finale par octaves
//   strum_on [0-1]       : active/désactive le strum
//   strum_div [1-21]     : division d'horloge entre les notes
//   strum_group [0-1]    : joue les 3 premières notes ensemble
//   strum [1-7]          : compatibilité avec l'ancien sélecteur
//   spread [0-14]        : profil Voice Grouping Scaler 3.3 (alias historique)
//   polychain [1-4]      : répartit les voix sur 1 à 4 canaux MIDI
//   channel [1-16]       : premier canal MIDI utilisé par Poly-Chain
//   inversion [0-6]      : aucune inversion ou profil Scaler 3.3
//   chord_invert [0-1]   : alias historique (1 = 1st Inversion)
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

var VOICE_GROUPING_PROFILES = [
    'Dynamic', 'Dynamic +1 Oct', 'Dynamic +2 Oct',
    'Grouping C1-B2', 'Grouping C2-B3', 'Grouping C3-B4',
    'Open 1 Voicing', 'Open 2 Voicing', 'Guitar Voicing',
    'Drop 2 Voicing', 'Drop 3 Voicing', 'Drop 4 Voicing',
    'Drop 2 & 3 Voicing', 'Extracted', 'Open 3 Voicing'
];

var INVERSION_PROFILES = [
    'No Inversion', '1st Inversion', '2nd Inversion', 'Drop 2', 'Drop 2 & 3',
    '7ths Inverted', 'Octaves & Inverted 3rds'
];

var currentPool     = [];
var currentRoles    = {};  // noteClass (0-11) → role
var stagedRoles     = {};  // rôles du prochain pool reçu
var currentRegister = 0;
var strumEnabled    = false;
var currentStrumDiv = 17; // 32n, équivalent de l'ancien 1/32
var strumGrouped    = false;
var currentSpread   = 0; // index du profil Voice Grouping
var currentPolyChain = 1;
var currentChannel   = 1;
var currentInversion = 0;
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
var activeGroupedNotes = [];
var strumTasks      = [];
var extractedVoicingOffsets = null;
var dynamicTransitionShift = 0;
var pendingControls = {
    spread: currentSpread,
    vel: currentVel,
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

function uniqueSorted(notes) {
    var result = [];
    var sorted = notes.slice().sort(function(a, b) { return a - b; });
    for (var i = 0; i < sorted.length; i++) {
        var note = Math.max(0, Math.min(127, Math.round(sorted[i])));
        if (result.indexOf(note) < 0) result.push(note);
    }
    return result;
}

function nearestPitchClass(noteClass, target, low, high) {
    var best = low;
    var bestDistance = 999;
    for (var note = low; note <= high; note++) {
        if (((note % 12) + 12) % 12 !== noteClass) continue;
        var distance = Math.abs(note - target);
        if (distance < bestDistance) {
            best = note;
            bestDistance = distance;
        }
    }
    return best;
}

function rootClassFor(notes) {
    for (var i = 0; i < notes.length; i++) {
        if (getRole(notes[i]) === ROLE_ROOT) return ((notes[i] % 12) + 12) % 12;
    }
    return notes.length ? ((notes[0] % 12) + 12) % 12 : 0;
}

// Repartit les voix dans une plage de deux octaves, comme les trois profils
// Dynamic C1-B2 / C2-B3 / C3-B4 de Scaler. Scaler numerote le do central C3.
function fitToRange(notes, low, high) {
    var source = uniqueSorted(notes);
    var result = [];
    if (!source.length) return result;
    for (var i = 0; i < source.length; i++) {
        var target = source.length === 1 ? (low + high) / 2 :
            low + i * (high - low) / (source.length - 1);
        var noteClass = ((source[i] % 12) + 12) % 12;
        result.push(nearestPitchClass(noteClass, target, low, high));
    }
    return uniqueSorted(result);
}

function dynamicVoicing(notes, octaveShift) {
    var source = uniqueSorted(notes);
    if (!source.length) return source;
    // Voice Grouping travaille dans son propre registre central. Le controle
    // Register est volontairement applique seulement apres ce calcul.
    var center = 60 + octaveShift;
    var result = [];

    for (var i = 0; i < source.length; i++) {
        var target;
        if (activeGroupedNotes.length) {
            var activeIndex = source.length === 1 ? 0 :
                Math.round(i * (activeGroupedNotes.length - 1) / (source.length - 1));
            // Appliquer uniquement la difference lors d'un changement de
            // profil. Les accords suivants restent stables dans cette octave.
            target = activeGroupedNotes[activeIndex] + dynamicTransitionShift;
        } else {
            target = center + (i - (source.length - 1) / 2) * 4;
        }
        result.push(nearestPitchClass(source[i] % 12, target, 0, 127));
    }

    // Le profil Dynamic place une basse de fondamentale deux octaves sous le
    // centre tonal, puis choisit les inversions superieures les plus proches.
    var bass = nearestPitchClass(rootClassFor(source), center - 24, 0, 127);
    result.push(bass);
    dynamicTransitionShift = 0;
    return uniqueSorted(result);
}

function openVoicing(notes, level) {
    var result = uniqueSorted(notes);
    var minimumGap = 3 + level * 2;
    for (var i = 1; i < result.length; i++) {
        while (result[i] - result[i - 1] < minimumGap && result[i] + 12 <= 127) {
            result[i] += 12;
        }
    }
    return uniqueSorted(result);
}

function dropVoicing(notes, drops) {
    var result = uniqueSorted(notes);
    for (var i = 0; i < drops.length; i++) {
        var index = result.length - drops[i];
        if (index >= 0 && result[index] - 12 >= 0) result[index] -= 12;
    }
    return uniqueSorted(result);
}

function guitarVoicing(notes) {
    var source = uniqueSorted(notes);
    if (source.length > 6) {
        var reduced = [];
        for (var i = 0; i < 6; i++) {
            reduced.push(source[Math.round(i * (source.length - 1) / 5)]);
        }
        source = uniqueSorted(reduced);
    }
    // E2-E5 avec la convention C3=60 utilisee par Scaler.
    return fitToRange(source, 40, 76);
}

function extractedVoicing(notes) {
    var source = uniqueSorted(notes);
    if (!source.length) return source;
    if (!extractedVoicingOffsets || !extractedVoicingOffsets.length) {
        var template = activeGroupedNotes.length ? uniqueSorted(activeGroupedNotes) : source;
        extractedVoicingOffsets = [];
        for (var i = 0; i < template.length; i++) {
            extractedVoicingOffsets.push(template[i] - template[0]);
        }
    }

    var base = nearestPitchClass(rootClassFor(source), source[0], 0, 127);
    var result = [];
    for (var j = 0; j < extractedVoicingOffsets.length; j++) {
        var target = base + extractedVoicingOffsets[j];
        var best = source[0];
        var bestDistance = 999;
        for (var k = 0; k < source.length; k++) {
            var candidate = nearestPitchClass(source[k] % 12, target, 0, 127);
            var distance = Math.abs(candidate - target);
            if (distance < bestDistance) {
                best = candidate;
                bestDistance = distance;
            }
        }
        result.push(best);
    }
    return uniqueSorted(result);
}

function applyVoiceGrouping(notes) {
    switch (currentSpread) {
        case 0:  return dynamicVoicing(notes, 0);
        case 1:  return dynamicVoicing(notes, 12);
        case 2:  return dynamicVoicing(notes, 24);
        case 3:  return fitToRange(notes, 36, 59); // C1-B2
        case 4:  return fitToRange(notes, 48, 71); // C2-B3
        case 5:  return fitToRange(notes, 60, 83); // C3-B4
        case 6:  return openVoicing(notes, 1);
        case 7:  return openVoicing(notes, 2);
        case 8:  return guitarVoicing(notes);
        case 9:  return dropVoicing(notes, [2]);
        case 10: return dropVoicing(notes, [3]);
        case 11: return dropVoicing(notes, [4]);
        case 12: return dropVoicing(notes, [2, 3]);
        case 13: return extractedVoicing(notes);
        case 14: return openVoicing(notes, 3);
    }
    return notes;
}

function rotateVoices(notes, count) {
    var result = uniqueSorted(notes);
    for (var i = 0; i < count && result.length > 1; i++) {
        var raised = result.shift() + 12;
        if (raised <= 127) result.push(raised);
    }
    return uniqueSorted(result);
}

// Reconstruit une seule occurrence de chaque note harmonique en position
// fondamentale. Aucun ancien controle Range ne limite plus l'accord source.
function compactChordVoicing(notes) {
    var source = uniqueSorted(notes);
    if (!source.length) return source;

    var rootClass = rootClassFor(source);
    var center = (source[0] + source[source.length - 1]) / 2;
    var root = nearestPitchClass(rootClass, center, 0, 127);
    var noteClasses = {};
    for (var i = 0; i < source.length; i++) {
        noteClasses[source[i] % 12] = true;
    }

    var result = [];
    for (var key in noteClasses) {
        if (!noteClasses.hasOwnProperty(key)) continue;
        var interval = (parseInt(key, 10) - rootClass + 12) % 12;
        result.push(root + interval);
    }
    result = uniqueSorted(result);

    while (result.length && result[result.length - 1] > 127) {
        for (var j = 0; j < result.length; j++) result[j] -= 12;
    }
    while (result.length && result[0] < 0) {
        for (var k = 0; k < result.length; k++) result[k] += 12;
    }
    return uniqueSorted(result);
}

function noteClassForRole(role, fallback) {
    for (var noteClass in currentRoles) {
        if (currentRoles.hasOwnProperty(noteClass) && currentRoles[noteClass] === role) {
            return parseInt(noteClass, 10);
        }
    }
    return fallback;
}

// Voicing Scaler "7ths Inverted" : fondamentale en doubles octaves graves,
// puis quinte et septieme sous la fondamentale, tierce au-dessus.
function seventhsInverted(notes) {
    var source = uniqueSorted(notes);
    if (!source.length) return source;
    var rootClass = rootClassFor(source);
    var center = (source[0] + source[source.length - 1]) / 2;
    var root = nearestPitchClass(rootClass, center, 36, 96);
    var thirdClass = noteClassForRole(ROLE_THIRD, source[Math.min(1, source.length - 1)] % 12);
    var fifthClass = noteClassForRole(ROLE_FIFTH, source[Math.min(2, source.length - 1)] % 12);
    var seventhClass = noteClassForRole(ROLE_SEVENTH, source[source.length - 1] % 12);
    return uniqueSorted([
        root - 24,
        root - 12,
        nearestPitchClass(fifthClass, root - 5, 0, 127),
        nearestPitchClass(seventhClass, root - 1, 0, 127),
        nearestPitchClass(thirdClass, root + 4, 0, 127)
    ]);
}

// Reprend le dessin du preset Scaler : fondamentale sur trois octaves et
// tierce de l'accord entre les deux voix superieures.
function octavesAndInvertedThirds(notes) {
    var source = uniqueSorted(notes);
    if (!source.length) return source;
    var rootClass = rootClassFor(source);
    var center = (source[0] + source[source.length - 1]) / 2;
    var root = nearestPitchClass(rootClass, center, 36, 96);
    var thirdClass = noteClassForRole(ROLE_THIRD, source[Math.min(1, source.length - 1)] % 12);
    return uniqueSorted([
        root - 24,
        root - 12,
        nearestPitchClass(thirdClass, root + 4, 0, 127),
        root + 12
    ]);
}

function applyInversion(notes) {
    var source = uniqueSorted(notes);
    if (currentInversion === 0) return source;

    var compact = compactChordVoicing(notes);
    switch (currentInversion) {
        case 1: return rotateVoices(compact, 1);
        case 2: return rotateVoices(compact, 2);
        case 3: return dropVoicing(compact, [2]);
        case 4: return dropVoicing(compact, [2, 3]);
        case 5: return seventhsInverted(compact);
        case 6: return octavesAndInvertedThirds(compact);
    }
    return compact;
}

// Register intervient en toute derniere etape : il ne change ni l'inversion,
// ni le choix des voix effectue par Voice Grouping.
function applyRegister(notes) {
    var shift = currentRegister * 12;
    var shifted = [];
    for (var i = 0; i < notes.length; i++) shifted.push(notes[i] + shift);
    return uniqueSorted(shifted);
}

function buildPad(forceRetrigger) {
    if (!isRunning) return;
    if (currentPool.length === 0) return;

    // 1. Accord harmonique complet, sans fenetre Range.
    var harmonicNotes = compactChordVoicing(currentPool);

    // 2. Inversion, puis Voice Grouping comme traitement global Scaler.
    var invertedNotes = applyInversion(harmonicNotes);
    var groupedNotes = applyVoiceGrouping(invertedNotes);

    // 3. Register transpose uniquement le resultat final par octaves.
    var newNotes = applyRegister(groupedNotes);
    activeGroupedNotes = groupedNotes.slice();

    // 4. Calculer toStop et toPlay
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

function register(v) {
    currentRegister = Math.max(-2, Math.min(2, Math.round(v)));
    buildPad();
}

function register_select(v) {
    register(v);
    messnamed('pad_register', currentRegister);
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

function configureVoiceGroupingMenu() {
    if (!this.patcher || !this.patcher.getnamed) return;
    var menu = this.patcher.getnamed('pad_voice_grouping_ui');
    if (!menu) return;
    menu.message('clear');
    for (var i = 0; i < VOICE_GROUPING_PROFILES.length; i++) {
        menu.message('append', VOICE_GROUPING_PROFILES[i]);
    }
    menu.message('set', currentSpread);
}

function configureInversionMenu() {
    if (!this.patcher || !this.patcher.getnamed) return;
    var menu = this.patcher.getnamed('pad_inversion_menu');
    if (!menu) return;
    menu.message('clear');
    for (var i = 0; i < INVERSION_PROFILES.length; i++) {
        menu.message('append', INVERSION_PROFILES[i]);
    }
    menu.message('set', currentInversion);
}

function loadbang() {
    readClockDivisions();
    configureStrumMenu.call(this);
    configureVoiceGroupingMenu.call(this);
    configureInversionMenu.call(this);
    messnamed('mod_input', 'part_active', 'pad', 0);
}

function dynamicShiftForProfile(profile) {
    if (profile === 0) return 0;
    if (profile === 1) return 12;
    if (profile === 2) return 24;
    return null;
}

function prepareVoiceGroupingTransition(oldProfile, newProfile) {
    var oldShift = dynamicShiftForProfile(oldProfile);
    var newShift = dynamicShiftForProfile(newProfile);
    if (newShift === null) {
        dynamicTransitionShift = 0;
    } else {
        dynamicTransitionShift = newShift - (oldShift === null ? 0 : oldShift);
    }
}

function spread(v) {
    var nextProfile = Math.max(0, Math.min(VOICE_GROUPING_PROFILES.length - 1, Math.round(v)));
    prepareVoiceGroupingTransition(currentSpread, nextProfile);
    currentSpread = nextProfile;
    if (currentSpread !== 13) extractedVoicingOffsets = null;
    pendingControls.spread = currentSpread;
    pendingControls.spreadDirty = false;
    buildPad();
}

// Nouveau nom explicite, tout en conservant spread() pour les anciens patchers.
function voice_grouping(v) { spread(v); }

// Le umenu est un controle discret : valider immediatement la selection et
// publier sa valeur de base, sans attendre le mouse-up utilise par les sliders.
function voice_grouping_select(v) {
    spread(v);
    messnamed('pad_spread', currentSpread);
}

function polychain(v) {
    currentPolyChain = Math.max(1, Math.min(4, Math.round(v)));
    if (isRunning) buildPad(true);
}

function channel(v) {
    currentChannel = Math.max(1, Math.min(16, Math.round(v)));
}

function inversion(v) {
    currentInversion = Math.max(0, Math.min(6, Math.round(v)));
    if (isRunning) buildPad(true);
}

function chord_invert(v) {
    if (v) inversion(1);
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

function spread_preview(v) {
    pendingControls.spread = Math.max(0, Math.min(VOICE_GROUPING_PROFILES.length - 1, Math.round(v)));
    pendingControls.spreadDirty = pendingControls.spread !== currentSpread;
}

function voice_grouping_preview(v) { spread_preview(v); }

function vel_preview(v) {
    pendingControls.vel = Math.max(0, Math.min(127, Math.round(v)));
    pendingControls.velDirty = pendingControls.vel !== currentVel;
}

// Valide ensemble les contrôles modifiés lorsque le bouton de souris est relâché.
function controls_release() {
    var rebuild = false;
    if (pendingControls.spreadDirty) {
        prepareVoiceGroupingTransition(currentSpread, pendingControls.spread);
        currentSpread = pendingControls.spread;
        if (currentSpread !== 13) extractedVoicingOffsets = null;
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
    activeGroupedNotes = [];
}
