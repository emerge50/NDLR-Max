// drone_builder.js
// Moteur Drone pour le NDLR
//
// inlet 0 : messages nommés
//   scale [notes...]   : notes de la gamme (pour mode "key root" — déjà préfixé "scale" par scale_builder)
//   chord [notes...]   : notes de l'accord courant (fondamentale = premier élément)
//   position [1-6]     : octave de base (1=C1-B2, 2=C2-B3, 3=C3-B4, 4=C4-B5)
//   type [1-4]         : combinaison de notes
//                        1 = fondamentale seule
//                        2 = fondamentale + octave
//                        3 = fondamentale + quinte
//                        4 = fondamentale + quinte + octave
//   trigger [1-19]     : mode + cadence rythmique
//                        1-8  = key root mode (note = tonique de la gamme)
//                        9-19 = chord mode (note = fondamentale de l'accord)
//                        Cadences (mêmes pour les deux modes) :
//                          x1/x9  : sustain (pas de répétition)
//                          x2/x10 : temps 1 (downbeat)
//                          x3/x11 : temps 1 & 2
//                          x4/x12 : temps 1 & 3
//                          x5/x13 : temps 2 & 4
//                          x6/x14 : tous les temps (1&2&3&4)
//                          x7/x15 : tous les 3 temps
//                          x8/x16 : tous les 5 temps
//                          17     : chord + tous les 2 temps
//                          18     : chord + tous les 6 temps
//                          19     : chord + tous les 8 temps
//   beat               : tick d'horloge (1/48 de ronde) reçu de ndlr_main —
//                        fait avancer la cadence (synchro tempo/MIDI clock)
//   tempo [10-300]     : BPM (legacy / affichage — ne pilote plus le rythme)
//   vel [0-127]        : vélocité des notes envoyées
//   start              : activer le drone (reset de phase)
//   stop               : désactiver le drone et couper les notes actives
//   resetphase         : réaligne la phase sur le prochain "beat" (Start MIDI)
//   allnotesoff        : couper toutes les notes actives
//
// outlet 0 : NoteOn  — [note MIDI, vélocité]
// outlet 1 : NoteOff — [note MIDI, 0]

autowatch = 1;

inlets  = 1;
outlets = 2;

var currentScale    = [];   // notes de la gamme (MIDI, octave centrale)
var currentChord    = [];   // notes de l'accord courant (MIDI)
var currentPosition = 1;   // octave MIDI cible (0-4)
var currentType     = 1;   // type de combinaison (1-4)
var currentTrigger  = 1;   // trigger/cadence (1-19)
var currentTempo    = 90;  // BPM (legacy / cosmétique — le rythme est piloté par "beat")
var currentVel      = 100; // vélocité MIDI (0-127)
var isRunning              = false;
var isEnabled              = false; // état du bouton on/off local (indépendant du transport)
var globalTransportRunning = false; // true quand le transport global ndlr est actif
var activeNotes     = [];  // notes actuellement soutenues
var beatCount       = 0;   // compteur de "pas" de cadence
// Compteur de ticks absolu depuis le dernier resetphase. La cadence du Drone
// avance une fois par noire, soit tous les 96 ticks de l'horloge maître.
var absoluteTick    = 0;
var DRONE_STEP_TICKS = 96;
var DRONE_BAR_TICKS  = DRONE_STEP_TICKS * 4;
var currentPadQuant  = 0;
var pendingChord     = null;

// ── Helpers ───────────────────────────────────────────────────────────────────

function isChordMode() {
    return currentTrigger >= 9;
}

// Classe de note (0-11) de la fondamentale selon le mode
function getRootClass() {
    if (isChordMode()) {
        if (currentChord.length === 0) return -1;
        return currentChord[0] % 12;
    } else {
        if (currentScale.length === 0) return -1;
        return currentScale[0] % 12;
    }
}

// Construit la liste des notes MIDI à jouer
function buildNotes() {
    var rootClass = getRootClass();
    if (rootClass < 0) return [];

    // C-x = MIDI 12*(x+1) en convention Max (C4=60)
    var baseNote = 12 * (currentPosition + 1) + rootClass;

    // Contraindre pour laisser de la place aux intervalles (+12)
    while (baseNote > 115) baseNote -= 12;
    while (baseNote < 12)  baseNote += 12;

    var notes = [baseNote];

    switch (currentType) {
        case 2: notes.push(baseNote + 12);              break; // R + Octave
        case 3: notes.push(baseNote + 7);               break; // R + Quinte
        case 4: notes.push(baseNote + 7);
                notes.push(baseNote + 12);              break; // R + Q + Oct
    }

    return notes.filter(function(n) { return n >= 0 && n <= 127; });
}

// ── NoteOn / NoteOff ─────────────────────────────────────────────────────────

function sendNoteOff(notes) {
    for (var i = 0; i < notes.length; i++) {
        outlet(1, notes[i], 0);
    }
}

function sendNoteOn(notes) {
    for (var i = 0; i < notes.length; i++) {
        outlet(0, notes[i], currentVel);
    }
}

function stopActiveNotes() {
    if (activeNotes.length > 0) {
        sendNoteOff(activeNotes);
        activeNotes = [];
    }
}

// Joue les nouvelles notes (diff avec les notes actives)
function playNewNotes() {
    var newNotes = buildNotes();
    if (newNotes.length === 0) return;

    var toStop = activeNotes.filter(function(n) { return newNotes.indexOf(n) < 0; });
    var toPlay = newNotes.filter(function(n)    { return activeNotes.indexOf(n) < 0; });

    if (toStop.length > 0) sendNoteOff(toStop);

    activeNotes = newNotes;

    if (toPlay.length > 0) sendNoteOn(toPlay);
}

// Re-déclenche (NoteOff puis NoteOn)
function retrigger() {
    stopActiveNotes();
    playNewNotes();
}

// Les déclenchements issus de l'horloge sont exécutés en basse priorité afin
// qu'un changement harmonique arrivé dans le même cycle soit traité d'abord.
var cadenceRetriggerTask = new Task(function() {
    if (isRunning) retrigger();
}, this);

function scheduleCadenceRetrigger() {
    cadenceRetriggerTask.cancel();
    cadenceRetriggerTask.schedule(0);
}

function cancelCadenceRetrigger() {
    cadenceRetriggerTask.cancel();
}

// ── Rythme ────────────────────────────────────────────────────────────────────

// Retourne true si le beatCount courant doit déclencher une note
function shouldTriggerOnBeat(trig, b) {
    // Normalise vers un index cadence 0-10
    var cadence = (trig <= 8) ? (trig - 1) : (trig - 9);

    switch (cadence) {
        case 0: return false;                                   // sustain
        case 1: return (b % 4 === 0);                          // temps 1
        case 2: return (b % 4 === 0 || b % 4 === 1);           // 1 & 2
        case 3: return (b % 4 === 0 || b % 4 === 2);           // 1 & 3
        case 4: return (b % 4 === 1 || b % 4 === 3);           // 2 & 4
        case 5: return true;                                    // tous les temps
        case 6: return (b % 3 === 0);                          // tous les 3
        case 7: return (b % 5 === 0);                          // tous les 5
        default: return false;
    }
}

// Cadences 17-19 du mode Chord. "Down" désigne le temps et "up" le
// contretemps : la résolution doit donc être la croche (48 ticks), et non
// une simple répétition tous les 2/6/8 temps.
function shouldTriggerSpecialAtTick(trig, tickInBar) {
    switch (trig) {
        case 17: return tickInBar === 0   || tickInBar === 144 ||
                        tickInBar === 240 || tickInBar === 336;
        case 18: return tickInBar === 144 || tickInBar === 240 ||
                        tickInBar === 288;
        case 19: return tickInBar === 0   || tickInBar === 144 ||
                        tickInBar === 192 || tickInBar === 288;
        default: return false;
    }
}

function isSpecialChordCadence() {
    return currentTrigger >= 17 && currentTrigger <= 19;
}

function isSustainMode() {
    if (currentTrigger === 1 || currentTrigger === 9) return true;
    return false;
}

// Appelé à chaque tick de l'horloge maître. Les cadences ordinaires avancent
// à la noire ; les cadences 17-19 utilisent aussi les contretemps de croche.
function beat() {
    if (!isRunning) return;

    absoluteTick++;
    if (pendingChord && currentTrigger === 9 && currentPadQuant > 0) {
        var quantGrid = currentPadQuant === 1 ? 96 : 48;
        if (absoluteTick % quantGrid === 0) {
            currentChord = pendingChord;
            pendingChord = null;
            scheduleCadenceRetrigger();
        }
    }
    if (isSustainMode()) return;
    if (isSpecialChordCadence()) {
        if (shouldTriggerSpecialAtTick(currentTrigger, absoluteTick % DRONE_BAR_TICKS)) {
            scheduleCadenceRetrigger();
        }
        return;
    }
    if (absoluteTick % DRONE_STEP_TICKS === 0) {
        if (shouldTriggerOnBeat(currentTrigger, beatCount)) {
            scheduleCadenceRetrigger();
        }
        beatCount++;
    }
}

// ── API publique ──────────────────────────────────────────────────────────────

function start() {
    isEnabled = true;
    // Le bouton local arme le Drone ; seul le transport global l'autorise a jouer.
    isRunning = globalTransportRunning;
    messnamed('mod_input', 'part_active', 'drone', 1);
    resetphase();
}

// Réaligne la phase du drone sur le prochain "beat" (sur Start MIDI de
// l'horloge maître), comme pour les motifs.
function resetphase() {
    cancelCadenceRetrigger();
    beatCount   = 0;
    absoluteTick = 0;
    if (!globalTransportRunning) return;
    if (isSustainMode()) {
        playNewNotes();
    } else {
        if (isSpecialChordCadence()
                ? shouldTriggerSpecialAtTick(currentTrigger, 0)
                : shouldTriggerOnBeat(currentTrigger, beatCount)) {
            retrigger();
        }
        if (!isSpecialChordCadence()) beatCount++;
    }
}

function stop() {
    cancelCadenceRetrigger();
    isEnabled   = false;
    isRunning   = false;
    messnamed('mod_input', 'part_active', 'drone', 0);
    beatCount   = 0;
    absoluteTick = 0;
    stopActiveNotes();
}

function on(v) {
    if (v) start();
    else stop();
}

// ── Synchro horloge externe (MIDI Start/Stop) ───────────────────────────────
// Appelé sur Stop MIDI : coupe le son sans changer l'état du bouton on/off
// (isEnabled), pour pouvoir redémarrer instantanément sur le prochain Start.
function transportstop() {
    cancelCadenceRetrigger();
    globalTransportRunning = false;
    isRunning   = false;
    beatCount   = 0;
    absoluteTick = 0;
    stopActiveNotes();
}

// Appelé sur Start MIDI : ne (re)démarre que si le module est activé
// (isEnabled, via son bouton on/off local).
function transportstart() {
    globalTransportRunning = true;
    if (!isEnabled) return;
    isRunning = true;
    resetphase();
}

// Reçoit les notes de la gamme depuis scale_builder (déjà préfixées "scale")
function scale() {
    var args = arrayfromargs(arguments).filter(function(x) { return typeof x === "number"; });
    currentScale = args;
    if (isRunning && !isChordMode()) {
        cancelCadenceRetrigger();
        retrigger();
    }
}

// Reçoit les notes de l'accord courant (envoyées via "prepend chord")
function chord() {
    var args = arrayfromargs(arguments).filter(function(x) { return typeof x === "number"; });
    if (isRunning && currentTrigger === 9 && currentPadQuant > 0) {
        pendingChord = args;
        return;
    }
    currentChord = args;
    if (isRunning && isChordMode()) {
        cancelCadenceRetrigger();
        // Un nouvel accord est prioritaire sur la cadence. La quantification
        // explicite du Pad reste gérée ci-dessus.
        retrigger();
    }
}

function pad_quant(v) {
    currentPadQuant = Math.max(0, Math.min(2, Math.round(v)));
    if (currentPadQuant === 0 && pendingChord) {
        currentChord = pendingChord;
        pendingChord = null;
        if (isRunning && currentTrigger === 9) {
            cancelCadenceRetrigger();
            retrigger();
        }
    }
}

function position(v) {
    currentPosition = Math.max(0, Math.min(4, Math.round(v)));
    if (isRunning && isSustainMode()) playNewNotes();
}

function type(v) {
    currentType = Math.max(1, Math.min(4, v));
    if (isRunning && isSustainMode()) playNewNotes();
}

function triggerLabel(v) {
    var labels = [
        'Root - Sustain',
        'Root - Beat 1',
        'Root - Beats 1 & 2',
        'Root - Beats 1 & 3',
        'Root - Beats 2 & 4',
        'Root - Every beat',
        'Root - Every 3 beats',
        'Root - Every 5 beats',
        'Chord - Sustain',
        'Chord - Beat 1',
        'Chord - Beats 1 & 2',
        'Chord - Beats 1 & 3',
        'Chord - Beats 2 & 4',
        'Chord - Every beat',
        'Chord - Every 3 beats',
        'Chord - Every 5 beats',
        'Chord - Beat 1 + offbeats 2, 3, 4',
        'Chord - Offbeats 2, 3 + beat 4',
        'Chord - Beats 1, 3, 4 + offbeat 2'
    ];
    return labels[Math.max(1, Math.min(19, Math.round(v))) - 1];
}

function publishTriggerLabel() {
    messnamed('drone_trigger_label', triggerLabel(currentTrigger));
}

function trigger(v) {
    currentTrigger = Math.max(1, Math.min(19, v));
    publishTriggerLabel();
    // Ne pas réinitialiser beatCount/absoluteTick : absoluteTick compte
    // depuis le dernier resetphase et reste donc aligné sur la grille de
    // l'horloge maître.
    if (isRunning && isSustainMode()) {
        retrigger();
    }
}

// Le tempo n'est plus utilisé pour le séquençage (piloté par "beat" via
// ndlr_main, cf. motif_builder.js) ; conservé pour affichage / compatibilité.
function tempo(v) {
    currentTempo = Math.max(10, Math.min(300, v));
}

function vel(v) {
    currentVel = Math.max(0, Math.min(127, Math.round(v)));
}

function allnotesoff() {
    stop();
}

function loadbang() {
    publishTriggerLabel();
    messnamed('mod_input', 'part_active', 'drone', 0);
    // Pas d'autre action au démarrage — attend un "start" explicite
}
