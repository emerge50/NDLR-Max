// scale_builder.js
// inlet 0 : tonalité (0-11, ordre cercle des quintes : C G D A E B F# Db Ab Eb Bb F)
// inlet 1 : mode (0-27)
// outlet 0 : liste des notes de la gamme (message "scale" + notes MIDI)
// outlet 1 : nom de la tonalité et du mode (string)
autowatch = 1;

inlets  = 2;
outlets = 2;

var SCALES = {
    // ── Modes d'église ────────────────────────────────────────────────
     0: { name: "Major",       intervals: [0, 2, 4, 5, 7, 9, 11] },
     1: { name: "Dorian",      intervals: [0, 2, 3, 5, 7, 9, 10] },
     2: { name: "Phrygian",    intervals: [0, 1, 3, 5, 7, 8, 10] },
     3: { name: "Lydian",      intervals: [0, 2, 4, 6, 7, 9, 11] },
     4: { name: "Mixolydian",  intervals: [0, 2, 4, 5, 7, 9, 10] },
     5: { name: "Minor",       intervals: [0, 2, 3, 5, 7, 8, 10] },
     6: { name: "Locrian",     intervals: [0, 1, 3, 5, 6, 8, 10] },
    // ── Gammes exotiques de base ──────────────────────────────────────
     7: { name: "Gypsy Min",   intervals: [0, 2, 3, 6, 7, 8, 10] },
     8: { name: "Harm. Minor", intervals: [0, 2, 3, 5, 7, 8, 11] },
    // ── Pentatoniques & blues ─────────────────────────────────────────
     9: { name: "Minor Penta", intervals: [0, 3, 5, 7, 10]        },
    // ── Gammes symétriques ────────────────────────────────────────────
    10: { name: "Whole Tone",  intervals: [0, 2, 4, 6, 8, 10]     },
    // ── Intervalles toniques ──────────────────────────────────────────
    11: { name: "Tonic 2nds",  intervals: [0, 2]                   },
    12: { name: "Tonic 3rds",  intervals: [0, 4]                   },
    13: { name: "Tonic 4ths",  intervals: [0, 5]                   },
    14: { name: "Tonic 6ths",  intervals: [0, 9]                   },
    // ── Pentatoniques & blues (suite) ────────────────────────────────
    15: { name: "Major Penta", intervals: [0, 2, 4, 7, 9]          },
    16: { name: "Blues",       intervals: [0, 3, 5, 6, 7, 10]      },
    // ── Gammes jazz / fusion ──────────────────────────────────────────
    // Mélodie mineure et ses modes
    17: { name: "Melodic Min", intervals: [0, 2, 3, 5, 7, 9, 11]  },  // mode 1 : mel. min
    18: { name: "Dorian b2",   intervals: [0, 1, 3, 5, 7, 9, 10]  },  // mode 2 : Phrygien #6
    19: { name: "Lydian Aug",  intervals: [0, 2, 4, 6, 8, 9, 11]  },  // mode 3 : Lydien augmenté
    20: { name: "Lydian Dom",  intervals: [0, 2, 4, 6, 7, 9, 10]  },  // mode 4 : Lydien b7 (Overtone)
    21: { name: "Mixo b6",     intervals: [0, 2, 4, 5, 7, 8, 10]  },  // mode 5 : Hindoustani
    22: { name: "Locrian #2",  intervals: [0, 2, 3, 5, 6, 8, 10]  },  // mode 6 : Demi-diminué
    23: { name: "Altered",     intervals: [0, 1, 3, 4, 6, 8, 10]  },  // mode 7 : Super Locrien
    // Gammes exotiques jazz / Holdsworth
    24: { name: "Phryg. Dom",  intervals: [0, 1, 4, 5, 7, 8, 10]  },  // Flamenca / espagnole
    25: { name: "Byzantine",   intervals: [0, 1, 4, 5, 7, 8, 11]  },  // Double seconde aug.
    // Gammes symétriques étendues
    26: { name: "Dim H-W",     intervals: [0, 1, 3, 4, 6, 7, 9, 10] }, // Octatonique demi-ton/ton
    27: { name: "Augmented",   intervals: [0, 3, 4, 7, 8, 11]      }   // Symétrique augmentée
};

// Ordre cercle des quintes pour affichage
var KEY_NAMES = ["C","G","D","A","E","B","F#","Db","Ab","Eb","Bb","F"];

// Ordre cercle des quintes pour calcul MIDI
var KEY_MIDI  = [0, 7, 2, 9, 4, 11, 6, 1, 8, 3, 10, 5];

var currentKey    = 0;
var currentMode   = 0;
var currentDegree = 0;
var currentType   = 0;

var DEGREE_NAMES = ["I","II","III","IV","V","VI","VII"];
var TYPE_NAMES   = [
    "Triad","7th","sus2","sus4","6th","mu","add9","9th","quartal",
    "power","shell","quintal","11th","13th","cluster",
    "shell9","open9","So What"
];

function outputStatus() {
    var scale = SCALES[currentMode] || SCALES[0];
    var typeName = TYPE_NAMES[currentType] || String(currentType);
    outlet(1, KEY_NAMES[currentKey] + "-" + scale.name + "-" +
        DEGREE_NAMES[currentDegree] + "-" + typeName);
}

function buildScale() {
    var scale = SCALES[currentMode];
    if (!scale) {
        error("Mode inconnu : " + currentMode + "\n");
        return;
    }

    var baseNote = 60 + KEY_MIDI[currentKey];
    var notes    = [];

    for (var i = 0; i < scale.intervals.length; i++) {
        notes.push(baseNote + scale.intervals[i]);
    }

    outputStatus();
    outlet(0, ["scale"].concat(notes));
}

// Degree et Type ne reconstruisent pas la gamme : ils rafraîchissent seulement
// le retour harmonique affiché dans l'en-tête.
function degree(v) {
    currentDegree = Math.max(0, Math.min(6, Math.round(v)));
    outputStatus();
}

function type(v) {
    currentType = Math.max(0, Math.min(17, Math.round(v)));
    outputStatus();
}

function msg_int(v) {
    if (inlet === 0) {
        var newKey = v % 12;
        if (newKey === currentKey) return;
        currentKey = newKey;
        buildScale();
    }
    if (inlet === 1) {
        var newMode = v % 28;
        if (newMode === currentMode) return;
        currentMode = newMode;
        buildScale();
    }
}

function loadbang() {
    buildScale();
}
