// scaler_scale_data.js
// Base de 77 gammes exposees par Scaler 3.3.0.
// Ce fichier est inclus par scale_builder, interval_engine et rotator_engine.

var SCALER_SCALES = [
    {name:"Major", formula:["1","2","3","4","5","6","7"]},
    {name:"Dorian", formula:["1","2","b3","4","5","6","b7"]},
    {name:"Phrygian", formula:["1","b2","b3","4","5","b6","b7"]},
    {name:"Lydian", formula:["1","2","3","#4","5","6","7"]},
    {name:"Mixolydian", formula:["1","2","3","4","5","6","b7"]},
    {name:"Minor", formula:["1","2","b3","4","5","b6","b7"]},
    {name:"Locrian", formula:["1","b2","b3","4","b5","b6","b7"]},
    {name:"Harmonic Major", formula:["1","2","3","4","5","b6","7"]},
    {name:"Dorian b5", formula:["1","2","b3","4","b5","6","b7"]},
    {name:"Phrygian b4", formula:["1","b2","b3","b4","5","b6","b7"]},
    {name:"Lydian b3", formula:["1","2","b3","#4","5","6","7"]},
    {name:"Mixolydian b2", formula:["1","b2","3","4","5","6","b7"]},
    {name:"Lydian Augmented #2", formula:["1","#2","3","#4","#5","6","7"]},
    {name:"Locrian Diminished", formula:["1","b2","b3","4","b5","b6","bb7"]},
    {name:"Harmonic Minor", formula:["1","2","b3","4","5","b6","7"]},
    {name:"Locrian nat. 6", formula:["1","b2","b3","4","b5","6","b7"]},
    {name:"Ionian Augmented", formula:["1","2","3","4","#5","6","7"]},
    {name:"Ukrainian Dorian", formula:["1","2","b3","#4","5","6","b7"]},
    {name:"Phrygian Dominant", formula:["1","b2","3","4","5","b6","b7"]},
    {name:"Lydian #2", formula:["1","#2","3","#4","5","6","7"]},
    {name:"Super-Locrian Diminished", formula:["1","b2","b3","b4","b5","b6","bb7"]},
    {name:"Melodic Minor (asc)", formula:["1","2","b3","4","5","6","7"]},
    {name:"Dorian b2", formula:["1","b2","b3","4","5","6","b7"]},
    {name:"Lydian Augmented", formula:["1","2","3","#4","#5","6","7"]},
    {name:"Acoustic", formula:["1","2","3","#4","5","6","b7"]},
    {name:"Mixolydian b6", formula:["1","2","3","4","5","b6","b7"]},
    {name:"Half Diminished", formula:["1","2","b3","4","b5","b6","b7"]},
    {name:"Altered", formula:["1","b2","b3","b4","b5","b6","b7"]},
    {name:"Neapolitan Major", formula:["1","b2","b3","4","5","6","7"]},
    {name:"Lydian Augmented #6", formula:["1","2","3","#4","#5","#6","7"]},
    {name:"Lydian Augmented Dominant", formula:["1","2","3","#4","#5","6","b7"]},
    {name:"Lydian b6 Dominant", formula:["1","2","3","#4","5","b6","b7"]},
    {name:"Major Locrian", formula:["1","2","3","4","b5","b6","b7"]},
    {name:"Super-Locrian nat. 2", formula:["1","2","b3","b4","b5","b6","b7"]},
    {name:"Super-Locrian bb3", formula:["1","b2","bb3","b4","b5","b6","b7"]},
    {name:"Neapolitan Minor", formula:["1","b2","b3","4","5","b6","7"]},
    {name:"Lydian #6", formula:["1","2","3","#4","5","#6","7"]},
    {name:"Mixolydian Augmented", formula:["1","2","3","4","#5","6","b7"]},
    {name:"Hungarian Gypsy", formula:["1","2","b3","#4","5","b6","b7"]},
    {name:"Locrian nat. 3", formula:["1","b2","3","4","b5","b6","b7"]},
    {name:"Ionian #2", formula:["1","#2","3","4","5","6","7"]},
    {name:"Super-Locrian Diminished bb3", formula:["1","b2","bb3","b4","b5","b6","bb7"]},
    {name:"Double Harmonic Major", formula:["1","b2","3","4","5","b6","7"]},
    {name:"Lydian #2 #6", formula:["1","#2","3","#4","5","#6","7"]},
    {name:"Ultraphrygian", formula:["1","b2","b3","b4","5","b6","bb7"]},
    {name:"Hungarian Minor", formula:["1","2","b3","#4","5","b6","7"]},
    {name:"Oriental", formula:["1","b2","3","4","b5","6","b7"]},
    {name:"Ionian Augmented #2", formula:["1","#2","3","4","#5","6","7"]},
    {name:"Locrian Diminished bb3", formula:["1","b2","bb3","4","b5","b6","bb7"]},
    {name:"Persian", formula:["1","b2","3","4","b5","b6","7"]},
    {name:"Persian mode 2", formula:["1","#2","3","4","5","#6","7"]},
    {name:"Persian mode 3", formula:["1","b2","bb3","b4","5","b6","bb7"]},
    {name:"Persian mode 4", formula:["1","b2","b3","#4","5","b6","7"]},
    {name:"Persian mode 5", formula:["1","2","#3","#4","5","#6","7"]},
    {name:"Persian mode 6", formula:["1","#2","3","4","#5","6","b7"]},
    {name:"Persian mode 7", formula:["1","b2","bb3","4","b5","bb6","bb7"]},
    {name:"Major Pentatonic", formula:["1","2","3","5","6"]},
    {name:"Egyptian Pentatonic", formula:["1","2","4","5","b7"]},
    {name:"Man Gong Pentatonic", formula:["1","b3","4","b6","b7"]},
    {name:"Ritsusen Pentatonic", formula:["1","2","4","5","6"]},
    {name:"Minor Pentatonic", formula:["1","b3","4","5","b7"]},
    {name:"Major Blues Hexatonic", formula:["1","2","b3","3","5","6"]},
    {name:"Major Blues Hexatonic mode 2", formula:["1","b2","2","4","5","b7"]},
    {name:"Major Blues Hexatonic mode 3", formula:["1","b2","3","#4","6","7"]},
    {name:"Major Blues Hexatonic mode 4", formula:["1","#2","#3","#5","b7","7"]},
    {name:"Major Blues Hexatonic mode 5", formula:["1","2","4","5","b6","6"]},
    {name:"Minor Blues Hexatonic", formula:["1","b3","4","b5","5","b7"]},
    {name:"Hirajoshi", formula:["1","3","#4","5","7"]},
    {name:"Iwato", formula:["1","2","b3","5","b6"]},
    {name:"Kumoi", formula:["1","2","b3","5","6"]},
    {name:"Insen", formula:["1","b2","4","5","b7"]},
    {name:"Ritsu", formula:["1","2","b3","4","5","6","b7"]},
    {name:"In", formula:["1","b2","b3","4","5","b6","b7"]},
    {name:"Ryo", formula:["1","2","3","5","6"]},
    {name:"Minyo", formula:["1","b3","4","b6","b7"]},
    {name:"Yo", formula:["1","2","4","5","6"]},
    {name:"Whole", formula:["1","2","3","#4","#5","b7"]}
];

var SCALER_SCALE_COUNT = SCALER_SCALES.length;

function scalerFormulaDegreeToSemitone(symbol) {
    var match = String(symbol).match(/^([b#]*)([1-7])$/);
    if (!match) return 0;
    var natural = [0, 0, 2, 4, 5, 7, 9, 11][parseInt(match[2], 10)];
    var accidental = match[1];
    for (var i = 0; i < accidental.length; i++) {
        natural += accidental.charAt(i) === "#" ? 1 : -1;
    }
    return ((natural % 12) + 12) % 12;
}

function scalerScaleIntervals(index) {
    var safeIndex = Math.max(0, Math.min(SCALER_SCALE_COUNT - 1, Math.round(index)));
    var formula = SCALER_SCALES[safeIndex].formula;
    var result = [];
    for (var i = 0; i < formula.length; i++) {
        result.push(scalerFormulaDegreeToSemitone(formula[i]));
    }
    return result;
}
