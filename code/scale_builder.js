// scale_builder.js
// inlet 0 : tonalite (0-11, ordre cercle des quintes : C G D A E B F# Db Ab Eb Bb F)
// inlet 1 : gamme Scaler 3.3 (0-76)
// outlet 0 : liste des notes de la gamme (message "scale" + notes MIDI)
// outlet 1 : nom de la tonalite, de la gamme, du degre et du type d'accord
autowatch = 1;

inlets  = 2;
outlets = 2;

include("scaler_scale_data.js");

// Ordre cercle des quintes pour affichage et calcul MIDI.
var KEY_NAMES = ["C","G","D","A","E","B","F#","Db","Ab","Eb","Bb","F"];
var KEY_MIDI  = [0, 7, 2, 9, 4, 11, 6, 1, 8, 3, 10, 5];

var currentKey    = 0;
var currentScale  = 0;
var currentDegree = 0;
var currentType   = 0;

var DEGREE_NAMES = ["I","II","III","IV","V","VI","VII"];
var COLOR_NAMES = [
    "Triads", "7ths", "9ths", "11ths", "13ths", "Suspended",
    "6ths & 7ths", "Minor 7ths & 9ths", "Suspended 4ths, 7ths & 9ths"
];

function configureScaleMenu() {
    if (!this.patcher || !this.patcher.getnamed) return;
    var menu = this.patcher.getnamed("scale_menu");
    if (!menu) return;
    menu.message("clear");
    for (var i = 0; i < SCALER_SCALE_COUNT; i++) {
        menu.message("append", SCALER_SCALES[i].name);
    }
    menu.message("set", currentScale);
}

function outputStatus() {
    var scale = SCALER_SCALES[currentScale] || SCALER_SCALES[0];
    var typeName = COLOR_NAMES[currentType] || String(currentType);
    outlet(1, KEY_NAMES[currentKey] + "-" + scale.name + "-" +
        DEGREE_NAMES[currentDegree] + "-" + typeName);
}

function buildScale() {
    var scale = SCALER_SCALES[currentScale];
    if (!scale) {
        error("Gamme inconnue : " + currentScale + "\n");
        return;
    }

    var baseNote = 60 + KEY_MIDI[currentKey];
    var intervals = scalerScaleIntervals(currentScale);
    var notes = [];
    for (var i = 0; i < intervals.length; i++) notes.push(baseNote + intervals[i]);

    outputStatus();
    outlet(0, ["scale"].concat(notes));
}

// Degree et Color ne reconstruisent pas la gamme : ils rafraichissent seulement
// le retour harmonique affiche dans l'en-tete.
function degree(v) {
    currentDegree = Math.max(0, Math.min(6, Math.round(v)));
    outputStatus();
}

function type(v) {
    currentType = Math.max(0, Math.min(8, Math.round(v)));
    outputStatus();
}


function color(v) { type(v); }

function setScale(v) {
    var newScale = Math.max(0, Math.min(SCALER_SCALE_COUNT - 1, Math.round(v)));
    if (newScale === currentScale) return;
    currentScale = newScale;
    buildScale();
}

// Alias nomme pour les futurs patchers. L'entree int et l'ancien bus "mode"
// restent compatibles avec les sessions existantes.
function scale_index(v) { setScale(v); }
function mode(v) { setScale(v); }

function msg_int(v) {
    if (inlet === 0) {
        var newKey = ((Math.round(v) % 12) + 12) % 12;
        // Un second clic sur la même tonalité reste un geste musical :
        // republier la gamme afin de réarticuler l'accord courant.
        currentKey = newKey;
        buildScale();
    } else if (inlet === 1) {
        setScale(v);
    }
}

function loadbang() {
    configureScaleMenu.call(this);
    buildScale();
}
