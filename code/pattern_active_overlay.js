// Contrôleur du second multislider placé devant le Pattern Editor.
// Il ne conserve qu'une barre non nulle : le pas réellement joué.
autowatch = 1;
inlets = 1;
outlets = 1;

var values = [];
var patternLength = 16;
var patternMaximum = 20;
var activeStep = 0;

function anything() {
    var args = arrayfromargs(arguments);
    switch (messagename) {
        case "active":
            activeStep = Math.max(0, Math.round(Number(args[0]) || 0));
            var activeValue = Number(args[1]) || 0;
            patternLength = Math.max(1, Math.min(16, Math.round(Number(args[2]) || patternLength)));
            patternMaximum = Math.max(1, Number(args[3]) || patternMaximum);
            values[activeStep - 1] = activeValue;
            outlet(0, "setminmax", 0, Math.max(1, patternMaximum - 1));
            outlet(0, "signed", 1);
            outlet(0, "steps", patternLength);
            emitActiveBar();
            break;
        case "pattern_set":
            values = args.slice(0);
            emitActiveBar();
            break;
        case "pattern_max":
            patternMaximum = Math.max(1, Number(args[0]) || 1);
            outlet(0, "setminmax", 0, Math.max(1, patternMaximum - 1));
            outlet(0, "signed", 1);
            emitActiveBar();
            break;
        case "pattlen":
            patternLength = Math.max(1, Math.min(16, Math.round(Number(args[0]) || 1)));
            outlet(0, "steps", patternLength);
            emitActiveBar();
            break;
        case "pattern_beat":
            activeStep = Math.max(0, Math.round(Number(args[0]) || 0));
            emitActiveBar();
            break;
    }
}

function emitActiveBar() {
    var display = [];
    for (var i = 0; i < patternLength; i++) display[i] = 0;
    if (activeStep >= 1 && activeStep <= patternLength) {
        var value = Number(values[activeStep - 1]);
        if (!(value >= 1)) value = 1;
        // Translation exacte des plages entières : vert [1..max] vers jaune
        // [0..max-1]. La valeur minimale 1 devient donc réellement 0.
        display[activeStep - 1] = Math.max(0, value - 1);
    }
    outlet.apply(this, [0].concat(display));
}

function loadbang() {
    outlet(0, "setminmax", 0, Math.max(1, patternMaximum - 1));
    outlet(0, "signed", 1);
    outlet(0, "steps", patternLength);
    emitActiveBar();
}
