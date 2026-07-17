// rhythm_slot_marker.js — Marque le slot User Rhythm courant s'il est occupe.
// Inlet 0 : liste des slots utilises (21..40), bang = liste vide.
// Inlet 1 : slot actuellement affiche dans le Rhythm Editor.

autowatch = 1;
inlets = 2;
outlets = 0;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var currentSlot = 21;
var usedSlots = {};

// Taille du caractere : modifier uniquement cette valeur (15, 18, 20...).
var FONT_SIZE = 15;

// Un enregistrement du fichier provoque un rechargement via autowatch et
// efface usedSlots. Redemander l'etat aux deux moteurs rend l'asterisque
// immediatement visible sans devoir changer de Motif ou rouvrir l'editeur.
function requestState() {
    if (typeof messnamed === "undefined") return;
    messnamed("motif1_editor", "dumpstate");
    messnamed("motif2_editor", "dumpstate");
}

var stateRequestTask = new Task(requestState, this);
stateRequestTask.schedule(30);

function clampSlot(v) {
    return Math.max(21, Math.min(40, Math.round(Number(v) || 21)));
}

function setUsedSlots(values) {
    usedSlots = {};
    for (var i = 0; i < values.length; i++) {
        var slot = Math.round(Number(values[i]));
        if (slot >= 21 && slot <= 40) usedSlots[slot] = true;
    }
    mgraphics.redraw();
}

function list() {
    var values = arrayfromargs(arguments);
    if (inlet === 0) setUsedSlots(values);
    else if (values.length) {
        currentSlot = clampSlot(values[0]);
        mgraphics.redraw();
    }
}

function msg_int(v) {
    if (inlet === 0) setUsedSlots([v]);
    else {
        currentSlot = clampSlot(v);
        mgraphics.redraw();
    }
}

function msg_float(v) {
    msg_int(v);
}

function bang() {
    if (inlet === 0) setUsedSlots([]);
}

function paint() {
    if (!usedSlots[currentSlot]) return;
    var w = box.rect[2] - box.rect[0];
    var h = box.rect[3] - box.rect[1];
    mgraphics.set_source_rgba(1.0, 0.49, 0.26, 1.0);
    mgraphics.select_font_face("Arial", 0, 1);
    mgraphics.set_font_size(FONT_SIZE);
    var ext = mgraphics.text_measure("*");
    mgraphics.move_to((w - ext[0]) * 0.5, (h + ext[1]) * 0.5 - 1);
    mgraphics.show_text("*");
}
