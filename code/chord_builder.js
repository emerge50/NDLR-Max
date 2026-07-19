// chord_builder.js
// inlet 0 : messages nommés
//   scale [notes...]  : notes de la gamme
//   degree [0-6]      : degré (index 0-based)
//   color  [0-8]      : categorie COLOR Scaler 3.3
//   type   [0-8]      : alias historique de color
// outlet 0 : liste des notes de l'accord (octave centrale)
// outlet 1 : pool complet sur tout le clavier MIDI (0-127)
// outlet 2 : centre tonal puis rôles — paires [-1, tonicMidi, noteClass, role...]
//            role: 0=tonique 1=neuvième 2=tierce 3=quarte 4=quinte 5=sixte 6=septième
//
// Couleurs :
//   0 Triads  1 7ths  2 9ths  3 11ths  4 13ths  5 Suspended
//   6 6ths & 7ths  7 Minor 7ths & 9ths  8 Suspended 4ths, 7ths & 9ths

inlets  = 1;
outlets = 3;

var currentScale  = [];
var currentDegree = 0;
var currentType   = 0;

// Les cinq premieres couleurs et Suspended reutilisent les formules
// diatoniques historiques. La categorie 6 ajoute 6e et 7e lorsque la gamme
// contient sept notes. Les deux dernieres couleurs sont chromatiques, comme
// les extensions correspondantes de Scaler.
var COLOR_TO_LEGACY_TYPE = [0, 1, 7, 12, 13, 3, 4];
var COLOR_CHROMATIC_INTERVALS = {
    7: [0, 3, 7, 10, 14], // min9
    8: [0, 5, 7, 10, 14]  // 9sus4
};
var COLOR_ROLE_SEQUENCES = {
    0: [0, 2, 4],
    1: [0, 2, 4, 6],
    2: [0, 2, 4, 6, 1],
    3: [0, 2, 4, 6, 1, 3],
    4: [0, 2, 4, 6, 1, 3, 5],
    5: [0, 3, 4],
    6: [0, 2, 4, 5, 6],
    7: [0, 2, 4, 6, 1],
    8: [0, 3, 4, 6, 1]
};

// ── Formules pour gammes à 7 notes ──────────────────────────────────
var FORMULAS_7 = {
     0: [0, 2, 4],                        // Triad
     1: [0, 2, 4, 6],                     // 7th
     2: [0, 1, 4],                        // sus2
     3: [0, 3, 4],                        // sus4
     4: [0, 2, 4, 5],                     // 6th
     5: [0, 1, 2, 4],                     // mu / add2
     6: [0, 2, 4, 8],                     // add9 (9e, pas tonique a l'octave)
     7: [0, 2, 4, 6, 8],                  // 9th
     8: [0, 3, 6],                        // quartal
     9: [0, 4],                           // power (quinte seule)
    10: [0, 2, 6],                        // shell (root+3ce+7e, sans quinte)
    11: [0, 4, 8],                        // quintal (quintes empilées)
    12: [0, 2, 4, 6, 8, 10],              // 11th
    13: [0, 2, 4, 6, 8, 10, 12],          // 13th
    14: [0, 1, 2],                        // cluster (3 degrés adjacents)
    15: [0, 2, 6, 8],                     // shell9 (root+3ce+7e+9e, sans quinte)
    16: [0, 4, 6, 8],                     // open9 (root+5te+7e+9e, sans tierce)
    17: [0, 3, 6, 9, 11]                  // So What (3 quartes + tierce maj)
};

// ── Formules pour gammes à 8 notes (dim octatonique) ────────────────
var FORMULAS_8 = {
     0: [0, 2, 4],
     1: [0, 2, 4, 6],
     2: [0, 1, 4],
     3: [0, 3, 4],
     4: [0, 2, 4, 5],
     5: [0, 1, 2, 4],
     6: [0, 2, 4, 7],
     7: [0, 2, 4, 6, 8],
     8: [0, 3, 6],
     9: [0, 4],
    10: [0, 2, 6],
    11: [0, 4, 8],
    12: [0, 2, 4, 6, 8, 10],
    13: [0, 2, 4, 6, 8, 10, 12],
    14: [0, 1, 2],
    15: [0, 2, 6, 8],
    16: [0, 4, 6, 8],
    17: [0, 3, 6, 9, 11]
};

// ── Formules pour gammes à 6 notes ──────────────────────────────────
var FORMULAS_6 = {
     0: [0, 2, 4],
     1: [0, 2, 4, 5],
     2: [0, 1, 4],
     3: [0, 3, 4],
     4: [0, 2, 4, 5],
     5: [0, 1, 2, 4],
     6: [0, 2, 4, 7],
     7: [0, 2, 4, 5, 7],
     8: [0, 3, 5],
     9: [0, 3],
    10: [0, 2, 5],
    11: [0, 3, 7],
    12: [0, 1, 2, 3, 4, 5],
    13: [0, 1, 2, 3, 4, 5, 7],
    14: [0, 1, 2],
    15: [0, 2, 5, 7],
    16: [0, 3, 5, 7],
    17: [0, 2, 4, 6]
};

// ── Formules pour gammes à 5 notes ──────────────────────────────────
var FORMULAS_5 = {
     0: [0, 1, 3],
     1: [0, 1, 3, 4],
     2: [0, 1, 3],
     3: [0, 2, 3],
     4: [0, 1, 3, 4],
     5: [0, 1, 2, 3],
     6: [0, 1, 3, 5],
     7: [0, 1, 3, 4, 5],
     8: [0, 2, 4],
     9: [0, 3],
    10: [0, 1, 4],
    11: [0, 3, 6],
    12: [0, 1, 2, 3, 4],
    13: [0, 1, 2, 3, 4, 5],
    14: [0, 1, 2],
    15: [0, 1, 4, 5],
    16: [0, 3, 4, 5],
    17: [0, 2, 3, 5]
};

// ── Formules pour gammes à 2 notes ──────────────────────────────────
var FORMULAS_2 = {
     0: [0, 1],  1: [0, 1],  2: [0, 1],  3: [0, 1],
     4: [0, 1],  5: [0, 1],  6: [0, 1],  7: [0, 1],
     8: [0, 1],  9: [0, 1], 10: [0, 1], 11: [0, 1],
    12: [0, 1], 13: [0, 1], 14: [0, 1], 15: [0, 1],
    16: [0, 1], 17: [0, 1]
};

// ── Rôles : index de formule → rôle harmonique ──────────────────────
var ROLES_7 = {
     0: { 0: 0, 2: 2, 4: 4 },
     1: { 0: 0, 2: 2, 4: 4, 6: 6 },
     2: { 0: 0, 1: 1, 4: 4 },
     3: { 0: 0, 3: 3, 4: 4 },
     4: { 0: 0, 2: 2, 4: 4, 5: 5 },
     5: { 0: 0, 1: 1, 2: 2, 4: 4 },
     6: { 0: 0, 2: 2, 4: 4, 8: 1 },
     7: { 0: 0, 2: 2, 4: 4, 6: 6, 8: 1 },
     8: { 0: 0, 3: 3, 6: 6 },
     9: { 0: 0, 4: 4 },
    10: { 0: 0, 2: 2, 6: 6 },
    11: { 0: 0, 4: 4, 8: 1 },
    12: { 0: 0, 2: 2, 4: 4, 6: 6, 8: 1, 10: 3 },
    13: { 0: 0, 2: 2, 4: 4, 6: 6, 8: 1, 10: 3, 12: 5 },
    14: { 0: 0, 1: 1, 2: 2 },
    15: { 0: 0, 2: 2, 6: 6, 8: 1 },
    16: { 0: 0, 4: 4, 6: 6, 8: 1 },
    17: { 0: 0, 3: 3, 6: 6, 9: 1, 11: 5 }
};

var ROLES_8 = {
     0: { 0: 0, 2: 2, 4: 4 },
     1: { 0: 0, 2: 2, 4: 4, 6: 6 },
     2: { 0: 0, 1: 1, 4: 4 },
     3: { 0: 0, 3: 3, 4: 4 },
     4: { 0: 0, 2: 2, 4: 4, 5: 5 },
     5: { 0: 0, 1: 1, 2: 2, 4: 4 },
     6: { 0: 0, 2: 2, 4: 4, 7: 1 },
     7: { 0: 0, 2: 2, 4: 4, 6: 6, 8: 1 },
     8: { 0: 0, 3: 3, 6: 6 },
     9: { 0: 0, 4: 4 },
    10: { 0: 0, 2: 2, 6: 6 },
    11: { 0: 0, 4: 4, 8: 1 },
    12: { 0: 0, 2: 2, 4: 4, 6: 6, 8: 1, 10: 3 },
    13: { 0: 0, 2: 2, 4: 4, 6: 6, 8: 1, 10: 3, 12: 5 },
    14: { 0: 0, 1: 1, 2: 2 },
    15: { 0: 0, 2: 2, 6: 6, 8: 1 },
    16: { 0: 0, 4: 4, 6: 6, 8: 1 },
    17: { 0: 0, 3: 3, 6: 6, 9: 1, 11: 5 }
};

var ROLES_5 = {
     0: { 0: 0, 1: 2, 3: 4 },
     1: { 0: 0, 1: 2, 3: 4, 4: 6 },
     2: { 0: 0, 1: 2, 3: 4 },
     3: { 0: 0, 2: 3, 3: 4 },
     4: { 0: 0, 1: 2, 3: 4, 4: 6 },
     5: { 0: 0, 1: 1, 2: 2, 3: 4 },
     6: { 0: 0, 1: 2, 3: 4, 5: 1 },
     7: { 0: 0, 1: 2, 3: 4, 4: 6, 5: 1 },
     8: { 0: 0, 2: 3, 4: 6 },
     9: { 0: 0, 3: 4 },
    10: { 0: 0, 1: 2, 4: 6 },
    11: { 0: 0, 3: 4, 6: 1 },
    12: { 0: 0, 1: 2, 2: 3, 3: 4, 4: 6 },
    13: { 0: 0, 1: 2, 2: 3, 3: 4, 4: 6, 5: 1 },
    14: { 0: 0, 1: 1, 2: 2 },
    15: { 0: 0, 1: 2, 4: 6, 5: 1 },
    16: { 0: 0, 3: 4, 4: 6, 5: 1 },
    17: { 0: 0, 2: 3, 3: 4, 5: 1 }
};

var ROLES_2 = {
     0: { 0: 0, 1: 4 },  1: { 0: 0, 1: 4 },  2: { 0: 0, 1: 4 },  3: { 0: 0, 1: 4 },
     4: { 0: 0, 1: 4 },  5: { 0: 0, 1: 4 },  6: { 0: 0, 1: 4 },  7: { 0: 0, 1: 4 },
     8: { 0: 0, 1: 4 },  9: { 0: 0, 1: 4 }, 10: { 0: 0, 1: 4 }, 11: { 0: 0, 1: 4 },
    12: { 0: 0, 1: 4 }, 13: { 0: 0, 1: 4 }, 14: { 0: 0, 1: 4 }, 15: { 0: 0, 1: 4 },
    16: { 0: 0, 1: 4 }, 17: { 0: 0, 1: 4 }
};

function getFormula(type, scaleLen) {
    if (scaleLen === 8) return FORMULAS_8[type];
    if (scaleLen === 7) return FORMULAS_7[type];
    if (scaleLen === 6) return FORMULAS_6[type];
    if (scaleLen === 5) return FORMULAS_5[type];
    if (scaleLen === 2) return FORMULAS_2[type];
    return FORMULAS_7[type];
}

function getRoleMap(type, scaleLen) {
    if (scaleLen === 8) return ROLES_8[type];
    if (scaleLen === 7) return ROLES_7[type];
    if (scaleLen === 5) return ROLES_5[type];
    if (scaleLen === 2) return ROLES_2[type];
    return ROLES_7[type];
}

function getColorFormula(color, scaleLen) {
    if (color === 6 && (scaleLen === 7 || scaleLen === 8)) {
        return [0, 2, 4, 5, 6];
    }
    var legacyType = COLOR_TO_LEGACY_TYPE[color];
    if (legacyType === undefined) return null;
    return getFormula(legacyType, scaleLen);
}

function buildChord() {
    if (currentScale.length === 0) return;

    var scaleLen = currentScale.length;
    var chromaticFormula = COLOR_CHROMATIC_INTERVALS[currentType];
    var formula = chromaticFormula || getColorFormula(currentType, scaleLen);
    var roleSequence = COLOR_ROLE_SEQUENCES[currentType] || [];

    if (!formula) {
        error("Formule introuvable color:" + currentType +
              " scaleLen:" + scaleLen + "\n");
        return;
    }

    // 1. Construire les notes de l'accord (octave centrale)
    var notes = [];
    for (var i = 0; i < formula.length; i++) {
        if (chromaticFormula) {
            notes.push(currentScale[currentDegree % scaleLen] + formula[i]);
        } else {
            var rawIdx      = currentDegree + formula[i];
            var idx         = rawIdx % scaleLen;
            var octaveShift = Math.floor(rawIdx / scaleLen);
            notes.push(currentScale[idx] + (octaveShift * 12));
        }
    }

    // 2. Construire le pool complet (0-127) et la map noteClass → role
    var chordClasses = [];
    var noteRoles    = {};

    for (var j = 0; j < formula.length; j++) {
        var note;
        if (chromaticFormula) {
            note = currentScale[currentDegree % scaleLen] + formula[j];
        } else {
            var rawIdx2      = currentDegree + formula[j];
            var idx2         = rawIdx2 % scaleLen;
            var octaveShift2 = Math.floor(rawIdx2 / scaleLen);
            note = currentScale[idx2] + (octaveShift2 * 12);
        }
        var noteClass    = note % 12;
        var role         = roleSequence[j] !== undefined ? roleSequence[j] : 0;

        if (chordClasses.indexOf(noteClass) === -1) {
            chordClasses.push(noteClass);
            noteRoles[noteClass] = role;
        }
    }

    var pool = [];
    for (var midi = 0; midi <= 127; midi++) {
        if (chordClasses.indexOf(midi % 12) !== -1) {
            pool.push(midi);
        }
    }

    // 3. Construire la liste des rôles pour outlet 2
    // La paire reservee -1/tonicMidi voyage avec les rôles afin que le Pad
    // valide centre tonal, rôles et pool dans la même transaction musicale.
    var rolesList = [-1, currentScale[0]];
    for (var nc in noteRoles) {
        if (noteRoles.hasOwnProperty(nc)) {
            rolesList.push(parseInt(nc));
            rolesList.push(noteRoles[nc]);
        }
    }

    // 4. Sorties
    outlet(2, rolesList);
    outlet(1, pool);
    outlet(0, notes);
}

function scale() {
    var args = arrayfromargs(arguments);
    currentScale = args.filter(function(x) {
        return typeof x === "number";
    });
    buildChord();
}

function degree(v) {
    currentDegree = v % 7;
    buildChord();
}

function type(v) {
    currentType = Math.max(0, Math.min(8, Math.round(v)));
    buildChord();
}

function color(v) { type(v); }
