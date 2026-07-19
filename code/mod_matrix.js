// mod_matrix.js — Matrice de Modulation NDLR v3.4
// 13 entrées source (dont off) · 46 destinations · 8 slots
//
// inlet 0: messages de configuration
//   lfo [1-8] shape [0-46]    : 0-6 formes classiques, 7-46=PATT 1-40
//   lfo [1-8] rate [value]    : 0.4-240 secondes (sync=0)
//   lfo_div [1-8] [0-11]      : durée musicale d'un cycle LFO (sync=1)
//   lfo [1-8] sync [0-1]      : 0=temps libre, 1=beat-synced
//   lfo [1-8] prob [0-100]    : probabilité
//   lfo [1-8] pw [1-99]       : largeur d'impulsion en % (shape=pulse uniquement)
//   slot [1-8] src [0-12]     : source — voir SOURCES ci-dessous
//   slot [1-8] dst [0-201]    : destination — voir DESTS ci-dessous
//   slot [1-8] amt [0-100]    : quantité de modulation en %
//   slot [1-8] low [0-100]    : borne basse, en % de la plage destination
//   slot [1-8] high [0-100]   : borne haute, en % de la plage destination
//   slot [1-8] on [0-1]       : activer/désactiver le slot
//   slot [1-8] cc_channel [1-16] : canal des destinations MIDI CC du slot
//   slot [1-8] midi_cc [0-127]   : numéro de CC de la destination MIDI CC
//   setbase [dest_name] [value]  : mettre à jour la valeur de base d'une destination
//   beat                      : tick de beat (envoyé depuis ndlr_main via metro)
//   tempo [bpm]               : tempo global
//   start / stop              : démarrer/arrêter le moteur
//   midi_vel/pb/at [0-127]    : entrées MIDI
//   key_vel [0-127]           : vélocité du clavier externe (compatibilité interne)
//   midi_cc [val]             : valeur (0-127) du CC déjà filtré en amont (umenu) → source midi_cc
//                                (bipolaire : CC 64 = centre/0, CC 0 = -1, CC 127 = +1)
//   pattern_val [1-2] [0-24]  : valeur du pas courant du Pattern Editor (Motif 1 ou 2)
//
// outlet 0: messages de modulation
//   [dest_name] [valeur]      : valeur absolue modulée vers la destination
//
// outlets 1-8: visualisation (multislider) — un par slot de modulation
//   liste de VIZ_SIZE valeurs -1..1 : historique récent de la modulation du slot
//                                (0 si slot inactif), à router vers un multislider
//                                (taille VIZ_SIZE, range -1..1) par slot
//
// SOURCES (index):
//   0=off
//   1=lfo1 2=lfo2 3=lfo3 4=lfo4 5=lfo5 6=lfo6 7=lfo7 8=lfo8
//   9=midi_vel 10=midi_pb 11=midi_cc 12=midi_at
//
// DESTINATIONS (index):
//   0=none 1=key 2=scales 3=degree 4=color
//   5=pad_on 6=pad_register 7=pad_voice_grouping 8=pad_inversion 9=pad_strum 10=pad_velocity
//   11=drone_on 12=drone_position 13=drone_type 14=drone_trigger 15=drone_velocity
//   16=motif1_on 17=motif1_position 18=motif1_pattern 19=motif1_pattlen
//   20=motif1_variation 21=motif1_clkdiv 22=motif1_velocity
//   23=motif1_gate 24=motif1_accent 25=motif1_rhythm
//   26=motif2_on 27=motif2_position 28=motif2_pattern 29=motif2_pattlen
//   30=motif2_variation 31=motif2_clkdiv 32=motif2_velocity
//   33=motif2_gate 34=motif2_accent 35=motif2_rhythm
//   36=motif1_active_pattern 37=motif2_active_pattern
//   38=pnoise_x 39=pnoise_y 40=pnoise_zoom 41=pnoise_spacing
//   42=pnoise_ruff 43=pnoise_persistence 44=pnoise_brightness 45=midi_cc

autowatch = 1;
inlets    = 1;
outlets   = 9;   // 0 = modulation, 1-8 = visualisation par slot

// ── Tableaux de référence ─────────────────────────────────────────────────────

var SOURCES = [
    'off',
    'lfo1','lfo2','lfo3','lfo4','lfo5','lfo6','lfo7','lfo8',
    'midi_vel','midi_pb','midi_cc','midi_at'
];

var DESTS = [
    'none','key','mode','degree','chord_type',
    'pad_on','pad_register','pad_spread','pad_inversion',
    'pad_strum','pad_velocity',
    'drone_on','drone_position','drone_type','drone_trigger','drone_velocity',
    'motif1_on','motif1_position','motif1_pattern','motif1_pattlen',
    'motif1_variation','motif1_clkdiv','motif1_velocity',
    'motif1_gate','motif1_accent','motif1_rhythm',
    'motif2_on','motif2_position','motif2_pattern','motif2_pattlen',
    'motif2_variation','motif2_clkdiv','motif2_velocity',
    'motif2_gate','motif2_accent','motif2_rhythm'
];

// motif1_pattern et motif2_pattern choisissent le slot de pattern.
// motif[1/2]_active_pattern module toutes les valeurs du pattern actif.
// Les anciennes destinations par step ne font plus partie de la matrice.
DESTS.push('motif1_active_pattern', 'motif2_active_pattern');
DESTS.push('pnoise_x','pnoise_y','pnoise_zoom','pnoise_spacing','pnoise_ruff','pnoise_persistence');
DESTS.push('pnoise_brightness');
DESTS.push('midi_cc');

// [min, max] pour chaque destination
var RANGES = {
    key:[0,11], mode:[0,76], degree:[0,6], chord_type:[0,8],
    pad_register:[-2,2], pad_spread:[0,11], pad_inversion:[0,6], pad_strum:[1,21],
    drone_position:[0,4], drone_type:[1,4], drone_trigger:[1,19], drone_velocity:[1,127],
    motif1_position:[0,4], motif1_pattern:[1,40], motif1_pattlen:[1,16],
    motif1_variation:[1,6], motif1_clkdiv:[1,21], motif1_velocity:[0,127],
    motif2_position:[0,4], motif2_pattern:[1,40], motif2_pattlen:[1,16],
    motif2_variation:[1,6], motif2_clkdiv:[1,21], motif2_velocity:[0,127],
    pad_velocity:[0,127], pad_on:[0,1], drone_on:[0,1],
    motif1_gate:[5,127], motif1_accent:[1,10], motif1_rhythm:[1,40], motif1_on:[0,1],
    motif2_gate:[5,127], motif2_accent:[1,10], motif2_rhythm:[1,40], motif2_on:[0,1]
};

RANGES.motif1_active_pattern = [0,127];
RANGES.motif2_active_pattern = [0,127];
RANGES.pnoise_x = [0,999];
RANGES.pnoise_y = [0,999];
RANGES.pnoise_zoom = [1,100];
RANGES.pnoise_spacing = [0,100];
RANGES.pnoise_ruff = [1,100];
RANGES.pnoise_persistence = [1,100];
RANGES.pnoise_brightness = [0,100];
RANGES.midi_cc = [0,127];

// Destinations representees par les deux anneaux de key_degree_jsui.js.
// Leur modulation doit boucler autour de la valeur d'origine au lieu de se
// comporter comme une grandeur lineaire bornee.
var CIRCULAR_DESTINATIONS = { key:true, degree:true };
var SHAPE_NAMES = ['sine','triangle','ramp','saw','square','pulse','random'];

// Noms des 40 slots de pattern pour les menus LFO shape (7-46).
// Synchronisés avec les umenus du Pattern Editor (b_motif_1.maxpat obj-22).
var PATT_NAMES = [
    // Presets fixes 1-20
    'Up-Down','Third Leaps','Root Pivot','Ascending Zigzag',
    'High Drone','Cascade','Odd-Even','Alberti',
    "Chord Staircase",'Bass + Chord','Double Echo','Mirror',
    'Clave','Rhythmic','Pentatonic Feel','Alternating Pairs',
    'Spiral','Linked Steps','Fourth Leaps','Rotating',
    // Slots utilisateur 21-38
    'User 21','User 22','User 23','User 24','User 25','User 26',
    'User 27','User 28','User 29','User 30','User 31','User 32',
    'User 33','User 34','User 35','User 36','User 37','User 38',
    // Slots Perlin 39-40
    'Perlin M1','Perlin M2'
];

// Échelle dédiée aux LFO : un cran double ou divise par deux la durée du cycle.
// Le beat global vaut 96 ticks/noire, soit 384 ticks par mesure 4/4.
var LFO_SYNC_DIVISIONS = [
    {id:12,label:'128 bars',ticks:49152}, {id:11,label:'64 bars',ticks:24576},
    {id:10,label:'32 bars', ticks:12288},
    {id:1,label:'16 bars',ticks:6144}, {id:2,label:'8 bars',ticks:3072},
    {id:3,label:'4 bars', ticks:1536}, {id:4,label:'2 bars',ticks:768},
    {id:5,label:'1 bar',  ticks:384},  {id:6,label:'1/2 bar',ticks:192},
    {id:7,label:'1/4 bar',ticks:96},   {id:8,label:'1/8 bar',ticks:48},
    {id:9,label:'1/16 bar',ticks:24}
];

function lfoSyncDivisionById(id) {
    for (var i = 0; i < LFO_SYNC_DIVISIONS.length; i++) {
        if (LFO_SYNC_DIVISIONS[i].id === id) return LFO_SYNC_DIVISIONS[i];
    }
    return LFO_SYNC_DIVISIONS[6]; // 1 bar — valeur historique par défaut
}

function lfoSyncMenuIndexById(id) {
    for (var i = 0; i < LFO_SYNC_DIVISIONS.length; i++) {
        if (LFO_SYNC_DIVISIONS[i].id === id) return i;
    }
    return 6; // 1 bar
}

// Patterns fixes 1-20, valeurs NDLR 1-based. Les slots 21-40 sont chargés
// depuis la bibliothèque persistante Motif 1 (Motif 2 sert de secours).
var FIXED_PATTERNS = {
    1:[1,2,3,4,5,6,7,8,7,6,5,4,3,2,1,2],
    2:[1,3,5,2,4,6,3,5,7,4,6,8,5,7,6,4],
    3:[1,3,1,4,1,5,1,6,1,5,1,4,1,3,1,2],
    4:[1,3,2,4,3,5,4,6,5,7,6,8,7,6,5,4],
    5:[1,5,2,5,3,5,4,5,3,5,2,5,1,5,2,3],
    6:[1,2,3,1,2,3,4,2,3,4,5,3,4,5,6,4],
    7:[1,3,5,7,2,4,6,8,1,3,5,7,2,4,6,5],
    8:[1,3,2,3,1,3,2,3,1,4,2,4,1,4,2,4],
    9:[1,2,4,1,2,4,6,1,2,4,6,8,4,6,8,6],
    10:[1,4,6,4,1,5,7,5,1,4,6,4,2,5,7,5],
    11:[1,1,2,2,3,3,4,4,5,5,6,6,5,4,3,2],
    12:[1,8,2,7,3,6,4,5,4,6,3,7,2,8,1,5],
    13:[1,2,1,1,2,1,2,1,1,2,1,2,1,1,2,3],
    14:[1,2,3,5,1,2,4,5,1,3,4,5,1,2,3,4],
    15:[1,3,5,8,1,3,5,8,1,3,6,8,1,4,6,8],
    16:[1,5,3,7,2,6,4,8,1,5,3,7,2,6,4,6],
    17:[1,2,4,3,5,4,6,5,7,6,8,7,9,8,7,6],
    18:[1,2,1,3,2,4,3,5,4,6,5,7,6,8,7,5],
    19:[1,4,2,5,3,6,4,7,5,8,6,5,4,6,3,5],
    20:[1,3,6,4,1,5,7,3,1,4,6,8,3,5,7,1]
};
var pattPatterns = {};
var pattLengths = {};

// ── État global ───────────────────────────────────────────────────────────────

var currentTempo = 90;
var currentCcChannel = 1;
var currentCcSlot = 0;
var modulationParts = { global:true, pad:true, drone:true, motif1:true, motif2:true };
// Tous les generateurs demarrent arretes. Leur fonction start() publie ensuite
// explicitement part_active 1 ; ainsi aucune destination ne bouge avant cela.
var partActive = { pad:false, drone:false, motif1:false, motif2:false };
var isRunning    = false;
var tickTask     = null;
var lastTickMs   = 0;
var TICK_MS      = 20;   // ~50 Hz pour une modulation fluide

// Visualisation : un buffer (historique) par slot de modulation
var VIZ_SIZE    = 160;       // nombre de points affichés dans chaque multislider
var vizCurrent  = [0,0,0,0,0,0,0,0];   // dernière valeur normalisée -1..1 par slot
var vizBufs     = [
    makeVizBuf(), makeVizBuf(), makeVizBuf(), makeVizBuf(),
    makeVizBuf(), makeVizBuf(), makeVizBuf(), makeVizBuf()
];

// Array.fill() n'existe pas dans le moteur JS de Max — init manuelle.
function makeVizBuf() {
    var a = new Array(VIZ_SIZE);
    for (var i = 0; i < VIZ_SIZE; i++) a[i] = 0;
    return a;
}

// 8 LFOs configurables.
var lfos = [
    { rate:4.0, syncDiv:5, syncTicks:384, shape:0, prob:100, probGate:true, beatSync:false, phase:0.0,  shVal:0.5, pulseWidth:0.5 },
    { rate:4.0, syncDiv:5, syncTicks:384, shape:0, prob:100, probGate:true, beatSync:false, phase:0.25, shVal:0.5, pulseWidth:0.5 },
    { rate:4.0, syncDiv:5, syncTicks:384, shape:0, prob:100, probGate:true, beatSync:false, phase:0.0,  shVal:0.5, pulseWidth:0.5 },
    { rate:4.0, syncDiv:5, syncTicks:384, shape:0, prob:100, probGate:true, beatSync:false, phase:0.125, shVal:0.5, pulseWidth:0.5 },
    { rate:4.0, syncDiv:5, syncTicks:384, shape:0, prob:100, probGate:true, beatSync:false, phase:0.25,  shVal:0.5, pulseWidth:0.5 },
    { rate:4.0, syncDiv:5, syncTicks:384, shape:0, prob:100, probGate:true, beatSync:false, phase:0.375, shVal:0.5, pulseWidth:0.5 },
    { rate:4.0, syncDiv:5, syncTicks:384, shape:0, prob:100, probGate:true, beatSync:false, phase:0.5,   shVal:0.5, pulseWidth:0.5 },
    { rate:4.0, syncDiv:5, syncTicks:384, shape:0, prob:100, probGate:true, beatSync:false, phase:0.625, shVal:0.5, pulseWidth:0.5 }
];

// 8 slots de modulation
var slots = [];
(function() {
    for (var i = 0; i < 8; i++) {
        slots.push({ src:'off', dst:'none', amt:0, low:0, high:100, on:false,
            ccNumber:0, ccChannel:1, ccPort:'', lastResult:null, lastFeedback:null });
    }
})();

// Les Range sont prévisualisés pendant le drag, puis validés au mouse-up.
var pendingRanges = [];
(function() {
    for (var i = 0; i < 8; i++) {
        pendingRanges.push({ low:0, high:100, dirty:false });
    }
})();

var delayedUiInitTask = null;

// Valeurs de base de toutes les destinations (mises à jour depuis ndlr_main)
var baseVals = {
    key:0, mode:0, degree:0, chord_type:0,
    pad_register:0, pad_spread:0, pad_inversion:0, pad_strum:17,
    drone_position:3, drone_type:1, drone_trigger:1, drone_velocity:64,
    motif1_position:2, motif1_pattern:1, motif1_pattlen:8,
    motif1_variation:1, motif1_clkdiv:3, motif1_velocity:100,
    motif2_position:2, motif2_pattern:1, motif2_pattlen:8,
    motif2_variation:1, motif2_clkdiv:3, motif2_velocity:100,
    pad_velocity:100, pad_on:1, drone_on:1,
    motif1_gate:102, motif1_accent:1, motif1_rhythm:1, motif1_on:1,
    motif2_gate:102, motif2_accent:1, motif2_rhythm:1, motif2_on:1
};
baseVals.motif1_active_pattern = 64;
baseVals.motif2_active_pattern = 64;
baseVals.pnoise_x = 0;
baseVals.pnoise_y = 0;
baseVals.pnoise_zoom = 10;
baseVals.pnoise_spacing = 0;
baseVals.pnoise_ruff = 50;
baseVals.pnoise_persistence = 30;
baseVals.pnoise_brightness = 100;
baseVals.midi_cc = 0;
// Entrées MIDI normalisées 0-1 (unipolaires)
var midi = { vel:0.0, pb:0.5, cc:0.0, at:0.0, keyVel:0.0, patternM1:0.0, patternM2:0.0 };

// ── Moteur de formes d'onde ───────────────────────────────────────────────────

function evalWave(lfo) {
    var p = lfo.phase;
    switch (lfo.shape) {
        case 0: return Math.sin(p * 2 * Math.PI);         // sine [−1, 1] bipolaire
        case 1: return p < 0.5 ? p * 2 : 2 - p * 2;      // triangle [0, 1]
        case 2: return p;                                  // ramp [0, 1]
        case 3: return 1 - p;                              // saw [0, 1]
        case 4: return p < 0.5 ? 1 : 0;                   // square [0, 1]
        case 5: return p < lfo.pulseWidth ? 1 : 0;        // pulse avec largeur réglable
        case 6: return lfo.shVal;                          // S&H aléatoire [0, 1]
        default: return 0;
    }
}

function isPattShape(shape) { return shape >= 7 && shape <= 46; }

function evalPatt(lfo) {
    var slot = lfo.shape - 6;
    var pat = pattPatterns[slot] || FIXED_PATTERNS[slot] || FIXED_PATTERNS[1];
    var len = pattLengths[slot] || pat.length || 16;
    var idx = Math.min(len - 1, Math.floor(lfo.phase * len));
    var value = pat[idx] === undefined ? 1 : Number(pat[idx]);
    return isNaN(value) ? 1 : value;
}

function isBipolar(shape) { return shape === 0; }

function normalizePattAmount(idx) {
    // Supprimé : les patterns respectent désormais l'amount comme les autres sources.
}

// Un tirage par cycle donne une réponse temporelle réellement linéaire :
// 30 % = environ 3 cycles actifs sur 10, indépendamment du nombre de ticks.
function rollLfoProbability(lfo) {
    if (lfo.prob >= 100) return true;
    if (lfo.prob <= 0) return false;
    return Math.random() * 100 < lfo.prob;
}

// ── Avancement des phases ─────────────────────────────────────────────────────

// Avance les LFOs en mode temps-libre (appelé à chaque tick 40ms)
function advanceTimeLfos(dtMs) {
    var i, lfo, period;
    for (i = 0; i < lfos.length; i++) {
        lfo = lfos[i];
        if (lfo.beatSync) continue;
        period = lfo.rate * 1000;  // secondes → ms
        lfo.phase += dtMs / period;
        if (lfo.phase >= 1.0) {
            lfo.phase -= Math.floor(lfo.phase);
            lfo.probGate = rollLfoProbability(lfo);
            if (lfo.shape === 6) lfo.shVal = Math.random();
        }
    }
}

// Avance les LFOs beat-synced (appelé à chaque beat depuis ndlr_main)
function advanceBeatLfos() {
    var i, lfo;
    for (i = 0; i < lfos.length; i++) {
        lfo = lfos[i];
        if (!lfo.beatSync) continue;
        lfo.phase += 1.0 / lfo.syncTicks;
        if (lfo.phase >= 1.0) {
            lfo.phase -= Math.floor(lfo.phase);
            lfo.probGate = rollLfoProbability(lfo);
            if (lfo.shape === 6) lfo.shVal = Math.random();
        }
    }
}

// ── Récupération de la valeur source ─────────────────────────────────────────

function getLfoObj(name) {
    var m = /^lfo([1-8])$/.exec(String(name));
    if (!m) return null;
    return lfos[Math.round(Number(m[1])) - 1] || null;
}

// Retourne la valeur brute de la source (null = skip ce tick)
function getSourceVal(srcName) {
    var lfoObj = getLfoObj(srcName);
    if (lfoObj) {
        if (!lfoObj.probGate) return null;
        return isPattShape(lfoObj.shape) ? evalPatt(lfoObj) : evalWave(lfoObj);
    }
    switch(srcName) {
        case 'midi_vel': return midi.vel;
        case 'midi_pb':  return midi.pb;
        case 'midi_cc':  return midi.cc * 2 - 1;  // bipolaire : centre (CC 64) = 0
        case 'midi_at':  return midi.at;
        case 'key_vel':  return midi.keyVel;
        case 'pattern_m1': return midi.patternM1;
        case 'pattern_m2': return midi.patternM2;
        default:         return null;
    }
}

// ── Calcul et émission des valeurs modulées ───────────────────────────────────

function processSlot(slot, idx, forceDestination) {
    if (!slot.on || slot.src === 'off' || slot.dst === 'none') {
        vizCurrent[idx] = 0;
        return;
    }
    var destinationSection = destinationPart(slot.dst);
    if (!forceDestination && destinationSection && modulationParts[destinationSection] === false) {
        vizCurrent[idx] = 0;
        return;
    }
    // L'etat Start/Stop du module cible bloque uniquement l'envoi. La preview
    // continue d'evaluer la source tant que la matrice et le slot sont actifs.
    // Les quatre destinations d'activation doivent rester joignables quand leur
    // section est arrêtée : ce sont précisément elles qui peuvent la rallumer.
    // Les autres destinations restent silencieuses jusqu'au prochain Start.
    var destinationActive = forceDestination || isActivationDestination(slot.dst) ||
        !(destinationSection && partActive[destinationSection] === false);
    if (!destinationActive) slot.lastResult = null;

    // Une quantité nulle signifie réellement « aucune modulation ».
    // Ne pas réémettre la valeur de base à chaque tick : pour chord_type,
    // chaque message reconstruit l'accord et tous les pools de notes.
    if (slot.amt <= 0) {
        vizCurrent[idx] = 0;
        return;
    }
    var r = RANGES[slot.dst];
    if (!r) { vizCurrent[idx] = 0; return; }

    var raw = getSourceVal(slot.src);
    if (raw === null) return;  // cycle probabiliste inactif — on garde la dernière valeur viz

    var baseVal  = (baseVals[slot.dst] !== undefined) ? baseVals[slot.dst] : r[0];
    var amt      = slot.amt / 100.0;
    var fullRange = r[1] - r[0];
    var lfoObj   = getLfoObj(slot.src);
    var pattSource = lfoObj && isPattShape(lfoObj.shape);

    // PATT : normalise la valeur brute (1-8) vers [0,1], puis applique
    // low/high/amount exactement comme un LFO unipolaire classique.
    if (pattSource) {
        var PATT_MAX = 8;
        var pattNorm = Math.max(0, Math.min(1, (raw - 1) / (PATT_MAX - 1)));
        var pattLow  = r[0] + fullRange * (slot.low  / 100.0);
        var pattHigh = r[0] + fullRange * (slot.high / 100.0);
        var pattTarget = pattLow + pattNorm * (pattHigh - pattLow);
        var pattResult = Math.max(r[0], Math.min(r[1],
            Math.round(baseVal + amt * (pattTarget - baseVal))));
        if (slot.lastFeedback !== pattResult) {
            emitDestinationFeedback(slot.dst, pattResult);
            slot.lastFeedback = pattResult;
        }
        if (destinationActive && slot.lastResult !== pattResult) {
            emitDestination(slot.dst, pattResult, slot);
            slot.lastResult = pattResult;
        }
        var pattSpan = Math.max(1, r[1] - r[0]);
        vizCurrent[idx] = Math.max(-1, Math.min(1,
            ((pattResult - r[0]) / pattSpan) * 2 - 1));
        return;
    }
    // midi_cc est bipolaire (centre = CC 64) ; les LFOs/mods le sont si shape sine.
    var bipolar  = lfoObj ? isBipolar(lfoObj.shape) : (slot.src === 'midi_cc');

    // Low/High sont des pourcentages de la plage légale de destination.
    // Pour une source bipolaire, raw=0 signifie exactement "aucune deviation"
    // et doit donc rendre baseVal (sinon Key demarrait toujours au milieu de
    // 0..11, soit 6/Gb, quelle que soit sa valeur d'origine).
    var lowValue = r[0] + fullRange * (slot.low / 100.0);
    var highValue = r[0] + fullRange * (slot.high / 100.0);

    // Les roues Key et Degree sont circulaires. Avec Sine, parcourir tous les
    // offsets pendant la premiere moitie du cycle, puis revenir a l'origine
    // pendant la seconde. Le modulo conserve ce trajet depuis chaque origine.
    if (CIRCULAR_DESTINATIONS[slot.dst] && lfoObj && isBipolar(lfoObj.shape)) {
        var circularCycle = (1 - Math.cos(lfoObj.phase * 2 * Math.PI)) * 0.5;
        var circularSize = r[1] - r[0] + 1;
        var circularSpan = circularSize - 1;
        var circularLowOffset = circularSpan * (slot.low / 100.0);
        var circularHighOffset = circularSpan * (slot.high / 100.0);
        var circularOffset = amt * (circularLowOffset +
            circularCycle * (circularHighOffset - circularLowOffset));
        var relativeBase = baseVal - r[0];
        var wrapped = ((Math.round(relativeBase + circularOffset) % circularSize) +
            circularSize) % circularSize;
        var circularResult = r[0] + wrapped;

        if (slot.lastFeedback !== circularResult) {
            emitDestinationFeedback(slot.dst, circularResult);
            slot.lastFeedback = circularResult;
        }
        if (destinationActive && slot.lastResult !== circularResult) {
            emitDestination(slot.dst, circularResult, slot);
            slot.lastResult = circularResult;
        }
        vizCurrent[idx] = Math.max(-1, Math.min(1,
            (circularCycle * 2 - 1) * amt));
        return;
    }

    var rangeTarget;
    if (bipolar) {
        raw = Math.max(-1, Math.min(1, raw));
        rangeTarget = raw < 0
            ? baseVal + (-raw) * (lowValue - baseVal)
            : baseVal + raw * (highValue - baseVal);
    } else {
        var normalized = Math.max(0, Math.min(1, raw));
        rangeTarget = lowValue + normalized * (highValue - lowValue);
    }
    var result = baseVal + amt * (rangeTarget - baseVal);

    result = Math.max(r[0], Math.min(r[1], Math.round(result)));
    if (slot.lastFeedback !== result) {
        emitDestinationFeedback(slot.dst, result);
        slot.lastFeedback = result;
    }
    // Les destinations discrètes (notamment chord_type) ne doivent être
    // recalculées que lorsque leur valeur change réellement.
    if (destinationActive && slot.lastResult !== result) {
        emitDestination(slot.dst, result, slot);
        slot.lastResult = result;
    }

    // Visualisation : oscillation de la source de modulation (-1..1), pondérée par amt.
    // bipolaire (sine) : raw est déjà -1..1 → norm = raw * amt
    // unipolaire : raw est 0..1 → ramené à -1..1 puis pondéré par amt
    var norm = bipolar ? (raw * amt) : ((raw * 2 - 1) * amt);
    vizCurrent[idx] = Math.max(-1, Math.min(1, norm));
}

function isActivationDestination(dest) {
    return dest === 'pad_on' || dest === 'drone_on' ||
        dest === 'motif1_on' || dest === 'motif2_on';
}

// Les destinations ajoutées après la première version de la matrice sont
// distribuées par send nommé. Cela maintient l'ordre historique des sorties
// du [route] dans ndlr_main et évite de casser les patchs/presets existants.
function emitDestination(dest, value, slotConfig) {
    outlet(0, dest, value);
    var named = {
        pad_velocity:'m_pad_velocity', pad_on:'m_pad_on', drone_on:'m_drone_on',
        drone_velocity:'drone_vel',
        motif1_gate:'m_motif1_gate', motif1_accent:'m_motif1_accent',
        motif1_rhythm:'m_motif1_rhythm', motif1_on:'m_motif1_on',
        motif2_gate:'m_motif2_gate', motif2_accent:'m_motif2_accent',
        motif2_rhythm:'m_motif2_rhythm', motif2_on:'m_motif2_on'
    };
    if (named[dest]) messnamed(named[dest], value);

    if (dest === 'motif1_clkdiv') {
        var rate1 = Math.max(0, Math.min(20, Math.round(value) - 1));
        messnamed('motif1_editor', 'rhythm_rate', rate1);
        messnamed('ndlr_rate1', rate1);
        return;
    }
    if (dest === 'motif2_clkdiv') {
        var rate2 = Math.max(0, Math.min(20, Math.round(value) - 1));
        messnamed('motif2_editor', 'rhythm_rate', rate2);
        messnamed('ndlr_rate2', rate2);
        return;
    }

    if (dest === 'motif1_active_pattern') {
        messnamed('m_motif1_mod', 'pattern_all_mod', value);
        return;
    }
    if (dest === 'motif2_active_pattern') {
        messnamed('m_motif2_mod', 'pattern_all_mod', value);
        return;
    }
    // Perlin Noise est depuis un module externe partagé (b_perlin_noise.maxpat /
    // ndlr_perlin_jsui.js, ciblé via son varname "m_perlin_mod"), plus l'ancien
    // moteur interne par Motif (pnoise_x_mod sur m_motif1_mod/m_motif2_mod) qui a
    // été retiré de motif_builder.js. Les noms de destination restent identiques
    // (pas de renumérotation des slots existants) ; seul le routage change.
    var perlinMap = {
        pnoise_x:'setx', pnoise_y:'sety', pnoise_zoom:'zoom',
        pnoise_spacing:'spc', pnoise_ruff:'ruff',
        pnoise_persistence:'per', pnoise_brightness:'brightness'
    };
    if (perlinMap[dest]) {
        if (dest === 'pnoise_brightness') messnamed('m_perlin_lum', value);
        messnamed('m_perlin_mod', perlinMap[dest], value);
        return;
    }
    if (dest === 'midi_cc') {
        var ccNumber = slotConfig ? slotConfig.ccNumber : 0;
        var channel = slotConfig ? slotConfig.ccChannel : currentCcChannel;
        outlet(0, 'midi_cc_out', value, ccNumber, channel);
    }
}

// Retours purement visuels. Ils sont séparés des bus moteur afin que les jsui
// suivent la matrice même lorsque la partie Pad/Drone est arrêtée.
function emitDestinationFeedback(dest, value) {
    var feedback = {
        pad_on:'m_pad_on_ui',
        pad_register:'m_pad_register_ui',
        pad_spread:'m_pad_spread_ui',
        pad_inversion:'m_pad_inversion_ui',
        pad_strum:'m_pad_strum_ui',
        pad_velocity:'m_pad_velocity_ui',
        drone_on:'m_drone_on_ui',
        drone_position:'m_drone_position_ui',
        drone_type:'m_drone_type_ui',
        drone_trigger:'m_drone_trigger_ui',
        drone_velocity:'m_drone_velocity_ui',
        motif1_on:'m_motif1_on_ui',
        motif1_position:'m_motif1_position_ui',
        motif1_pattern:'m_motif1_pattern_ui',
        motif1_pattlen:'m_motif1_pattlen_ui',
        motif1_variation:'m_motif1_variation_ui',
        motif1_clkdiv:'m_motif1_clkdiv_ui',
        motif1_velocity:'m_motif1_velocity_ui',
        motif1_gate:'m_motif1_gate_ui',
        motif1_accent:'m_motif1_accent_ui',
        motif1_rhythm:'m_motif1_rhythm_ui',
        motif2_on:'m_motif2_on_ui',
        motif2_position:'m_motif2_position_ui',
        motif2_pattern:'m_motif2_pattern_ui',
        motif2_pattlen:'m_motif2_pattlen_ui',
        motif2_variation:'m_motif2_variation_ui',
        motif2_clkdiv:'m_motif2_clkdiv_ui',
        motif2_velocity:'m_motif2_velocity_ui',
        motif2_gate:'m_motif2_gate_ui',
        motif2_accent:'m_motif2_accent_ui',
        motif2_rhythm:'m_motif2_rhythm_ui',
        pnoise_brightness:'m_perlin_lum'
    };
    if (feedback[dest]) messnamed(feedback[dest], value);
    if (dest === 'motif1_active_pattern') {
        messnamed('m_motif1_mod', 'pattern_all_mod_feedback', value);
    }
    if (dest === 'motif2_active_pattern') {
        messnamed('m_motif2_mod', 'pattern_all_mod_feedback', value);
    }
}

function isActivePatternDest(dest) {
    return dest === 'motif1_active_pattern' || dest === 'motif2_active_pattern';
}

function resetActivePatternDest(dest) {
    if (!isActivePatternDest(dest)) return;
    var neutral = (baseVals[dest] !== undefined) ? baseVals[dest] : 64;
    emitDestinationFeedback(dest, neutral);
}

function resetActivePatternSlot(idx) {
    if (idx < 0 || idx > 7) return;
    if (!isActivePatternDest(slots[idx].dst)) return;
    resetActivePatternDest(slots[idx].dst);
    slots[idx].lastFeedback = (baseVals[slots[idx].dst] !== undefined) ? baseVals[slots[idx].dst] : 64;
    slots[idx].lastResult = null;
    vizCurrent[idx] = 0;
}

function resetActivePatternSlots() {
    for (var i = 0; i < 8; i++) resetActivePatternSlot(i);
}

function destinationPart(dest) {
    if (dest.indexOf('pad_') === 0) return 'pad';
    if (dest.indexOf('drone_') === 0) return 'drone';
    if (dest.indexOf('motif1_') === 0) return 'motif1';
    if (dest.indexOf('motif2_') === 0) return 'motif2';
    if (dest === 'key' || dest === 'mode' || dest === 'degree' || dest === 'chord_type') return 'global';
    return null;
}

// mod_pause [global|pad|drone|motif1|motif2] [0|1]
function mod_pause(part, paused) {
    var name = String(part);
    if (modulationParts[name] === undefined) return;
    modulationParts[name] = paused ? false : true;
}

function part_active(part, active) {
    var name = String(part);
    if (partActive[name] === undefined) return;
    partActive[name] = active ? true : false;
}

function destinationLabel(dest) {
    if (dest === 'mode') return 'scales';
    if (dest === 'chord_type') return 'color';
    if (dest === 'pad_spread') return 'pad voice grouping';
    if (dest === 'midi_cc') return 'midi cc';
    if (dest === 'pnoise_brightness') return 'perlin noise lum';
    if (dest === 'motif1_active_pattern') return 'm1 active pattern';
    if (dest === 'motif2_active_pattern') return 'm2 active pattern';
    return dest.replace('motif1_', 'm1 ').replace('motif2_', 'm2 ')
        .replace('pnoise_', 'perlin noise ').replace(/_/g, ' ');
}

function configureMenus() {
    if (!this.patcher || !this.patcher.getnamed) return;
    var i, j, menu;
    for (i = 1; i <= 8; i++) {
        menu = this.patcher.getnamed('mm_s' + i + 'sr');
        if (menu) {
            menu.message('clear');
            for (j = 0; j < SOURCES.length; j++) menu.message('append', SOURCES[j].replace(/_/g, ' '));
        }
        menu = this.patcher.getnamed('mm_s' + i + 'ds');
        if (menu) {
            menu.message('clear');
            for (j = 0; j < DESTS.length; j++) menu.message('append', destinationLabel(DESTS[j]));
        }
    }
    for (i = 1; i <= lfos.length; i++) {
        menu = this.patcher.getnamed('mm_l' + i + 's');
        if (menu) {
            menu.message('clear');
            for (j = 0; j < SHAPE_NAMES.length; j++) menu.message('append', SHAPE_NAMES[j]);
            for (j = 0; j < PATT_NAMES.length; j++) menu.message('append', PATT_NAMES[j]);
        }
        menu = this.patcher.getnamed('mm_l' + i + 'd');
        if (menu) {
            menu.message('clear');
            for (j = 0; j < LFO_SYNC_DIVISIONS.length; j++) menu.message('append', LFO_SYNC_DIVISIONS[j].label);
        }
    }
}

function configureLfoRateUI(idx) {
    if (idx < 0 || idx >= lfos.length) return;
    var menuIndex = lfoSyncMenuIndexById(lfos[idx].syncDiv);
    messnamed('mod_matrix_lfo_ui', 'rateui', idx + 1, lfos[idx].beatSync ? 1 : 0, menuIndex);
    if (!this.patcher || !this.patcher.getnamed) return;
    var rateNumber = this.patcher.getnamed('mm_l' + (idx + 1) + 'r');
    var divMenu = this.patcher.getnamed('mm_l' + (idx + 1) + 'd');
    if (rateNumber) rateNumber.message('hidden', lfos[idx].beatSync ? 1 : 0);
    if (divMenu) {
        divMenu.message('hidden', lfos[idx].beatSync ? 0 : 1);
        divMenu.message('set', menuIndex);
    }
}

function configureSlotRange(idx) {
    if (!this.patcher || !this.patcher.getnamed || idx < 0 || idx > 7) return;
    pendingRanges[idx].low = slots[idx].low;
    pendingRanges[idx].high = slots[idx].high;
    pendingRanges[idx].dirty = false;
    var rangeObj = this.patcher.getnamed('mm_s' + (idx + 1) + 'range');
    var lowDisplay = this.patcher.getnamed('mm_s' + (idx + 1) + 'low_display');
    var highDisplay = this.patcher.getnamed('mm_s' + (idx + 1) + 'high_display');
    if (rangeObj) rangeObj.message('set', slots[idx].low, slots[idx].high);
    if (lowDisplay) lowDisplay.message('set', slots[idx].low);
    if (highDisplay) highDisplay.message('set', slots[idx].high);
}

// ── Tick principal (time-based LFOs) ─────────────────────────────────────────

function tick() {
    if (!isRunning) return;
    var now = new Date().getTime();
    var dt  = (lastTickMs > 0) ? (now - lastTickMs) : TICK_MS;
    lastTickMs = now;
    advanceTimeLfos(dt);
    for (var i = 0; i < 8; i++) processSlot(slots[i], i);
    pushViz();
}

// Pousse la dernière valeur viz de chaque slot dans son buffer et émet la liste
// sur l'outlet correspondant (1-8), destinée à un multislider par slot (taille
// VIZ_SIZE, configuré en -1..1).
function pushViz() {
    for (var i = 0; i < 8; i++) {
        var buf = vizBufs[i];
        buf.shift();
        buf.push(vizCurrent[i]);
        outlet.apply(this, [1 + i].concat(buf));
    }
}

// ── Tick beat (beat-synced LFOs, déclenché depuis ndlr_main via metro) ────────

function beat() {
    if (!isRunning) return;
    advanceBeatLfos();
    // Émettre uniquement les slots avec source beat-synced
    for (var i = 0; i < 8; i++) {
        var s = slots[i];
        if (!s.on) continue;
        var lfoObj = getLfoObj(s.src);
        if (lfoObj && lfoObj.beatSync) processSlot(s, i);
    }
    pushViz();
}

// ── API publique ──────────────────────────────────────────────────────────────

function resetLfoPhases() {
    var i, lfo;
    for (i = 0; i < lfos.length; i++) {
        lfo = lfos[i];
        lfo.phase = 0;
        lfo.shVal = 0.5;
        lfo.probGate = rollLfoProbability(lfo);
    }
}

// Rend le reset de phase immediatement visible et effectif. Sans cette
// publication, stop() remettait bien phase a zero en interne, mais les
// destinations et les courbes restaient figees sur le dernier echantillon.
function publishResetLfoState() {
    for (var i = 0; i < slots.length; i++) {
        if (!getLfoObj(slots[i].src)) continue;

        for (var j = 0; j < VIZ_SIZE; j++) vizBufs[i][j] = 0;
        vizCurrent[i] = 0;
        slots[i].lastResult = null;
        slots[i].lastFeedback = null;
        processSlot(slots[i], i, true);
    }
    pushViz();
}

// Au Stop, les destinations ne doivent pas rester sur le dernier echantillon
// ni sur la valeur de phase zero du LFO : elles reviennent a leur valeur de
// base (notamment Key/Mode/Degree). Le prochain Start republiera ensuite la
// phase zero via publishResetLfoState().
function restoreLfoDestinationsToBase() {
    var restored = {};
    for (var i = 0; i < slots.length; i++) {
        var slot = slots[i];
        if (!slot.on || slot.amt <= 0 || !getLfoObj(slot.src) ||
                slot.dst === 'none' || !RANGES[slot.dst]) continue;
        // MIDI CC peut viser plusieurs numeros avec le meme nom de destination.
        if (slot.dst !== 'midi_cc' && restored[slot.dst]) continue;

        var baseValue = (baseVals[slot.dst] !== undefined)
            ? baseVals[slot.dst] : RANGES[slot.dst][0];
        emitDestinationFeedback(slot.dst, baseValue);
        emitDestination(slot.dst, baseValue, slot);
        slot.lastFeedback = baseValue;
        slot.lastResult = null;
        restored[slot.dst] = true;
    }
}

function clearLfoVisualState() {
    for (var i = 0; i < slots.length; i++) {
        if (!getLfoObj(slots[i].src)) continue;
        for (var j = 0; j < VIZ_SIZE; j++) vizBufs[i][j] = 0;
        vizCurrent[i] = 0;
    }
    pushViz();
}

function start() {
    var wasRunning = isRunning;
    resetLfoPhases();
    publishResetLfoState();
    isRunning  = true;
    lastTickMs = 0;
    if (tickTask) tickTask.cancel();
    tickTask = new Task(tick, this);
    tickTask.interval = TICK_MS;
    tickTask.repeat();
    if (!wasRunning) post("mod_matrix: démarré\n");
}

function stop() {
    var wasRunning = isRunning;
    isRunning = false;
    if (tickTask) { tickTask.cancel(); tickTask = null; }
    resetActivePatternSlots();
    resetLfoPhases();
    restoreLfoDestinationsToBase();
    clearLfoVisualState();
    lastTickMs = 0;
    if (wasRunning) post("mod_matrix: arrêté\n");
}

// lfo [1-8] [param] [value]
function lfo() {
    var args = arrayfromargs(arguments);
    if (args.length < 3) return;
    var idx = Math.round(args[0]) - 1;
    if (idx < 0 || idx >= lfos.length) return;
    var param = args[1];
    var val   = args[2];
    switch (param) {
        case 'rate':
            lfos[idx].rate = Math.max(0.4, Math.min(240, parseFloat(val)));
            break;
        case 'shape':
            lfos[idx].shape = Math.max(0, Math.min(46, Math.round(val)));
            for (var slotIndex = 0; slotIndex < slots.length; slotIndex++) {
                if (slots[slotIndex].src === 'lfo' + (idx + 1)) {
                    normalizePattAmount.call(this, slotIndex);
                }
            }
            break;
        case 'prob':
            lfos[idx].prob = Math.max(1, Math.min(100, Math.round(val)));
            lfos[idx].probGate = rollLfoProbability(lfos[idx]);
            break;
        case 'pw':
            lfos[idx].pulseWidth = Math.max(0.01, Math.min(0.99, parseFloat(val) / 100));
            break;
        case 'sync':
            lfos[idx].beatSync = (val ? true : false);
            lfos[idx].phase = 0;
            lfos[idx].probGate = rollLfoProbability(lfos[idx]);
            configureLfoRateUI.call(this, idx);
            break;
    }
}

// Index 0-based provenant du menu de durées de cycle synchronisées.
function lfo_div(lfoNumber, menuIndex) {
    var idx = Math.round(lfoNumber) - 1;
    var divIndex = Math.max(0, Math.min(LFO_SYNC_DIVISIONS.length - 1, Math.round(menuIndex)));
    if (idx < 0 || idx >= lfos.length) return;
    var division = LFO_SYNC_DIVISIONS[divIndex];
    lfos[idx].syncDiv = division.id;
    lfos[idx].syncTicks = division.ticks;
    lfos[idx].phase = 0;
}

// slot [1-8] [param] [value]
function slot() {
    var args = arrayfromargs(arguments);
    if (args.length < 3) return;
    var idx  = Math.round(args[0]) - 1;
    if (idx < 0 || idx > 7) return;
    var param = args[1];
    var val   = args[2];
    switch (param) {
        case 'src':
            var previousSrc = slots[idx].src;
            if (typeof val === 'number') {
                slots[idx].src = SOURCES[Math.round(val)] || 'off';
            } else {
                slots[idx].src = val;
            }
            if (previousSrc !== 'off' && slots[idx].src === 'off') resetActivePatternSlot(idx);
            normalizePattAmount.call(this, idx);
            break;
        case 'dst':
            var previousDst = slots[idx].dst;
            if (typeof val === 'number') {
                slots[idx].dst = DESTS[Math.round(val)] || 'none';
            } else {
                slots[idx].dst = val;
            }
            if (previousDst !== slots[idx].dst) resetActivePatternDest(previousDst);
            slots[idx].lastResult = null;
            slots[idx].lastFeedback = null;
            configureSlotRange.call(this, idx);
            break;
        case 'amt':
            var previousAmt = slots[idx].amt;
            slots[idx].amt = Math.max(0, Math.min(100, Math.round(val)));
            normalizePattAmount.call(this, idx);
            // Quand on ramène une modulation active à zéro, restaurer sa
            // destination une seule fois, puis rester silencieux.
            if (previousAmt > 0 && slots[idx].amt === 0 &&
                    slots[idx].on && slots[idx].dst !== 'none' &&
                    RANGES[slots[idx].dst]) {
                if (isActivePatternDest(slots[idx].dst)) {
                    resetActivePatternSlot(idx);
                } else {
                    emitDestination(slots[idx].dst, baseVals[slots[idx].dst], slots[idx]);
                }
                slots[idx].lastResult = baseVals[slots[idx].dst];
                vizCurrent[idx] = 0;
            }
            break;
        case 'on':
            var previousOn = slots[idx].on;
            slots[idx].on = (val ? true : false);
            if (previousOn && !slots[idx].on) resetActivePatternSlot(idx);
            break;
        case 'cc_channel':
            slots[idx].ccChannel = Math.max(1, Math.min(16, Math.round(val)));
            slots[idx].lastResult = null;
            slots[idx].lastFeedback = null;
            break;
        case 'midi_cc':
            slots[idx].ccNumber = Math.max(0, Math.min(127, Math.round(val)));
            slots[idx].lastResult = null;
            slots[idx].lastFeedback = null;
            break;
        case 'cc_port':
            slots[idx].ccPort = String(val || '');
            break;
        case 'low':
            pendingRanges[idx].low = Math.max(0, Math.min(pendingRanges[idx].high, Math.round(val)));
            pendingRanges[idx].dirty = true;
            break;
        case 'high':
            pendingRanges[idx].high = Math.max(pendingRanges[idx].low, Math.min(100, Math.round(val)));
            pendingRanges[idx].dirty = true;
            break;
    }
}

// Appelé par mousestate au relâchement du bouton de souris.
function range_release() {
    for (var i = 0; i < 8; i++) {
        var pending = pendingRanges[i];
        if (!pending.dirty) continue;
        slots[i].low = pending.low;
        slots[i].high = pending.high;
        slots[i].lastResult = null;
        pending.dirty = false;
        configureSlotRange.call(this, i);
    }
}

// bset [dest] [val] — met à jour la valeur de base d'une destination.
// Renommé depuis "base" car "base" est un sélecteur réservé dans Max/js
// qui ne route pas vers une fonction nommée et génère "js: no function base".
// Envoyer : [bset key 5] ou [bset mode 2] etc.
function setbase() {
    var args = arrayfromargs(arguments);
    if (args.length < 2) return;
    var dest = args[0];
    var val  = parseFloat(args[1]);
    if (RANGES[dest]) {
        baseVals[dest] = Math.max(RANGES[dest][0], Math.min(RANGES[dest][1], val));
    }
}

// anything() — supprime silencieusement les sélecteurs inconnus (pas d'erreur console).
function anything() {}

// loadbang() — appelé automatiquement au chargement du patch : initialise les
// multisliders de visualisation à zéro (sinon ils affichent leur contenu par
// défaut, qui ne reflète pas l'état initial amt=0 des slots).
// Pas de démarrage automatique - l'utilisateur active depuis p_mod_matrix.
function loadbang() {
    loadClockDivisions();
    reload_patterns();
    configureMenus();
    for (var lfoIndex = 0; lfoIndex < lfos.length; lfoIndex++) configureLfoRateUI.call(this, lfoIndex);
    for (var i = 0; i < 8; i++) configureSlotRange.call(this, i);
    pushViz();

    // Les bpatchers LFO peuvent finir leur loadbang apres le moteur. Rejouer
    // l'etat Sync/Free un peu plus tard evite qu'un menu "128 bars" reste
    // visible alors que le LFO est en temps libre.
    if (typeof Task !== "undefined") {
        if (delayedUiInitTask) delayedUiInitTask.cancel();
        delayedUiInitTask = new Task(function() {
            for (var j = 0; j < lfos.length; j++) configureLfoRateUI.call(this, j);
            for (var k = 0; k < 8; k++) configureSlotRange.call(this, k);
        }, this);
        delayedUiInitTask.schedule(500);
    }
}

function loadClockDivisions() {
    // Initialise les ticks depuis l'échelle dédiée aux cycles LFO synchronisés.
    for (var i = 0; i < lfos.length; i++) {
        var division = lfoSyncDivisionById(lfos[i].syncDiv);
        lfos[i].syncTicks = Number(division.ticks) || 384;
    }
}

function tempo(bpm) {
    currentTempo = Math.max(10, Math.min(300, parseFloat(bpm)));
}

function cc_channel(v) {
    currentCcChannel = Math.max(1, Math.min(16, Math.round(v)));
    slots[currentCcSlot].ccChannel = currentCcChannel;
    slots[currentCcSlot].lastResult = null;
}

function cc_slot(v) {
    currentCcSlot = Math.max(0, Math.min(7, Math.round(v) - 1));
    currentCcChannel = slots[currentCcSlot].ccChannel;
    if (this.patcher && this.patcher.getnamed) {
        var channelUi = this.patcher.getnamed('mm-cc-channel');
        if (channelUi) channelUi.message('set', currentCcChannel);
    }
}

function cc_port() {
    var args = arrayfromargs(arguments);
    var port = args.join(' ');
    slots[currentCcSlot].ccPort = (port === 'Global') ? '' : port;
}

function midi_vel(v) { midi.vel = Math.max(0, Math.min(127, v)) / 127; }
function midi_pb(v)  { midi.pb  = Math.max(0, Math.min(127, v)) / 127; }
function midi_at(v)  { midi.at  = Math.max(0, Math.min(127, v)) / 127; }

// key_vel [0-127] : vélocité reçue depuis Key_jsui (clavier externe → "key")
function key_vel(v) { midi.keyVel = Math.max(0, Math.min(127, v)) / 127; }

// midi_cc [value] : valeur (0-127) du CC déjà filtré en amont (umenu de sélection
// du numéro de CC dans ndlr_main). Alimente directement la source midi_cc.
function midi_cc(val) {
    midi.cc = Math.max(0, Math.min(127, val)) / 127;
}

// pattern_val [1-2] [1-60] : valeur NDLR 1-based du pas courant.
function pattern_val(motifId, val) {
    var norm = (Math.max(1, Math.min(60, val)) - 1) / 59;
    if (Math.round(motifId) === 2) midi.patternM2 = norm;
    else                            midi.patternM1 = norm;
}


function reload_patterns() {
    pattPatterns = {};
    pattLengths = {};
    for (var fixed = 1; fixed <= 20; fixed++) {
        pattPatterns[fixed] = FIXED_PATTERNS[fixed].slice();
        pattLengths[fixed] = 16;
    }
    if (typeof Dict === 'undefined') return;
    // User Patterns 21-40 : collection unique partagee par M1 et M2.
    var shared = new Dict('ndlr_shared_pattern_library');
    for (var slotNum = 21; slotNum <= 40; slotNum++) {
        var path = 'patterns::' + slotNum;
        if (shared.contains(path + '::values')) {
            var raw = shared.get(path + '::values');
            pattPatterns[slotNum] = (raw instanceof Array) ? raw.slice()
                : Array.prototype.slice.call(raw || []);
            pattLengths[slotNum] = Math.max(1, Math.min(16,
                Number(shared.get(path + '::length')) || 16));
        }
    }

    // Fallback de migration pour les anciens patches qui n'ont pas encore de
    // bibliothèque partagée : reprendre le premier slot trouve dans M1 puis M2.
    var legacyNames = ['ndlr_motif1_library', 'ndlr_motif2_library'];
    for (var legacySlot = 21; legacySlot <= 40; legacySlot++) {
        if (pattPatterns[legacySlot]) continue;
        var legacyPath = 'patterns::' + legacySlot;
        for (var d = 0; d < legacyNames.length; d++) {
            var dd = new Dict(legacyNames[d]);
            if (!dd.contains(legacyPath + '::values')) continue;
            var legacyRaw = dd.get(legacyPath + '::values');
            pattPatterns[legacySlot] = (legacyRaw instanceof Array) ? legacyRaw.slice()
                : Array.prototype.slice.call(legacyRaw || []);
            pattLengths[legacySlot] = Math.max(1, Math.min(16,
                Number(dd.get(legacyPath + '::length')) || 16));
            break;
        }
    }
}

// Affichage des valeurs actuelles (debug)
function info() {
    post("=== Mod Matrix State ===\n");
    post("Running:", isRunning, "\n");
    for (var i = 0; i < lfos.length; i++) {
        var l = lfos[i];
        post("LFO", i+1, "shape:", SHAPE_NAMES[l.shape], "rate:", l.rate,
             "sync:", l.beatSync, "prob:", l.prob, "phase:", l.phase.toFixed(3), "\n");
    }
    for (var j = 0; j < 8; j++) {
        var s = slots[j];
        if (s.on) post("Slot", j+1, ":", s.src, "->", s.dst, "amt:", s.amt, "\n");
    }
}
