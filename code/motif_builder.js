// motif_builder.js
// Moteur Motif pour le NDLR — arpégiateur mélodique (une note à la fois)
//
// inlet 0 : messages nommés
//   pool [notes...]    : pool complet des notes de l'accord (depuis chord_builder outlet 1)
//   scale [notes...]   : notes de la gamme courante (depuis scale_builder, pour Pattern type SCALE)
//   position [0-4]     : zone MIDI
//                        0=Very Low  (12-47 / C0-B2)
//                        1=Low       (24-59 / C1-B3)
//                        2=Mid       (48-71 / C3-B4)
//                        3=High      (60-83 / C4-B5)
//                        4=Very High (72-95 / C5-B6)
//   pattern  [1-20]    : charge un preset (séquence de 16 valeurs) dans l'éditeur de pattern
//   pattlen  [1-16]    : nombre de pas actifs
//   variation [1-6]    : direction de lecture
//                        1=avant  2=arrière  3=ping-pong  4=ping-pong+répétition fins
//                        5=impairs puis pairs  6=aléatoire
//   clkdiv   [1-21]    : division d'horloge
//                        1=1nd  2=1n   3=1nt   4=2nd  5=2n   6=2nt
//                        7=4nd  8=4n   9=4nt  10=8nd 11=8n  12=8nt
//                       13=16nd 14=16n 15=16nt 16=32nd 17=32n 18=32nt
//                       19=64nd 20=64n 21=128n
//   velocity [1-127]   : vélocité des notes
//   tempo    [10-300]  : BPM
//   offset   [0-3]     : décalage de démarrage en 1/16 (pour déphasage entre Motif 1 & 2)
//   start              : démarrer le motif (avec délai offset si > 0)
//   stop               : arrêter le motif
//   allnotesoff        : couper toutes les notes actives
//
// ── Pattern Editor (NDLR rev2) ──────────────────────────────────────────────
//   pattern_type [0-2]      : type de pattern  0=CHORD  1=SCALE  2=CHROMATIC
//   pattern_step [1-16] [v] : valeur NDLR 1-based (CHORD 1-20, SCALE 1-40, CHROMATIC 1-60)
//   pattern_set  [v1..v16]  : règle les 16 valeurs de l'éditeur en une fois
//   pattern_all_mod [0-127] : offset temporaire de toutes les valeurs du pattern actif (64 = neutre)
//   pattern_custom_save [21-40] : sauvegarde le pattern courant (+ pattlen + type)
//   pattern_custom_load [1-40] : charge un preset fixe ou un slot utilisateur
//   motif_id     [1-2]      : identifiant du motif (pour la sortie mod matrix)
//
// ── Rhythm Editor — Division & Ratchet ──────────────────────────────────────
//   rhythm_rate [0-20]              : division musicale 0=1nd … 7=4n(défaut) … 20=128n
//   rhythm_step_ratchet [1-32] [1-4]: répétitions rapides d'un pas NOTE (1=normal,
//                                     2=double, 3=triple, 4=quad). La note est répétée
//                                     N fois dans la durée du pas, espacées de step/N.
//   rhythm_ratchet [v1..v32]        : définir tous les comptes de ratchet en une fois.
//
// outlet 0 : NoteOn  (note MIDI individuelle)
// outlet 1 : NoteOff (note MIDI individuelle)
// outlet 2 : UI / Mod Matrix
//            "pattern_set v1..v16"  : resync du multislider (après preset/pattern_step/pattern_set/load)
//            "pattern_val id value" : valeur du pas Pattern courant, pour la mod matrix
//            "pattern_max n"        : plage max du multislider (CHORD=20 SCALE=40 CHROMATIC=60)
//            "pattlen n"            : longueur active du pattern (resync affichage)
//            "pattern_type n"       : resync du sélecteur de type (après load slot)
//            "pattern_slot n"       : resync du sélecteur de slot (après load OU après
//                                     pattern_custom_save, pour refléter immédiatement
//                                     un pattern poussé en live, ex: Perlin Noise)
//            "rhythm_rate n"        : resync de l'indicateur Division (0-20)
//            "rhythm_ratchet v1..v32" : resync des comptes de ratchet

autowatch = 1;

inlets  = 1;
outlets = 3;

// ── État ───────────────────────────────────────────────────────────────────────

var fullPool      = [];   // pool complet reçu de chord_builder
var filteredPool  = [];   // pool filtré par position
var fullScale     = [];   // notes de gamme reçues de scale_builder
var filteredScale = [];   // gamme filtrée par position
var currentNote   = -1;   // note en cours de jeu

// ── Pattern Editor (NDLR rev2) ───────────────────────────────────────────────
var motifId       = 1;    // 1 ou 2 — identifiant pour la sortie mod matrix
var patternType   = 0;    // 0=CHORD  1=SCALE  2=CHROMATIC
var customPattern = [1, 2, 3, 4, 5, 6, 7, 8, 7, 6, 5, 4, 3, 2, 1, 2];  // valeurs NDLR 1-based
var patternGlobalMod = 0; // offset temporaire appliqué à toutes les valeurs du pattern actif

var currentPosition  = 1;
var currentPattern   = 1;
var currentPatternSlot = 1;
var currentPattLen   = 8;
var currentVariation = 1;
var currentClkDiv    = 8;   // 4n (noire) par défaut
var currentVelocity  = 100;
var currentVelocityLow = 55; // pour les sept motifs d'accent, en % du niveau haut
var currentHumanize  = 0;   // niveau firmware 0-10
var currentTempo     = 90;  // ne pilote plus le séquenceur, mais calibre la marge Tie→Note
var currentOffset    = 0;   // 0-3 pas de 1/16
var motif1BarTicks   = 0;   // référence de mesure pour l'Euclidien du Motif 2
var isRunning             = false;
var isEnabled             = false; // état du bouton on/off local (indépendant du transport)
var globalTransportRunning = false; // true quand le transport global ndlr est actif

var patternStep = 0;
var patternEditStep = 0;
var pingDir     = 1;   // utilisé par ping-pong

// ── Horloge basée sur "beat" (tick = 1/384 de ronde = 1 noire/96, reçu de ndlr_main) ─
// Table du nombre de ticks par pas selon currentClkDiv (1-21).
// Valeurs dérivées de la table en ticks MIDI standard (480 ppqn / noire) ÷ 5
// (1 "beat" ndlr = 5 ticks MIDI standard) :
//   1=1nd(576)  2=1n(384)   3=1nt(256)  4=2nd(288)  5=2n(192)   6=2nt(128)
//   7=4nd(144)  8=4n(96)    9=4nt(64)   10=8nd(72)  11=8n(48)   12=8nt(32)
//   13=16nd(36) 14=16n(24)  15=16nt(16) 16=32nd(18) 17=32n(12)  18=32nt(8)
//   19=64nd(9)  20=64n(6)   21=128n(3)
var TICKS_PER_STEP = {
    1: 576, 2: 384, 3: 256, 4: 288, 5: 192, 6: 128, 7: 144,
    8: 96,  9: 64,  10: 72, 11: 48, 12: 32, 13: 36, 14: 24,
    15: 16, 16: 18, 17: 12, 18: 8,  19: 9,  20: 6,  21: 3
};
var TICKS_PER_SIXTEENTH = 24;  // 96/4

// ── Division rythmique ────────────────────────────────────────────────────────
// Nombre de ticks par pas à 96 PPQN. Même table que clk_divisions.json.
var RHYTHM_DIVISION_TICKS = [
    576, 384, 256, 288, 192, 128, 144, 96, 64, 72, 48, 32,
    36, 24, 16, 18, 12, 8, 9, 6, 3
];
var rhythmRateIdx = 7;   // défaut : 4n (noire)

// Compteur de ticks ABSOLU depuis le dernier resetphase (jamais remis à 0
// par clkdiv/pattern/variation/pattern_type) : un pas survient quand
// absoluteTick % ticksPerStep() === 0, ce qui garde le séquenceur aligné
// sur la grille de l'horloge maître même si ticksPerStep() change en cours
// de route (ex: changement de clkdiv suite à un changement de mode/type).
var absoluteTick          = 0;
var gateTicksRemaining    = 0; // ticks restants avant le note-off automatique (gate)
var currentGate           = 102; // 5-127, comme le NDLR matériel
var currentAccent         = 1;   // 1=rhythm, 2=humanized, 3=fixed, 4-10=preset
var offsetTicksRemaining  = 0; // ticks restants avant le démarrage effectif (offset)

// ── Rhythm Editor (NDLR rev2) ────────────────────────────────────────────────
// Jusqu'a 32 pas, comme le Rhythm Editor du NDLR : 0=REST  1=NOTE  2=TIE
//   REST : couper la note précédente, ne pas avancer le Pattern (pas comptabilisé dans "beats")
//   NOTE : avancer le Pattern et jouer la note suivante
//   TIE  : prolonger la note précédente (pas de coupure, pas de nouvelle attaque),
//          ne pas avancer le Pattern
var MAX_RHYTHM_STEPS = 32;
var rhythmState   = [];
var rhythmVel     = [];
var rhythmRatchet = [];   // 1-4 répétitions rapides par pas (1=normal)
for (var rhythmInit = 0; rhythmInit < MAX_RHYTHM_STEPS; rhythmInit++) {
    rhythmState.push(1);
    rhythmVel.push(100);
    rhythmRatchet.push(1);
}
// normalRhythm* : pattern "non tourné" du mode normal,
// tel qu'édité par l'utilisateur. rhythmState/rhythmVel restent le pattern
// JOUÉ : en mode normal c'est normalRhythmState/normalRhythmVel décalés de
// euclidRotate pas (cf. applyNormalRotation), en mode euclidien c'est le motif
// de Bjorklund décalé de euclidRotate pas (cf. regenerateEuclid). Rotate est
// ainsi actif dans les deux modes, de façon non destructive (remettre
// euclidRotate à 0 restaure exactement le pattern édité).
var normalRhythmState   = rhythmState.slice();   // état libre, avant application de Rotate
var normalRhythmVel     = rhythmVel.slice();     // idem pour les vélocités
var normalRhythmRatchet = rhythmRatchet.slice(); // idem pour les comptes de ratchet

// ── État du moteur de ratchet ─────────────────────────────────────────────────
// Quand un pas NOTE a ratchetCount > 1, le moteur fire N coups rapides à
// l'intérieur du même pas, espacés de ticksPerStep/N ticks.
var ratchetPending  = 0;   // sous-frappes restantes à déclencher
var ratchetInterval = 0;   // ticks entre deux sous-frappes
var ratchetSubCount = 0;   // compteur de sous-ticks depuis la dernière frappe
var ratchetNote     = -1;  // note à répéter (fixée par playNextNote)
var ratchetBaseVel  = 0;   // vélocité de reference (note principale non modulee)
var ratchetTotal    = 1;   // nombre total de coups (N) pour le pas courant
// Vrai quand le pas NOTE courant est immédiatement suivi d'un TIE. Dans ce
// cas le gate ne doit pas couper la note : elle restera active jusqu'au
// prochain pas NOTE ou REST. Pour un ratchet, seule la dernière sous-frappe
// est tenue afin de conserver les réattaques précédentes.
var tieHoldPending  = false;
// Mode de velocite ratchet : 0=egale  1=croissante (chaque coup plus fort)  2=decroissante
var ratchetVelMode  = 0;
var rhythmLen     = 16;   // longueur active du pattern rythme (4-32 dans l'editeur)
var rhythmStep    = 0;    // position courante dans le pattern rythme

// ── Mode Euclidéen (Firmware 3) ──────────────────────────────────────────────
var rhythmMode    = 0;    // 0=normal (édition libre)  1=euclidéen
var euclidPulses  = 4;    // nombre de pulsations (1-16)
var euclidRotate  = 0;    // rotation du motif (0-15)

// 4 slots de pattern (A-D) — chacun stocke {state, vel, len, mode, pulses, rotate}
var rhythmSlots   = new Array(20); // emplacements utilisateur 21-40

// 20 rythmes fixes (1-20), suivis des 20 emplacements utilisateur (21-40).
// 0=REST, 1=NOTE, 2=TIE. Les longueurs sont celles des tableaux.
var RHYTHM_PRESETS = {
    1:[1,1,1,1,1,1,1,1],
    2:[1,0,1,0,1,0,1,0],
    3:[1,0,0,1,0,0,1,0],
    4:[1,0,1,1,0,1,0,1],
    5:[1,2,1,0,1,2,1,0],
    6:[1,0,0,1,0,1,0,0],
    7:[1,0,1,0,0,1,0,1],
    8:[1,1,0,1,1,0,1,0],
    9:[1,0,0,0,1,0,1,0,0,0,1,0],
    10:[1,0,1,0,1,1,0,1,0,1,0,0],
    11:[1,2,0,1,0,1,2,0,1,0,1,0],
    12:[1,0,0,1,0,0,1,0,1,0,0,1],
    13:[1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,1],
    14:[1,1,0,0,1,0,1,0,1,1,0,0,1,0,1,0],
    15:[1,0,2,0,1,0,2,0,1,0,2,0,1,0,2,0],
    16:[1,0,0,1,0,1,0,0,1,0,1,0,0,1,0,1],
    17:[1,0,1,1,0,1,0,1,1,0,1,0,1,0,0,1],
    18:[1,2,1,0,0,1,2,0,1,0,1,0,0,1,0,0],
    19:[1,0,0,1,0,1,1,0,0,1,0,0,1,1,0,1],
    20:[1,0,1,0,1,0,0,1,0,1,0,1,1,0,0,1]
};
var rhythmSlotIdx = 0;    // slot actif (0=A, 1=B, 2=C, 3=D)
var currentRhythmSlot = 1;

// Initialise rhythmState/rhythmLen depuis RHYTHM_PRESETS[currentRhythmSlot] :
// sans ce bloc, rhythmLen restait à sa valeur générique (16, fixée plus haut
// avant que RHYTHM_PRESETS existe) au lieu de la vraie longueur du rythme 1
// (8 pas) — rhythm_slot affichait bien "1" mais rhythm_len ne correspondait
// pas au rythme réellement enregistré sous ce slot. Même logique que
// rhythm_pattern_load(), sans les outlet() (dumpstate()/loadbang s'en
// chargent normalement une fois le patch chargé).
(function initDefaultRhythm() {
    var preset = RHYTHM_PRESETS[currentRhythmSlot];
    if (!preset) return;
    for (var p = 0; p < MAX_RHYTHM_STEPS; p++) {
        rhythmState[p] = p < preset.length ? preset[p] : 0;
    }
    rhythmLen = Math.max(4, Math.min(MAX_RHYTHM_STEPS, preset.length));
    normalRhythmState = rhythmState.slice();
    normalRhythmVel = rhythmVel.slice();
})();

// NOTE : l'ancien moteur "Perlin Noise" interne (pnoiseMode, generation
// continue sans pattern figue) a ete retire — remplace par le module externe
// b_perlin_noise.maxpat / ndlr_perlin_jsui.js, qui genere un pattern STATIQUE
// de N valeurs (conforme au manuel NDLR) et le pousse ici via pattlen() +
// pattern_set() + pattern_custom_save(39/40).

// ── 20 Patterns (16 pas chacun) ───────────────────────────────────────────────
// Valeurs = indices dans filteredPool (modulo pool.length automatique)

var PATTERNS = {
    1:  [0, 1, 2, 3, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1, 0, 1],  // Up-Down
    2:  [0, 2, 4, 1, 3, 5, 2, 4, 6, 3, 5, 7, 4, 6, 5, 3],  // Third Leaps
    3:  [0, 2, 0, 3, 0, 4, 0, 5, 0, 4, 0, 3, 0, 2, 0, 1],  // Root Pivot
    4:  [0, 2, 1, 3, 2, 4, 3, 5, 4, 6, 5, 7, 6, 5, 4, 3],  // Ascending Zigzag
    5:  [0, 4, 1, 4, 2, 4, 3, 4, 2, 4, 1, 4, 0, 4, 1, 2],  // High Drone
    6:  [0, 1, 2, 0, 1, 2, 3, 1, 2, 3, 4, 2, 3, 4, 5, 3],  // Cascade
    7:  [0, 2, 4, 6, 1, 3, 5, 7, 0, 2, 4, 6, 1, 3, 5, 4],  // Odd-Even
    8:  [0, 2, 1, 2, 0, 2, 1, 2, 0, 3, 1, 3, 0, 3, 1, 3],  // Alberti
    9:  [0, 1, 3, 0, 1, 3, 5, 0, 1, 3, 5, 7, 3, 5, 7, 5],  // Chord Staircase
    10: [0, 3, 5, 3, 0, 4, 6, 4, 0, 3, 5, 3, 1, 4, 6, 4],  // Bass + Chord
    11: [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 4, 3, 2, 1],  // Double Echo
    12: [0, 7, 1, 6, 2, 5, 3, 4, 3, 5, 2, 6, 1, 7, 0, 4],  // Mirror
    13: [0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 2],  // Clave
    14: [0, 1, 2, 4, 0, 1, 3, 4, 0, 2, 3, 4, 0, 1, 2, 3],  // Rhythmic
    15: [0, 2, 4, 7, 0, 2, 4, 7, 0, 2, 5, 7, 0, 3, 5, 7],  // Pentatonic Feel
    16: [0, 4, 2, 6, 1, 5, 3, 7, 0, 4, 2, 6, 1, 5, 3, 5],  // Alternating Pairs
    17: [0, 1, 3, 2, 4, 3, 5, 4, 6, 5, 7, 6, 8, 7, 6, 5],  // Spiral
    18: [0, 1, 0, 2, 1, 3, 2, 4, 3, 5, 4, 6, 5, 7, 6, 4],  // Linked Steps
    19: [0, 3, 1, 4, 2, 5, 3, 6, 4, 7, 5, 4, 3, 5, 2, 4],  // Fourth Leaps
    20: [0, 2, 5, 3, 0, 4, 6, 2, 0, 3, 5, 7, 2, 4, 6, 0],  // Rotating
};

// ── Ranges MIDI par position ──────────────────────────────────────────────────

var POSITION_RANGES = {
    0: [12, 47],   // Very Low  — C0-B2
    1: [24, 59],   // Low       — C1-B3
    2: [48, 71],   // Mid       — C3-B4
    3: [60, 83],   // High      — C4-B5
    4: [72, 95],   // Very High — C5-B6
};

// ── Helpers ───────────────────────────────────────────────────────────────────

function filterPool() {
    var range = POSITION_RANGES[currentPosition] || POSITION_RANGES[2];
    filteredPool = fullPool.filter(function(n) {
        return n >= range[0] && n <= range[1];
    });
    // Fallback si le filtre est trop agressif
    if (filteredPool.length === 0 && fullPool.length > 0) {
        // Prendre les notes les plus proches du centre de la plage
        var center = (range[0] + range[1]) / 2;
        var sorted = fullPool.slice().sort(function(a, b) {
            return Math.abs(a - center) - Math.abs(b - center);
        });
        filteredPool = sorted.slice(0, Math.min(8, sorted.length)).sort(function(a, b) { return a - b; });
    }
}

function filterScale() {
    var range = POSITION_RANGES[currentPosition] || POSITION_RANGES[2];
    if (fullScale.length === 0) {
        filteredScale = [];
        return;
    }

    // scale_builder fournit une seule octave, dont fullScale[0] est la tonique.
    // Position doit transposer cette tonique dans sa propre plage ; filtrer
    // directement la liste source faisait partager la meme hauteur a Very
    // Low/Low et a Mid/High tant que cette octave croisait les deux plages.
    var octaveShift = Math.ceil((range[0] - fullScale[0]) / 12);
    filteredScale = fullScale.map(function(n) {
        return n + octaveShift * 12;
    });
}

// ── Algorithme Euclidéen (Bjorklund) ─────────────────────────────────────────
// Distribue "pulses" pulsations le plus uniformément possible sur "steps" pas.
function bjorklund(steps, pulses) {
    pulses = Math.max(0, Math.min(steps, Math.round(pulses)));
    // Array.fill() n'existe pas dans le moteur JS classique de Max.
    // Ces branches couvrent notamment Beats=Length : les construire a la
    // main evite de conserver le motif precedent avec son dernier REST.
    if (pulses === 0 || pulses === steps) {
        var uniform = [];
        var state = pulses === steps ? 1 : 0;
        for (var u = 0; u < steps; u++) uniform.push(state);
        return uniform;
    }

    var counts     = [];
    var remainders = [pulses];
    var divisor    = steps - pulses;
    var level      = 0;

    while (true) {
        counts.push(Math.floor(divisor / remainders[level]));
        remainders.push(divisor % remainders[level]);
        divisor = remainders[level];
        level++;
        if (remainders[level] <= 1) break;
    }
    counts.push(divisor);

    var pattern = [];
    function build(lvl) {
        if (lvl === -1)      pattern.push(0);
        else if (lvl === -2) pattern.push(1);
        else {
            for (var i = 0; i < counts[lvl]; i++) build(lvl - 1);
            if (remainders[lvl] !== 0) build(lvl - 2);
        }
    }
    build(level);

    // Faire commencer le motif sur une pulsation
    var idx = pattern.indexOf(1);
    if (idx > 0) pattern = pattern.slice(idx).concat(pattern.slice(0, idx));
    return pattern;
}

function rotateArray(arr, n) {
    var len = arr.length;
    if (len === 0) return arr;
    n = ((n % len) + len) % len;
    return arr.slice(n).concat(arr.slice(0, n));
}

function rotateArrayClockwise(arr, n) {
    return rotateArray(arr, -n);
}

// En mode euclidien, Velocity et Ratchet appartiennent au pas et doivent
// suivre exactement la meme rotation que NOTE/REST/TIE.
function applyEuclideanAttributeRotation() {
    if (rhythmMode !== 1) return;
    var rv = rotateArrayClockwise(normalRhythmVel.slice(0, rhythmLen), euclidRotate);
    var rr = rotateArrayClockwise(normalRhythmRatchet.slice(0, rhythmLen), euclidRotate);
    for (var i = 0; i < rhythmLen; i++) {
        rhythmVel[i]     = rv[i];
        rhythmRatchet[i] = rr[i];
    }
}

// Régénère rhythmState[0..rhythmLen-1] à partir de l'algorithme euclidéen
function regenerateEuclid() {
    if (rhythmMode !== 1) return;
    var pat = bjorklund(rhythmLen, euclidPulses);
    pat = rotateArrayClockwise(pat, euclidRotate);
    for (var i = 0; i < MAX_RHYTHM_STEPS; i++) {
        rhythmState[i] = (i < rhythmLen) ? pat[i] : 0;
    }
    applyEuclideanAttributeRotation();
}

// Traduit un index AFFICHE (position telle que montree par la roue
// ndlr_rhythm_orbit.js, qui n'a plus connaissance locale de la rotation) en
// index de BASE (normalRhythmState/normalRhythmVel), pour qu'un clic sur la
// roue en mode normal edite le bon pas meme quand le pattern est decale par
// Rotate. Le moteur est seul autoritaire pour la rotation ; la roue se
// contente d'afficher ce qu'on lui repousse.
function displayToBase(i) {
    var n = ((euclidRotate % rhythmLen) + rhythmLen) % rhythmLen;
    return ((i - n) % rhythmLen + rhythmLen) % rhythmLen;
}

// Transforme le rythme actuellement JOUE/AFFICHE en nouvelle base du mode
// normal. Le motif euclidien contient deja Rotate ; on applique donc la
// rotation inverse avant de le stocker, afin que applyNormalRotation() rende
// exactement le meme peuplement et que les editions suivantes ne le decalent
// pas une seconde fois.
function captureCurrentRhythmAsNormalBase() {
    var n = ((euclidRotate % rhythmLen) + rhythmLen) % rhythmLen;
    var rs = rotateArray(rhythmState.slice(0, rhythmLen), n);
    var rv = rotateArray(rhythmVel.slice(0, rhythmLen), n);
    var rr = rotateArray(rhythmRatchet.slice(0, rhythmLen), n);

    for (var i = 0; i < MAX_RHYTHM_STEPS; i++) {
        normalRhythmState[i]   = i < rhythmLen ? rs[i] : rhythmState[i];
        normalRhythmVel[i]     = i < rhythmLen ? rv[i] : rhythmVel[i];
        normalRhythmRatchet[i] = i < rhythmLen ? rr[i] : rhythmRatchet[i];
    }
}

// Recalcule rhythmState/rhythmVel (JOUÉS) à partir de normalRhythmState/
// normalRhythmVel (pattern édité par l'utilisateur) décalés de euclidRotate
// pas. Symétrique de regenerateEuclid() pour le mode normal — c'est ce qui
// rend Rotate actif aussi hors mode euclidien.
function applyNormalRotation() {
    if (rhythmMode !== 0) return;
    var rs = rotateArrayClockwise(normalRhythmState.slice(0, rhythmLen), euclidRotate);
    var rv = rotateArrayClockwise(normalRhythmVel.slice(0, rhythmLen), euclidRotate);
    var rr = rotateArrayClockwise(normalRhythmRatchet.slice(0, rhythmLen), euclidRotate);
    for (var i = 0; i < rhythmLen; i++) {
        rhythmState[i]   = rs[i];
        rhythmVel[i]     = rv[i];
        rhythmRatchet[i] = rr[i];
    }
}

// Maintient les contrôles euclidiens dans la géométrie du rythme. Cette
// normalisation doit aussi être faite quand Length change (et pas seulement
// quand Beats/Rotate sont manipulés directement), sinon l'interface peut
// afficher plus de frappes que de pas.
function clampEuclidControls() {
    euclidPulses = Math.max(1, Math.min(rhythmLen, Math.round(euclidPulses)));
    euclidRotate = Math.max(0, Math.min(rhythmLen - 1, Math.round(euclidRotate)));
}

function ticksPerStep() {
    return RHYTHM_DIVISION_TICKS[rhythmRateIdx];
}

// Marge de réattaque visée : environ 20 ms, avec au moins 3 ticks. Elle
// augmente aux tempos rapides pour rester perceptible par les synthés MIDI,
// tout en restant strictement plus courte qu'un pas rythmique.
function tieRetriggerGapTicks() {
    var targetMs = 20;
    var tickMs = 60000 / (currentTempo * 96);
    var desired = Math.max(3, Math.ceil(targetMs / tickMs));
    return Math.min(Math.max(1, ticksPerStep() - 1), desired);
}

// Calcule la velocite du i-ieme coup d'un ratchet (i=0 = premier coup/note principale).
// total = nombre total de coups (N). baseVel = velocite de reference.
// Mode 0 : egale — tous les coups a baseVel.
// Mode 1 : croissante — 1er coup le plus faible, dernier a baseVel.
// Mode 2 : decroissante — 1er coup a baseVel, dernier le plus faible.
function ratchetVelForHit(i, total, baseVel) {
    if (ratchetVelMode === 0 || total <= 1) return baseVel;
    if (ratchetVelMode === 1) return Math.max(1, Math.round(baseVel * (i + 1) / total));
    return Math.max(1, Math.round(baseVel * (total - i) / total));
}

function effectivePatternValueAt(i) {
    var max = patternMax();
    var base = customPattern[i];
    return Math.max(1, Math.min(max, Math.round(base + patternGlobalMod)));
}

function effectivePatternList() {
    var vals = [];
    for (var i = 0; i < currentPattLen; i++) vals.push(effectivePatternValueAt(i));
    return vals;
}

function emitPatternPreview() {
    if (typeof messnamed === "undefined") return;
    if (patternGlobalMod === 0) {
        messnamed("pattern_active_M" + motifId, "clearpreview");
    } else {
        messnamed.apply(this, ["pattern_active_M" + motifId, "preview"].concat(effectivePatternList()));
    }
}

function getPatternValue() {
    // ── Mode Pattern standard ─────────────────────────────────────────────────
    var pat = customPattern;
    var len = Math.min(currentPattLen, pat.length);
    var idx;

    switch (currentVariation) {
        case 1:  // Avant
            idx = patternStep % len;
            patternStep = (patternStep + 1) % len;
            break;

        case 2:  // Arrière
            idx = (len - 1) - (patternStep % len);
            patternStep = (patternStep + 1) % len;
            break;

        case 3:  // Ping-Pong (sans répétition des extrêmes)
            idx = patternStep;
            patternStep += pingDir;
            if (patternStep >= len) {
                pingDir = -1;
                patternStep = Math.max(0, len - 2);
            } else if (patternStep < 0) {
                pingDir = 1;
                patternStep = Math.min(1, len - 1);
            }
            break;

        case 4:  // Ping-Pong avec répétition des extrêmes
            idx = patternStep;
            patternStep += pingDir;
            if (patternStep >= len) {
                pingDir = -1;
                patternStep = len - 1;
            } else if (patternStep < 0) {
                pingDir = 1;
                patternStep = 0;
            }
            break;

        case 5:  // Notes impaires puis paires
            var odds  = [];
            var evens = [];
            for (var i = 0; i < len; i++) {
                if (i % 2 === 0) evens.push(i);
                else             odds.push(i);
            }
            var combined = odds.concat(evens);
            idx = combined[patternStep % combined.length];
            patternStep = (patternStep + 1) % combined.length;
            break;

        case 6:  // Aléatoire
            idx = Math.floor(Math.random() * len);
            break;

        default:
            idx = patternStep % len;
            patternStep = (patternStep + 1) % len;
    }

    // Index réellement joué, après application de la variation du pattern.
    var effectiveValue = effectivePatternValueAt(idx);
    outlet(2, "pattern_beat", idx + 1);
    if (typeof messnamed !== "undefined") {
        messnamed("pattern_active_M" + motifId, "active",
            idx + 1, effectiveValue, len, patternMax());
    }
    return effectiveValue;
}

// Convertit une valeur de Pattern SCALE (1-based) en note MIDI.
// fullScale contient une octave de la gamme courante. La valeur du Pattern
// doit donc avancer diatoniquement au-dela de cette octave au lieu de reboucler
// sur les memes notes : avec 7 degres, 8 = degre 1 + 1 octave, 15 = degre 1
// + 2 octaves, etc. filteredScale[0] fournit la tonique transposee dans la
// zone choisie par Position.
function scaleNoteForPatternValue(value) {
    if (fullScale.length === 0 || filteredScale.length === 0) return -1;

    var zeroBased = Math.max(0, Math.round(value) - 1);
    var scaleLen  = fullScale.length;
    var degree    = zeroBased % scaleLen;
    var octave    = Math.floor(zeroBased / scaleLen);
    var interval  = fullScale[degree] - fullScale[0];

    return Math.max(0, Math.min(127,
        filteredScale[0] + interval + octave * 12));
}

// ── Lecture des notes ─────────────────────────────────────────────────────────

function sendNoteOff() {
    if (currentNote >= 0) {
        outlet(1, currentNote);
        currentNote = -1;
    }
}

function playNextNote() {
    if (!isRunning) return;

    // ── Rhythm gate ──────────────────────────────────────────────────────────
    var stepIdx = rhythmStep % rhythmLen;
    var state   = rhythmState[stepIdx];
    rhythmStep  = (rhythmStep + 1) % rhythmLen;

    // Anime la tete de lecture sur la roue du Rhythm Editor (ndlr_rhythm_orbit.js,
    // message "beat <index 1-based>" sur son inlet navigation). Emis a chaque pas,
    // NOTE/REST/TIE confondus, AVANT le test sur filteredPool : la roue doit
    // avancer en temps reel avec l'horloge meme s'il n'y a aucune note a jouer
    // (pool vide), puisque c'est un indicateur purement visuel/temporel.
    outlet(2, "beat", stepIdx + 1);

    // Rien à jouer (pool vide) : la roue a quand même avancé ci-dessus, mais
    // aucune note ne peut sortir.
    if (filteredPool.length === 0) return;

    // TIE : on ne coupe pas la note en cours (elle se prolonge sur ce pas).
    // Un NOTE/REST termine en revanche toute tenue précédente.
    if (state !== 2) {
        tieHoldPending = false;
        gateTicksRemaining = 0;
        sendNoteOff();
    }

    // REST : silence — pas comptabilisé dans les "beats", le Pattern n'avance pas
    if (state === 0) return;

    // TIE : prolonge la note précédente — le Pattern n'avance pas, pas de
    // nouvelle attaque. Si le prochain pas est un NOTE, ménager une courte
    // marge avant sa réattaque : certains synthés ignorent un Note Off et un
    // Note On trop rapprochés pour une voix tenue. Un prochain REST reste coupé
    // précisément sur sa frontière, sans anticipation.
    if (state === 2) {
        var nextState = rhythmState[rhythmStep % rhythmLen];
        if (currentNote >= 0 && nextState === 1) {
            gateTicksRemaining = Math.max(1, ticksPerStep() - tieRetriggerGapTicks());
        }
        return;
    }

    // state === 1 (NOTE) : avancer le Pattern et jouer la note suivante
    var patValue = getPatternValue();

    // Diffuser la valeur de pattern courante (UI / mod matrix)
    outlet(2, "pattern_val", motifId, patValue);

    var note;
    if (patternType === 1 && filteredScale.length > 0) {
        // SCALE : la valeur indexe les degres puis continue dans les octaves
        // superieures (ex. gamme a 7 notes : 8 = tonique + 12 demi-tons).
        note = scaleNoteForPatternValue(patValue);
    } else if (patternType === 2) {
        // CHROMATIC : la valeur est un décalage chromatique depuis la racine du pool/gamme
        var base = filteredPool.length > 0 ? filteredPool[0]
                 : (filteredScale.length > 0 ? filteredScale[0] : 60);
        note = Math.max(0, Math.min(127, base + patValue - 1));
    } else {
        // CHORD (par défaut) : la valeur indexe dans le pool d'accord
        var pi = ((((patValue - 1) % filteredPool.length) + filteredPool.length) % filteredPool.length);
        note = filteredPool[pi];
    }

    // Vélocité du pas (clip-style), scalée par la vélocité globale, + humanize ±aléatoire
    var rhythmVelocity = rhythmVel[stepIdx];
    var vel;
    if (currentAccent === 3) {
        vel = currentVelocity;
    } else if (currentAccent >= 4) {
        // Sept motifs d'accent simples et déterministes. Le niveau haut reste
        // currentVelocity ; le niveau bas vaut environ 55 %.
        var accentPatterns = [
            [1,0], [1,0,0,0], [1,0,1,0,0,0], [1,0,0],
            [1,1,0,0], [1,0,0,1,0,0], [1,0,1,0,1,0,0,0]
        ];
        var accentPattern = accentPatterns[currentAccent - 4];
        vel = accentPattern[stepIdx % accentPattern.length]
            ? currentVelocity : Math.max(0, Math.round(currentVelocity * currentVelocityLow / 100));
    } else {
        vel = Math.round(rhythmVelocity * (currentVelocity / 127));
    }
    vel = Math.max(0, Math.min(127, vel));
    if (currentAccent === 2 && currentHumanize > 0) {
        // Echelle firmware : 1 = 10 % de variation, ... 10 = 100 %.
        // La variation est proportionnelle a la velocite effectivement calculee
        // pour ce pas, pas a la seule velocite haute du motif.
        var jitterRange = Math.max(1, Math.round(vel * currentHumanize / 10));
        var jitter = Math.round((Math.random() * 2 - 1) * jitterRange);
        vel = Math.max(0, Math.min(127, vel + jitter));
    }

    currentNote = note;
    // rhythmStep pointe déjà sur le prochain pas. Si celui-ci est un TIE,
    // neutraliser le Note Off automatique du gate pour tenir réellement la
    // note jusqu'au prochain NOTE/REST.
    tieHoldPending = rhythmState[rhythmStep % rhythmLen] === 2;
    // Gate et ratchet : si ratchetCount > 1 sur ce pas, on prepare N-1 sous-frappes
    // rapides, chacune espacee de ticksPerStep/N ticks. Le gate de la premiere frappe
    // est raccourci a subInterval-1 pour laisser un tick de silence entre coups.
    // La velocite de chaque coup suit ratchetVelMode (=, croissant, decroissant).
    var stepRatchetCount = rhythmRatchet[stepIdx] || 1;
    var mainVel = ratchetVelForHit(0, stepRatchetCount, vel);
    outlet(0, note, mainVel);  // list [note, velocity]

    if (stepRatchetCount > 1) {
        var subInterval = Math.max(2, Math.round(ticksPerStep() / stepRatchetCount));
        ratchetNote     = note;
        ratchetBaseVel  = vel;
        ratchetTotal    = stepRatchetCount;
        ratchetInterval = subInterval;
        ratchetSubCount = 0;
        ratchetPending  = stepRatchetCount - 1;
        gateTicksRemaining = Math.max(1, subInterval - 1);
    } else {
        // Gate normal 5-127 : 127 tient jusqu'au pas suivant, faibles valeurs = staccato.
        gateTicksRemaining = tieHoldPending
            ? 0
            : Math.max(1, Math.round(ticksPerStep() * (currentGate / 127)));
    }
}

// ── Horloge ("beat") ─────────────────────────────────────────────────────────
// Appelé à chaque tick (1/96 de noire = 1/384 de ronde) reçu de ndlr_main via "r beat".
function beat() {
    if (!isRunning) return;

    // Décompte du délai d'offset avant le premier pas
    if (offsetTicksRemaining > 0) {
        offsetTicksRemaining--;
        return;
    }

    // Décompte du gate (note-off automatique)
    if (gateTicksRemaining > 0) {
        gateTicksRemaining--;
        if (gateTicksRemaining === 0) sendNoteOff();
    }

    // Avance vers le prochain pas — basé sur le compteur absolu, pour rester
    // aligné sur la grille de l'horloge maître même si ticksPerStep() change.
    absoluteTick++;
    if (absoluteTick % ticksPerStep() === 0) {
        // Nouveau pas principal : annuler tout ratchet en cours du pas précédent
        ratchetPending  = 0;
        ratchetSubCount = 0;
        playNextNote();
    } else if (ratchetPending > 0 && filteredPool.length > 0) {
        // Entre deux pas : décompte des sous-frappes ratchet
        ratchetSubCount++;
        if (ratchetSubCount >= ratchetInterval) {
            ratchetSubCount = 0;
            ratchetPending--;
            // Index du coup courant dans la sequence ratchet (1 = 2e coup, etc.)
            var hitIdx = ratchetTotal - ratchetPending;
            sendNoteOff();
            currentNote = ratchetNote;
            outlet(0, ratchetNote, ratchetVelForHit(hitIdx, ratchetTotal, ratchetBaseVel));
            // Si le pas suivant est un TIE, tenir la dernière sous-frappe du
            // ratchet. Les sous-frappes intermédiaires gardent leur coupure.
            gateTicksRemaining = (tieHoldPending && ratchetPending === 0)
                ? 0
                : Math.max(1, ratchetInterval - 1);
        }
    }
}

// ── API publique ──────────────────────────────────────────────────────────────

function start() {
    isEnabled = true;
    // Le bouton local arme le Motif, mais ne doit jamais contourner l'etat du
    // transport global. Si le transport est arrete, transportstart() lancera
    // effectivement le moteur au prochain Start.
    isRunning = globalTransportRunning;
    if (typeof messnamed !== 'undefined') messnamed('mod_input', 'part_active', 'motif' + motifId, 1);
    resetphase();
}

// Réaligne la phase du séquenceur sur le prochain "beat" (sans toucher à
// isRunning) : appelé sur un Start MIDI de l'horloge maître pour que la
// reprise du motif retombe sur le temps 1, même si le motif tournait déjà.
function resetphase() {
    patternStep    = 0;
    pingDir        = 1;
    rhythmStep     = 0;    // reset du rythme au démarrage

    absoluteTick       = 0;
    gateTicksRemaining = 0;
    tieHoldPending     = false;
    // Délai = offset × durée d'une 1/16 (= 24 ticks, cf. TICKS_PER_SIXTEENTH)
    offsetTicksRemaining = currentOffset * TICKS_PER_SIXTEENTH;
    sendNoteOff();

    // Joue immédiatement le pas 0 au démarrage (sauf si un offset de
    // démarrage est défini) : sinon le premier pas n'arrive qu'après
    // ticksPerStep() ticks, perçu comme un délai au Start.
    if (offsetTicksRemaining === 0 && globalTransportRunning) {
        playNextNote();
    }
}

function stop() {
    isEnabled = false;
    isRunning = false;
    if (typeof messnamed !== 'undefined') messnamed('mod_input', 'part_active', 'motif' + motifId, 0);
    absoluteTick         = 0;
    gateTicksRemaining   = 0;
    tieHoldPending       = false;
    offsetTicksRemaining = 0;
    sendNoteOff();
    outlet(2, "beat", 0);   // efface la tete de lecture sur la roue (v<=0 = aucune)
    outlet(2, "pattern_beat", 0);
    if (typeof messnamed !== "undefined") messnamed("pattern_active_M" + motifId, "active", 0, 0, currentPattLen, patternMax());
}

// ── Synchro horloge externe (MIDI Start/Stop) ───────────────────────────────
// Appelé sur Stop MIDI : coupe le son sans changer l'état du bouton on/off
// (isEnabled), pour pouvoir redémarrer instantanément sur le prochain Start.
function transportstop() {
    globalTransportRunning = false;
    isRunning = false;
    absoluteTick         = 0;
    gateTicksRemaining   = 0;
    tieHoldPending       = false;
    offsetTicksRemaining = 0;
    sendNoteOff();
    outlet(2, "beat", 0);   // efface la tete de lecture sur la roue (v<=0 = aucune)
    outlet(2, "pattern_beat", 0);
    if (typeof messnamed !== "undefined") messnamed("pattern_active_M" + motifId, "active", 0, 0, currentPattLen, patternMax());
}

// Appelé sur Start MIDI : ne (re)démarre que si le module est activé
// (isEnabled, via son bouton on/off local).
function transportstart() {
    globalTransportRunning = true;
    if (!isEnabled) return;
    isRunning = true;
    resetphase();
}

function pool() {
    fullPool = arrayfromargs(arguments).filter(function(x) { return typeof x === "number"; });
    filterPool();
    // Mise à jour silencieuse (pas de re-démarrage)
}

// scale [notes...] : notes de la gamme courante (depuis scale_builder)
function scale() {
    fullScale = arrayfromargs(arguments).filter(function(x) { return typeof x === "number"; });
    filterScale();
}

function position(v) {
    currentPosition = Math.max(0, Math.min(4, Math.round(v)));
    filterPool();
    filterScale();
}

function pattern(v) {
    currentPattern = Math.max(1, Math.min(20, Math.round(v)));
    currentPatternSlot = currentPattern;
    // Charge le preset dans l'éditeur de pattern et resync l'UI (multislider)
    customPattern = (PATTERNS[currentPattern] || PATTERNS[1]).map(function(x) { return x + 1; });
    syncPatternStepBases();
    // IMPORTANT : "pattlen" (→ message "size" sur le multislider) doit toujours
    // être réémis AVANT "pattern_set" (→ "set v1...v16"). Le multislider
    // redimensionne/efface son contenu sur "size" ; l'envoyer après "pattern_set"
    // écraserait les valeurs qu'on vient juste d'afficher.
    outlet(2, "pattlen", currentPattLen);
    emitPatternSet();
    outlet(2, "pattern_slot", currentPattern);
    // Pas de reset du step — le changement est progressif
}

function pattlen(v) {
    currentPattLen = Math.max(1, Math.min(16, Math.round(v)));
    patternStep    = 0;   // reset pour éviter un step hors-limite
    // Le message "size" du multislider initialise les pas qui apparaissent à 1.
    // Réémettre ensuite les valeurs conservées dans customPattern afin que
    // l'affichage reste identique au pattern effectivement joué.
    outlet(2, "pattlen", currentPattLen);
    emitPatternSet();
}

function variation(v) {
    currentVariation = Math.max(1, Math.min(6, v));
    patternStep      = 0;
    pingDir          = 1;
    outlet(2, "variation", currentVariation);
}

function clkdiv(v) {
    // Retiré : le tempo est désormais entièrement piloté par rhythm_rate.
    // Le message est accepté sans effet pour ne pas générer d'erreurs Max.
}

function velocity(v) {
    currentVelocity = Math.max(0, Math.min(127, Math.round(v)));
}

function velocity_low(v) {
    currentVelocityLow = Math.max(0, Math.min(100, Math.round(v)));
}

function gate(v) {
    currentGate = Math.max(5, Math.min(127, Math.round(v)));
}

function accent(v) {
    currentAccent = Math.max(1, Math.min(10, Math.round(v)));
}

// Entrée dédiée à la matrice. Elle respecte l'état transport global.
function on(v) {
    if (v) start();
    else stop();
}

function humanize(v) {
    currentHumanize = Math.max(0, Math.min(10, Math.round(v)));
}

function humanize_mod(v) {
    currentHumanize = Math.max(0, Math.min(10, Math.round(v)));
}

// Le tempo ne pilote plus le séquençage (piloté par "beat" via ndlr_main),
// mais calibre en millisecondes la courte marge de réattaque Tie → Note.
function tempo(v) {
    currentTempo = Math.max(10, Math.min(300, v));
}

function offset(v) {
    currentOffset = Math.max(0, Math.min(3, Math.round(v)));
}

// ── Rhythm Editor API ─────────────────────────────────────────────────────────

// rhythm_step [1-32] [0|1|2] : régler l'état d'un pas individuel. L'index
// recu vient de la roue (position AFFICHEE, cf. ndlr_rhythm_orbit.js) : en
// mode normal il faut le traduire vers le pas de BASE avant d'ecrire, sinon
// l'edition "glisse" d'autant de pas que la rotation courante.
function rhythm_step(step, val) {
    var idx = Math.round(step) - 1;   // 1-based → 0-based
    if (idx < 0 || idx >= MAX_RHYTHM_STEPS) return;
    var s = Math.max(0, Math.min(2, Math.round(val)));
    if (rhythmMode === 0) {
        normalRhythmState[displayToBase(idx)] = s;
        applyNormalRotation();
    } else {
        rhythmState[idx] = s;
    }
}

// rhythm [v1 ... v32] : definir tout le pattern en une fois
function rhythm() {
    var vals = arrayfromargs(arguments);
    for (var i = 0; i < MAX_RHYTHM_STEPS && i < vals.length; i++) {
        var s = Math.max(0, Math.min(2, Math.round(vals[i])));
        if (rhythmMode === 0) normalRhythmState[i] = s; else rhythmState[i] = s;
    }
    if (rhythmMode === 0) applyNormalRotation();
}

// rhythm_len [4-32] : longueur active selon le manuel NDLR
function rhythm_len(v) {
    var nextRhythmLen = Math.max(4, Math.min(MAX_RHYTHM_STEPS, Math.round(v)));
    if (nextRhythmLen === rhythmLen) {
        // Même si le moteur possède déjà cette longueur, republier l'état :
        // l'éditeur peut encore afficher une valeur locale périmée après un
        // changement de motif ou le rechargement d'un bpatcher.
        clampEuclidControls();
        outlet(2, "rhythm_len", rhythmLen);
        outlet(2, "euclid_pulses", euclidPulses);
        outlet(2, "euclid_rotate", euclidRotate);
        outlet.apply(this, [2, "rhythm"].concat(rhythmState));
        outlet.apply(this, [2, "rhythm_vel"].concat(rhythmVel));
        outlet.apply(this, [2, "rhythm_ratchet"].concat(rhythmRatchet));
        return;
    }
    rhythmLen  = nextRhythmLen;
    clampEuclidControls();
    rhythmStep = 0;   // reset la position
    if (rhythmMode === 1) regenerateEuclid(); else applyNormalRotation();
    outlet(2, "rhythm_len", rhythmLen);
    outlet(2, "euclid_pulses", euclidPulses);
    outlet(2, "euclid_rotate", euclidRotate);
    outlet(2, "beat", 0); // efface immédiatement l'ancienne tête de lecture
    outlet.apply(this, [2, "rhythm"].concat(rhythmState));
    outlet.apply(this, [2, "rhythm_vel"].concat(rhythmVel));
    outlet.apply(this, [2, "rhythm_ratchet"].concat(rhythmRatchet));
}

// Conservé pour compatibilité avec les anciens patchers qui envoient encore
// ce message. Les longueurs rythmiques de M1 et M2 sont désormais totalement
// indépendantes : M2 ne doit plus être ramené implicitement à la mesure de M1.
function motif1_bar_ticks(v) {
    motif1BarTicks = Math.max(0, Math.round(v));
}

// ── Mode Euclidéen (Firmware 3) ──────────────────────────────────────────────

// rhythm_mode [0-1] : 0=normal (édition libre)  1=euclidéen
function rhythm_mode(v) {
    var nextMode = v ? 1 : 0;
    if (nextMode === rhythmMode) return;

    // En quittant Euclidean, adopter son résultat comme nouveau pattern libre
    // au lieu de restaurer l'ancien contenu du mode Normal.
    if (nextMode === 0) captureCurrentRhythmAsNormalBase();
    rhythmMode = nextMode;
    if (nextMode === 1) regenerateEuclid(); else applyNormalRotation();
    rhythmStep = 0;
    outlet(2, "rhythm_mode", rhythmMode);
    outlet(2, "rhythm_len", rhythmLen);
    outlet(2, "euclid_pulses", euclidPulses);
    outlet(2, "euclid_rotate", euclidRotate);
    outlet.apply(this, [2, "rhythm"].concat(rhythmState));
    outlet.apply(this, [2, "rhythm_vel"].concat(rhythmVel));
    outlet.apply(this, [2, "rhythm_ratchet"].concat(rhythmRatchet));
}

// euclid_pulses [1-32] : nombre de pulsations distribuees sur rhythmLen pas
function euclid_pulses(v) {
    var nextPulses = Math.max(1, Math.min(rhythmLen, Math.round(v)));
    if (nextPulses === euclidPulses) {
        // Renvoyer tout de même la valeur bornée : si l'utilisateur saisit
        // 20 avec Length=8 alors que Beats vaut déjà 8, l'ancien early-return
        // laissait le nombre 20 affiché dans l'éditeur.
        outlet(2, "euclid_pulses", euclidPulses);
        return;
    }
    euclidPulses = nextPulses;
    regenerateEuclid();
    outlet(2, "euclid_pulses", euclidPulses);
    outlet.apply(this, [2, "rhythm"].concat(rhythmState));
}

// euclid_rotate [0-31] : rotation du motif — actif dans les deux modes
// (euclidien : decale le motif de Bjorklund : normal : decale
// normalRhythmState/normalRhythmVel, cf. applyNormalRotation).
function euclid_rotate(v) {
    var nextRotate = Math.max(0, Math.min(rhythmLen - 1, Math.round(v)));
    if (nextRotate === euclidRotate) return;
    euclidRotate = nextRotate;
    if (rhythmMode === 1) regenerateEuclid(); else applyNormalRotation();
    outlet(2, "euclid_rotate", euclidRotate);
    outlet.apply(this, [2, "rhythm"].concat(rhythmState));
    outlet.apply(this, [2, "rhythm_vel"].concat(rhythmVel));
    outlet.apply(this, [2, "rhythm_ratchet"].concat(rhythmRatchet));
}

// rhythm_step_vel [1-32] [0-127] : velocite d'un pas individuel (index
// AFFICHE venant de la roue — meme traduction display->base qu'au-dessus).
function rhythm_step_vel(step, vel) {
    var idx = Math.round(step) - 1;   // 1-based → 0-based
    if (idx < 0 || idx >= MAX_RHYTHM_STEPS) return;
    var v = Math.max(0, Math.min(127, Math.round(vel)));
    if (rhythmMode === 0) {
        normalRhythmVel[displayToBase(idx)] = v;
        applyNormalRotation();
    } else {
        normalRhythmVel[displayToBase(idx)] = v;
        applyEuclideanAttributeRotation();
    }
}

// rhythm_vel [v1 ... v32] : definir toutes les velocites en une fois
function rhythm_vel() {
    var vals = arrayfromargs(arguments);
    for (var i = 0; i < MAX_RHYTHM_STEPS && i < vals.length; i++) {
        var v = Math.max(0, Math.min(127, Math.round(vals[i])));
        if (rhythmMode === 0) {
            normalRhythmVel[i] = v;
        } else if (i < rhythmLen) {
            normalRhythmVel[displayToBase(i)] = v;
        } else {
            normalRhythmVel[i] = v;
            rhythmVel[i] = v;
        }
    }
    if (rhythmMode === 0) applyNormalRotation(); else applyEuclideanAttributeRotation();
}

// rhythm_rate [0-20] : division musicale (0=1nd … 7=4n … 20=128n)
function rhythm_rate(v) {
    rhythmRateIdx = Math.max(0, Math.min(RHYTHM_DIVISION_TICKS.length - 1, Math.round(v)));
    outlet(2, "rhythm_rate", rhythmRateIdx);
}

// rhythm_step_ratchet [1-32] [1-4] : ratchet d'un pas individuel (index AFFICHE)
function rhythm_step_ratchet(step, val) {
    var idx = Math.round(step) - 1;
    if (idx < 0 || idx >= MAX_RHYTHM_STEPS) return;
    var r = Math.max(1, Math.min(4, Math.round(val)));
    if (rhythmMode === 0) {
        normalRhythmRatchet[displayToBase(idx)] = r;
        applyNormalRotation();
    } else {
        normalRhythmRatchet[displayToBase(idx)] = r;
        applyEuclideanAttributeRotation();
    }
    outlet.apply(this, [2, "rhythm_ratchet"].concat(rhythmRatchet));
}

// rhythm_ratchet_vel_mode [0-2] : mode de velocite des sous-frappes ratchet
// 0 = egale  1 = croissante (↗)  2 = decroissante (↘)
function rhythm_ratchet_vel_mode(v) {
    ratchetVelMode = Math.max(0, Math.min(2, Math.round(v)));
}

// rhythm_ratchet [v1 ... v32] : definir tous les ratchets en une fois
function rhythm_ratchet() {
    var a = arrayfromargs(arguments);
    var i;
    for (i = 0; i < Math.min(MAX_RHYTHM_STEPS, a.length); i++) {
        var r = Math.max(1, Math.min(4, Math.round(a[i])));
        if (rhythmMode === 0) {
            normalRhythmRatchet[i] = r;
        } else if (i < rhythmLen) {
            normalRhythmRatchet[displayToBase(i)] = r;
        } else {
            normalRhythmRatchet[i] = r;
            rhythmRatchet[i] = r;
        }
    }
    if (rhythmMode === 0) applyNormalRotation(); else applyEuclideanAttributeRotation();
    outlet.apply(this, [2, "rhythm_ratchet"].concat(rhythmRatchet));
}

// ── Patterns A-D (slots de variation, comme des scenes Ableton) ───────────────

// rhythm_pattern_save [21-40] : sauvegarde le pattern/vel/len/mode courant dans un slot utilisateur
function rhythm_pattern_save(slot) {
    var requested = Math.round(slot);
    if (requested < 21 || requested > 40) {
        outlet(2, "rhythm_slot", currentRhythmSlot);
        return; // 1-20 sont en lecture seule
    }
    var idx = requested - 21;
    if (idx < 0 || idx > 19) return;
    // Relire la bibliothèque commune pour ne pas écraser un slot sauvegardé
    // entre-temps par l'autre Motif.
    loadSharedRhythms();
    rhythmSlots[idx] = {
        state:  rhythmState.slice(),
        normalState: normalRhythmState.slice(),
        vel:    rhythmVel.slice(),
        normalVel: normalRhythmVel.slice(),
        ratchet: rhythmRatchet.slice(),
        normalRatchet: normalRhythmRatchet.slice(),
        len:    rhythmLen,
        mode:   rhythmMode,
        pulses: euclidPulses,
        rotate: euclidRotate
    };
    currentRhythmSlot = requested;
    saveSharedRhythms();
    outlet(2, "rhythm_slot", requested);
    outlet(2, "rhythm_saved", requested);
    emitRhythmSlotsUsed();
}

// rhythm_pattern_load [1-40] : charge un preset fixe (1-20) ou utilisateur (21-40)
function rhythm_pattern_load(slot) {
    var requested = Math.round(slot);
    if (requested >= 1 && requested <= 20) {
        var preset = RHYTHM_PRESETS[requested];
        if (!preset) return;
        for (var p = 0; p < MAX_RHYTHM_STEPS; p++) {
            normalRhythmState[p] = p < preset.length ? preset[p] : 0;
            normalRhythmVel[p] = 100;
            normalRhythmRatchet[p] = 1;
        }
        rhythmLen = Math.max(4, Math.min(MAX_RHYTHM_STEPS, preset.length));
        clampEuclidControls();
        rhythmMode = 0;
        applyNormalRotation();
        currentRhythmSlot = requested;
        rhythmStep = 0;
        outlet.apply(this, [2, "rhythm"].concat(rhythmState));
        outlet.apply(this, [2, "rhythm_vel"].concat(rhythmVel));
        outlet.apply(this, [2, "rhythm_ratchet"].concat(rhythmRatchet));
        outlet(2, "rhythm_len", rhythmLen);
        outlet(2, "euclid_pulses", euclidPulses);
        outlet(2, "euclid_rotate", euclidRotate);
        outlet(2, "beat", 0);
        outlet(2, "rhythm_mode", rhythmMode);
        outlet(2, "rhythm_slot", requested);
        return;
    }
    var idx = requested - 21;
    if (idx < 0 || idx > 19) return;
    loadSharedRhythms();
    rhythmSlotIdx = idx;
    var s = rhythmSlots[idx];
    if (!s) {
        // Un slot vide ne doit pas laisser croire à l'interface qu'il est chargé.
        outlet(2, "rhythm_slot", currentRhythmSlot);
        return;
    }
    currentRhythmSlot = requested;
    rhythmState  = s.state.slice();
    normalRhythmState = (s.normalState || s.state).slice();
    rhythmVel    = s.vel.slice();
    normalRhythmVel = (s.normalVel || s.vel).slice();
    rhythmRatchet = s.ratchet ? s.ratchet.slice() : (function() {
        var a = []; for (var i = 0; i < MAX_RHYTHM_STEPS; i++) a.push(1); return a;
    }());
    normalRhythmRatchet = s.normalRatchet ? s.normalRatchet.slice() : rhythmRatchet.slice();
    rhythmLen    = Math.max(4, Math.min(MAX_RHYTHM_STEPS, Math.round(s.len)));
    rhythmMode   = s.mode   || 0;
    euclidPulses = s.pulses || 4;
    euclidRotate = s.rotate || 0;
    clampEuclidControls();
    rhythmStep   = 0;
    outlet.apply(this, [2, "rhythm"].concat(rhythmState));
    outlet.apply(this, [2, "rhythm_vel"].concat(rhythmVel));
    outlet.apply(this, [2, "rhythm_ratchet"].concat(rhythmRatchet));
    outlet(2, "rhythm_len", rhythmLen);
    outlet(2, "rhythm_mode", rhythmMode);
    outlet(2, "euclid_pulses", euclidPulses);
    outlet(2, "euclid_rotate", euclidRotate);
    outlet(2, "beat", 0);
    outlet(2, "rhythm_slot", requested);
}

// rhythm_pattern_select [1-40] : alias de rhythm_pattern_load (sélection via UI)
function rhythm_pattern_select(slot) {
    rhythm_pattern_load(slot);
}

// ── Pattern Editor API (NDLR rev2) ───────────────────────────────────────────

// motif_id [1-2] : identifiant du motif, utilisé dans "pattern_val id value"
function motif_id(v) {
    motifId = Math.max(1, Math.min(2, Math.round(v)));
    loadPersistentLibrary();
    loadSharedRhythms();
    emitRhythmSlotsUsed();
}

// Plage du multislider de l'éditeur de pattern selon le type :
//   CHORD: 1-20  SCALE: 1-40  CHROMATIC: 1-60
var PATTERN_MAX_BY_TYPE = [20, 40, 60];

function patternMax() {
    return PATTERN_MAX_BY_TYPE[patternType];
}

// Réémet le pattern courant vers le multislider de l'éditeur, TRONQUÉ à
// currentPattLen (et non les 16 valeurs physiques de customPattern). Le
// multislider de l'éditeur est lui aussi redimensionné à currentPattLen
// (message "size", cf. pattlen()) ; lui envoyer une liste plus longue que sa
// taille courante peut le faire reprendre sa taille au nombre de valeurs
// reçues, ce qui annule le redimensionnement et désynchronise l'affichage
// Patt Len / multislider (constaté au démarrage : dumpstate() envoie pattlen
// puis pattern_set, et un pattern_set de 16 valeurs sur un multislider tout
// juste réduit à 8 le faisait revenir à 16). En tronquant systématiquement
// à currentPattLen, la liste envoyée correspond toujours à la taille déjà
// fixée — aucun redimensionnement implicite possible. Les valeurs au-delà de
// currentPattLen restent stockées dans customPattern (16 cases physiques) et
// réapparaissent normalement si Patt Len augmente ensuite.
function emitPatternSet() {
    outlet.apply(this, [2, "pattern_set"].concat(customPattern.slice(0, currentPattLen)));
    emitPatternText();
    emitPatternPreview();
}

// pattern_max <n> : reçu depuis le Perlin jsui (envoyé juste avant pattern_type).
// motif_builder calcule lui-même le max via patternMax() à partir de patternType,
// donc ce message est ignoré ici — pattern_type qui suit fera le travail.
function pattern_max(v)  { /* no-op : géré par pattern_type */ }
function pattern_type1(v) { pattern_type(v); }
function pattern_type2(v) { pattern_type(v); }

// pattern_type [0-2] : 0=CHORD  1=SCALE  2=CHROMATIC
// → émet "pattern_max <n>" (outlet 2) pour resync la plage du multislider de l'éditeur
function pattern_type(v) {
    patternType = Math.max(0, Math.min(2, Math.round(v)));
    var max = patternMax();
    // Recadre le pattern courant dans la nouvelle plage
    for (var i = 0; i < 16; i++) {
        customPattern[i] = Math.max(1, Math.min(max, customPattern[i]));
    }
    outlet(2, "pattern_max", max);
    // Le changement CHORD/SCALE/CHROMATIC ne doit jamais modifier Patt Len.
    // "pattlen" (→ "size" sur le multislider) doit partir avant "pattern_set"
    // pour ne pas effacer les valeurs réaffichées juste après.
    outlet(2, "pattlen", currentPattLen);
    emitPatternSet();
}

// pattern_step [1-16] [1-N] : règle la valeur d'un pas de l'éditeur de pattern
// (N dépend du pattern type courant : 20/40/60)
function pattern_step(step, val) {
    var idx = Math.round(step) - 1;   // 1-based → 0-based
    if (idx < 0 || idx > 15) return;
    customPattern[idx] = Math.max(1, Math.min(patternMax(), Math.round(val)));
    emitPatternSet();
    notifyPatternStepBase(idx);
}

// pattern_values v1 v2 ... vN : saisie manuelle depuis un textedit.
// Les valeurs sont separees par des espaces. La longueur du pattern
// s'adapte automatiquement au nombre de valeurs saisies (1-16).
function pattern_values() {
    var args = arrayfromargs(arguments);
    if (!args.length) return;
    var max = patternMax();
    var len = Math.max(1, Math.min(16, args.length));
    for (var i = 0; i < len; i++) {
        customPattern[i] = Math.max(1, Math.min(max, Math.round(Number(args[i]))));
    }
    if (len !== currentPattLen) {
        currentPattLen = len;
        outlet(2, "pattlen", currentPattLen);
    }
    emitPatternSet();
    emitPatternText();
}

// Emet les valeurs courantes comme texte sur outlet 2 (message "pattern_text")
// pour afficher dans le textedit.
function emitPatternText() {
    var parts = [];
    for (var i = 0; i < currentPattLen; i++) parts.push(customPattern[i]);
    outlet(2, "pattern_text", parts.join(' '));
}

// Saisie rapide depuis un clavier reçu sur le canal MIDI Control.
function pattern_midi_note(note) {
    var midiNote = Math.max(0, Math.min(127, Math.round(note)));
    var value = (midiNote % patternMax()) + 1;
    pattern_step(patternEditStep + 1, value);
    patternEditStep = (patternEditStep + 1) % currentPattLen;
    outlet(2, 'pattern_cursor', patternEditStep + 1);
}

function pattern_step_mod(step, val) {
    var idx = Math.round(step) - 1;
    if (idx < 0 || idx > 15) return;
    customPattern[idx] = Math.max(1, Math.min(patternMax(), Math.round(val)));
    emitPatternSet();
}

function pattern_all_mod(v) {
    var value = Math.max(0, Math.min(127, Math.round(v)));
    var maxOffset = Math.max(0, patternMax() - 1);
    patternGlobalMod = (value === 64) ? 0 : Math.round(((value - 64) / 63) * maxOffset);
    emitPatternPreview();
}

function pattern_all_mod_feedback(v) {
    pattern_all_mod(v);
}

function notifyPatternStepBase(idx) {
    if (typeof messnamed === "undefined") return;
    messnamed("mod_input", "setbase", "motif" + motifId + "_step" + (idx + 1), customPattern[idx]);
}

function syncPatternStepBases() {
    for (var i = 0; i < 16; i++) notifyPatternStepBase(i);
}

// pattern_set [v1 v2 ... v16] : règle les 16 valeurs de l'éditeur en une fois
function pattern_set() {
    var vals = arrayfromargs(arguments);
    var max  = patternMax();
    for (var i = 0; i < 16 && i < vals.length; i++) {
        customPattern[i] = Math.max(1, Math.min(max, Math.round(vals[i])));
    }
    syncPatternStepBases();
    // Resync le multislider de l'éditeur (sans toucher patternStep, donc sans
    // jamais interrompre la lecture en cours) — utilisé notamment par Perlin
    // Noise qui pousse un nouveau pattern en live via ce même message.
    emitPatternSet();
}

// ── Pattern Editor — slots utilisateur (save/load) ───────────────────────────
// 20 slots partages par M1/M2, indépendants des presets PATTERNS[1-20] :
// stockent customPattern, la longueur (pattlen) et le pattern type courants.
var patternSlots = new Array(20); // emplacements utilisateur 21-40

// ── Bibliothèque persistante Dict + JSON ─────────────────────────────────────
// Une bibliothèque séparée est utilisée pour chaque instance Motif. Le Dict
// facilite l'échange dans Max; le JSON garantit la persistance après fermeture,
// même si le patch Max n'est pas sauvegardé. Dans le standalone, les fichiers
// vivent dans le dossier utilisateur Application Support/NDLR (ou AppData sous
// Windows). Pendant le développement, ils sont placés dans data/ du projet.
var libraryDict = null;
var libraryLoadedFor = 0;

function persistentFilename(name) {
    return name + ".json";
}

// Retrouve la racine du projet depuis le patcher parent le plus haut possédant
// un filepath. Les bpatchers du projet vivent dans patchers/, à côté de data/.
function developmentLibraryPath(filename) {
    var p = (typeof this.patcher !== "undefined") ? this.patcher : null;
    var filepath = "";
    while (p) {
        if (p.filepath) filepath = String(p.filepath);
        p = p.parentpatcher;
    }
    filepath = filepath.replace(/\\/g, "/");
    var slash = filepath.lastIndexOf("/");
    var folder = slash >= 0 ? filepath.substring(0, slash) : "";
    if (/\/patchers$/i.test(folder)) folder = folder.substring(0, folder.length - 9);
    return folder ? folder + "/data/" + filename : "Project:/data/" + filename;
}

function standaloneLibraryPath(filename) {
    var os = (typeof max !== "undefined" && max.os) ? String(max.os) : "macintosh";
    if (os === "windows") return "~:/AppData/Roaming/NDLR/" + filename;
    return "~:/Library/Application Support/NDLR/" + filename;
}

function persistentLibraryPath(filename) {
    var runtime = (typeof max !== "undefined" && max.isruntime) ? 1 : 0;
    return runtime ? standaloneLibraryPath(filename) : developmentLibraryPath(filename);
}

function readJsonText(path) {
    if (typeof File === "undefined") return null;
    // L'extension .json suffit à Max pour déterminer le type de fichier.
    var f = new File(path, "read");
    if (!f.isopen) return null;
    var text = f.readstring(f.eof);
    f.close();
    try {
        JSON.parse(text); // valider avant de remplacer le Dict embarqué
        return text;
    } catch (e) {
        post("NDLR: bibliothèque JSON invalide, données embarquées conservées: " + path + "\n");
        return null;
    }
}

function loadExternalLibrary(dict, filename) {
    if (!dict) return false;
    var path = persistentLibraryPath(filename);
    var text = readJsonText(path);
    if (text === null) return false;
    dict.parse(text);
    return true;
}

function saveExternalLibrary(dict, filename) {
    if (!dict || typeof dict.export_json !== "function") return false;
    var path = persistentLibraryPath(filename);
    try {
        dict.export_json(path);
        outlet(2, "library_file_saved", path);
        return true;
    } catch (e) {
        post("NDLR: impossible de sauvegarder la bibliothèque: " + path + "\n");
        return false;
    }
}

function dictArray(value) {
    if (value instanceof Array) return value.slice();
    if (value && typeof value !== "string" && typeof value.length === "number") {
        return Array.prototype.slice.call(value);
    }
    if (value === null || value === undefined) return [];
    return [value];
}

function loadPersistentLibrary() {
    if (typeof Dict === "undefined") return;
    // Le dict @embed 1 fournit les valeurs initiales/de secours. Une sauvegarde
    // JSON utilisateur existante prend ensuite la priorité.
    libraryDict = new Dict("ndlr_motif" + motifId + "_library");
    loadExternalLibrary(libraryDict, persistentFilename("ndlr_motif" + motifId + "_library"));

    for (var i = 0; i < 20; i++) {
        var slot = i + 21;
        var rp = "rhythms::" + slot;
        if (libraryDict.contains(rp + "::states")) {
            rhythmSlots[i] = {
                state: dictArray(libraryDict.get(rp + "::states")),
                normalState: libraryDict.contains(rp + "::normal_states")
                    ? dictArray(libraryDict.get(rp + "::normal_states"))
                    : dictArray(libraryDict.get(rp + "::states")),
                vel: dictArray(libraryDict.get(rp + "::velocities")),
                normalVel: libraryDict.contains(rp + "::normal_velocities")
                    ? dictArray(libraryDict.get(rp + "::normal_velocities"))
                    : dictArray(libraryDict.get(rp + "::velocities")),
                ratchet: libraryDict.contains(rp + "::ratchets")
                    ? dictArray(libraryDict.get(rp + "::ratchets")) : null,
                normalRatchet: libraryDict.contains(rp + "::normal_ratchets")
                    ? dictArray(libraryDict.get(rp + "::normal_ratchets")) : null,
                len: Number(libraryDict.get(rp + "::length")) || 16,
                mode: Number(libraryDict.get(rp + "::mode")) || 0,
                pulses: Number(libraryDict.get(rp + "::pulses")) || 4,
                rotate: Number(libraryDict.get(rp + "::rotate")) || 0
            };
        }
    }
    libraryLoadedFor = motifId;
    loadSharedPatterns();
    if (typeof messnamed !== "undefined") messnamed("mod_input", "reload_patterns");
    outlet(2, "library_loaded", motifId);
}

// Les User Patterns 21-40 sont une bibliothèque globale, accessible aux deux Motifs.
var sharedPatternDict = null;

function loadSharedPatterns() {
    if (typeof Dict === "undefined") return;
    sharedPatternDict = new Dict("ndlr_shared_pattern_library");
    loadExternalLibrary(sharedPatternDict, persistentFilename("ndlr_shared_pattern_library"));
    patternSlots = new Array(20);

    for (var i = 0; i < 20; i++) {
        var slot = i + 21;
        var pp = "patterns::" + slot;
        if (sharedPatternDict.contains(pp + "::values")) {
            patternSlots[i] = {
                pattern: dictArray(sharedPatternDict.get(pp + "::values")),
                pattlen: Number(sharedPatternDict.get(pp + "::length")) || 16,
                type: Number(sharedPatternDict.get(pp + "::type")) || 0
            };
        }
    }

    // Migration douce : si la bibliothèque partagée est vide, reprendre les
    // anciens User Patterns depuis les bibliothèques Motif existantes.
    for (var idx = 0; idx < 20; idx++) {
        if (patternSlots[idx]) continue;
        var legacySlot = idx + 21;
        var legacyPath = "patterns::" + legacySlot;
        for (var motif = 1; motif <= 2; motif++) {
            var legacyDict = new Dict("ndlr_motif" + motif + "_library");
            loadExternalLibrary(legacyDict, persistentFilename("ndlr_motif" + motif + "_library"));
            if (!legacyDict.contains(legacyPath + "::values")) continue;
            patternSlots[idx] = {
                pattern: dictArray(legacyDict.get(legacyPath + "::values")),
                pattlen: Number(legacyDict.get(legacyPath + "::length")) || 16,
                type: Number(legacyDict.get(legacyPath + "::type")) || 0
            };
            break;
        }
    }
}

// Les Rhythms 21-40 sont une bibliothèque globale, accessible aux deux Motifs.
var sharedRhythmDict = null;

function loadSharedRhythms() {
    if (typeof Dict === "undefined") return;
    // Le dict partagé @embed 1 sert de secours; le JSON utilisateur, s'il
    // existe, prend la priorité dans Max comme dans le standalone.
    sharedRhythmDict = new Dict("ndlr_shared_rhythm_library");
    loadExternalLibrary(sharedRhythmDict, persistentFilename("ndlr_shared_rhythm_library"));
    // Repartir du contenu reel du Dict : les deux Motifs partagent cette
    // bibliotheque et ne doivent pas conserver un ancien slot en memoire.
    rhythmSlots = new Array(20);

    for (var i = 0; i < 20; i++) {
        var slot = i + 21;
        var rp = "rhythms::" + slot;
        if (sharedRhythmDict.contains(rp + "::states")) {
            rhythmSlots[i] = {
                state: dictArray(sharedRhythmDict.get(rp + "::states")),
                normalState: sharedRhythmDict.contains(rp + "::normal_states")
                    ? dictArray(sharedRhythmDict.get(rp + "::normal_states"))
                    : dictArray(sharedRhythmDict.get(rp + "::states")),
                vel: dictArray(sharedRhythmDict.get(rp + "::velocities")),
                normalVel: sharedRhythmDict.contains(rp + "::normal_velocities")
                    ? dictArray(sharedRhythmDict.get(rp + "::normal_velocities"))
                    : dictArray(sharedRhythmDict.get(rp + "::velocities")),
                ratchet: sharedRhythmDict.contains(rp + "::ratchets")
                    ? dictArray(sharedRhythmDict.get(rp + "::ratchets")) : null,
                normalRatchet: sharedRhythmDict.contains(rp + "::normal_ratchets")
                    ? dictArray(sharedRhythmDict.get(rp + "::normal_ratchets")) : null,
                len: Number(sharedRhythmDict.get(rp + "::length")) || 16,
                mode: Number(sharedRhythmDict.get(rp + "::mode")) || 0,
                pulses: Number(sharedRhythmDict.get(rp + "::pulses")) || 4,
                rotate: Number(sharedRhythmDict.get(rp + "::rotate")) || 0
            };
        }
    }
}

// Informe le Rhythm Editor des slots User réellement occupés. La liste est
// commune aux deux Motifs, comme la bibliothèque de rythmes elle-même.
function emitRhythmSlotsUsed() {
    var message = [2, "rhythm_slots_used"];
    for (var i = 0; i < 20; i++) {
        if (rhythmSlots[i]) message.push(i + 21);
    }
    outlet.apply(this, message);
}

// Les User Patterns sont communs aux deux Motifs. L'interface utilise cette
// liste pour marquer le slot courant par un asterisque.
function emitPatternSlotsUsed() {
    var message = [2, "pattern_slots_used"];
    for (var i = 0; i < 20; i++) {
        if (patternSlots[i]) message.push(i + 21);
    }
    outlet.apply(this, message);
}

function saveSharedPatterns() {
    if (typeof Dict === "undefined") return;
    if (!sharedPatternDict) sharedPatternDict = new Dict("ndlr_shared_pattern_library");
    var payload = { version: 1, patterns: {} };
    for (var i = 0; i < 20; i++) {
        var p = patternSlots[i];
        if (!p) continue;
        payload.patterns[String(i + 21)] = {
            values: p.pattern.slice(),
            length: p.pattlen,
            type: p.type
        };
    }
    sharedPatternDict.parse(JSON.stringify(payload));
    saveExternalLibrary(sharedPatternDict, persistentFilename("ndlr_shared_pattern_library"));
}

function saveSharedRhythms() {
    if (typeof Dict === "undefined") return;
    if (!sharedRhythmDict) sharedRhythmDict = new Dict("ndlr_shared_rhythm_library");
    var payload = { version: 1, rhythms: {} };
    for (var i = 0; i < 20; i++) {
        var r = rhythmSlots[i];
        if (!r) continue;
        payload.rhythms[String(i + 21)] = {
            states: r.state.slice(),
            normal_states: (r.normalState || r.state).slice(),
            velocities: r.vel.slice(),
            normal_velocities: (r.normalVel || r.vel).slice(),
            ratchets: (r.ratchet || []).slice(),
            normal_ratchets: (r.normalRatchet || r.ratchet || []).slice(),
            length: r.len,
            mode: r.mode,
            pulses: r.pulses,
            rotate: r.rotate
        };
    }
    // Mettre à jour le Dict embarqué pour la session, puis écrire immédiatement
    // le JSON afin que la sauvegarde ne dépende plus d'un Cmd+S dans Max.
    sharedRhythmDict.parse(JSON.stringify(payload));
    saveExternalLibrary(sharedRhythmDict, persistentFilename("ndlr_shared_rhythm_library"));
}

function savePersistentLibrary() {
    if (typeof Dict === "undefined") return;
    if (!libraryDict || libraryLoadedFor !== motifId) loadPersistentLibrary();
    if (!libraryDict) return;

    var payload = { version: 1, motif: motifId, patterns: {}, rhythms: {} };

    for (var i = 0; i < 20; i++) {
        var slot = i + 21;
        var r = rhythmSlots[i];
        if (r) {
            payload.rhythms[String(slot)] = {
                states: r.state.slice(),
                normal_states: (r.normalState || r.state).slice(),
                velocities: r.vel.slice(),
                normal_velocities: (r.normalVel || r.vel).slice(),
                ratchets: (r.ratchet || []).slice(),
                normal_ratchets: (r.normalRatchet || r.ratchet || []).slice(),
                length: r.len,
                mode: r.mode,
                pulses: r.pulses,
                rotate: r.rotate
            };
        }
    }
    // Le Dict reste synchronisé avec le patch, mais le JSON est la persistance
    // autoritaire entre les sessions et dans l'application autonome.
    libraryDict.parse(JSON.stringify(payload));
    saveExternalLibrary(libraryDict, persistentFilename("ndlr_motif" + motifId + "_library"));
    outlet(2, "library_saved", motifId);
    // Notifie mod_matrix et rotator_engine de recharger les patterns utilisateur.
    if (typeof messnamed !== "undefined") messnamed("mod_input", "reload_patterns");
}

// pattern_custom_save [21-40] : sauvegarde le pattern courant de l'éditeur dans le slot
function pattern_custom_save(slot) {
    var requested = Math.round(slot);
    if (requested < 21 || requested > 40) return;
    var idx = requested - 21;
    if (idx < 0 || idx > 19) return;
    loadSharedPatterns();
    patternSlots[idx] = {
        pattern: customPattern.slice(),
        pattlen: currentPattLen,
        type:    patternType
    };
    // Le pattern sauvegarde devient le pattern courant. Sans cette mise a jour,
    // un dumpstate ulterieur (notamment lors du changement M1/M2 dans le Rhythm
    // Editor) reaffiche l'ancien slot dans le menu alors que le multislider et
    // le moteur jouent toujours le pattern Perlin 39/40.
    currentPatternSlot = requested;
    saveSharedPatterns();
    // Resync le sélecteur de l'éditeur sur ce slot (sans toucher patternStep) :
    // le pattern qu'on vient de sauvegarder devient visuellement le pattern
    // affiché/sélectionné, sans interrompre la lecture en cours.
    outlet(2, "pattern_slot", requested);
    emitPatternSlotsUsed();
    // Les LFO PATT relisent immédiatement les slots utilisateur persistants.
    if (typeof messnamed !== "undefined") messnamed("mod_input", "reload_patterns");
}

// pattern_custom_load [1-40] : charge un preset fixe ou un slot utilisateur
function pattern_custom_load(slot) {
    var requested = Math.round(slot);
    if (requested >= 1 && requested <= 20) {
        // pattern_max doit partir avant pattern() (qui émet déjà pattlen puis
        // pattern_set dans le bon ordre) — ne pas réémettre pattlen ici, sinon
        // le "size" envoyé après pattern_set effacerait le multislider.
        outlet(2, "pattern_max", patternMax());
        pattern(requested);
        outlet(2, "pattern_type", patternType);
        outlet(2, "pattern_slot", requested);
        return;
    }
    if (requested < 21 || requested > 40) return;
    loadSharedPatterns();
    var idx = requested - 21;
    if (idx < 0 || idx > 19) return;
    var s = patternSlots[idx];
    if (!s) return;   // slot vide : on garde le pattern courant
    currentPatternSlot = requested;
    customPattern  = s.pattern.slice();
    currentPattLen = s.pattlen;
    patternType    = s.type;
    patternStep    = 0;
    syncPatternStepBases();
    // "pattlen" (→ "size" sur le multislider) doit toujours partir AVANT
    // "pattern_set" (→ "set v1...v16"), sinon le redimensionnement efface les
    // valeurs qu'on vient d'afficher (bug : le multislider ne se met pas à
    // jour quand on charge un pattern depuis le menu).
    outlet(2, "pattern_max", patternMax());
    outlet(2, "pattlen", currentPattLen);
    emitPatternSet();
    outlet(2, "pattern_type", patternType);
    outlet(2, "pattern_slot", requested);
}

// Chargement réservé à la matrice : le pattern change, mais pas Patt Len.
// Les deux destinations de modulation restent ainsi indépendantes, y compris
// lorsque la matrice traverse un slot utilisateur qui mémorise sa longueur.
function pattern_mod(slot) {
    var requested = Math.round(slot);
    if (requested >= 1 && requested <= 20) {
        pattern(requested);
        return;
    }
    if (requested < 21 || requested > 40) return;
    loadSharedPatterns();
    var s = patternSlots[requested - 21];
    if (!s) return;
    var preservedLen = currentPattLen;
    currentPatternSlot = requested;
    customPattern = s.pattern.slice();
    patternType = s.type;
    currentPattLen = preservedLen;
    patternStep = 0;
    syncPatternStepBases();
    outlet(2, "pattern_max", patternMax());
    outlet(2, "pattlen", currentPattLen);
    emitPatternSet();
    outlet(2, "pattern_type", patternType);
    outlet(2, "pattern_slot", requested);
}

// Réémet l'état complet vers les interfaces sans modifier le séquenceur.
function dumpstate() {
    loadSharedPatterns();
    syncPatternStepBases();
    // pattlen ("size") doit toujours partir avant pattern_set ("set v1...v16"),
    // sinon le redimensionnement du multislider efface les valeurs réaffichées.
    outlet(2, "pattern_max", patternMax());
    outlet(2, "pattlen", currentPattLen);
    emitPatternSet();
    outlet(2, "pattern_type", patternType);
    outlet(2, "pattern_slot", currentPatternSlot);
    outlet(2, "variation", currentVariation);
    outlet(2, "clkdiv", currentClkDiv);
    outlet.apply(this, [2, "rhythm"].concat(rhythmState));
    outlet.apply(this, [2, "rhythm_vel"].concat(rhythmVel));
    outlet.apply(this, [2, "rhythm_ratchet"].concat(rhythmRatchet));
    outlet(2, "rhythm_rate", rhythmRateIdx);
    outlet(2, "rhythm_len", rhythmLen);
    outlet(2, "rhythm_mode", rhythmMode);
    outlet(2, "euclid_pulses", euclidPulses);
    outlet(2, "euclid_rotate", euclidRotate);
    outlet(2, "rhythm_slot", currentRhythmSlot);
    emitPatternSlotsUsed();
    // L'autre Motif a pu sauvegarder un rythme depuis le dernier dump.
    loadSharedRhythms();
    emitRhythmSlotsUsed();
}

function allnotesoff() {
    stop();
}

function loadbang() {
    // Initialisation autoritaire de chaque instance Motif. Ne pas dépendre de
    // l'ordre des loadmess des bpatchers : le moteur charge lui-même le preset
    // Rhythm 1 et publie immédiatement l'état complet vers son feedback dédié.
    rhythm_pattern_load(1);
    outlet(2, "rhythm_rate", rhythmRateIdx);
    if (typeof messnamed !== 'undefined') messnamed('mod_input', 'part_active', 'motif' + motifId, 0);
}
