// autosize_bpatchers.js
// Ajuste les dimensions des bpatchers du patch parent sur le bounding box
// des objets en mode Presentation de leur patcher enfant.

autowatch = 1;
inlets = 1;
outlets = 1;

var marginX = 0;
var marginY = 0;

function loadbang() {
    deferAutosize.schedule(150);
}

function bang() {
    autosize();
}

function margin(x, y) {
    marginX = Math.max(0, Math.round(Number(x) || 0));
    marginY = Math.max(0, Math.round(Number(y) || 0));
    autosize();
}

function autosize() {
    var p = this.patcher;
    var count = 0;

    for (var box = p.firstobject; box; box = box.nextobject) {
        if (!isBpatcher(box)) continue;

        var child = childPatcher(box);
        if (!child) continue;

        var bounds = presentationBounds(child);
        if (!bounds) continue;

        var width = Math.ceil(bounds.width + marginX);
        var height = Math.ceil(bounds.height + marginY);
        if (width <= 0 || height <= 0) continue;

        if (setBoxSize(box, width, height)) count++;
    }

    outlet(0, "autosized", count);
}

function isBpatcher(box) {
    try {
        return box.maxclass === "bpatcher";
    } catch (e) {
        return false;
    }
}

function childPatcher(box) {
    try {
        if (box.subpatcher) return box.subpatcher();
    } catch (e) {}
    return null;
}

function presentationBounds(patcher) {
    var minX = null;
    var minY = null;
    var maxX = null;
    var maxY = null;

    for (var box = patcher.firstobject; box; box = box.nextobject) {
        var presentation = 0;
        var rect = null;

        try { presentation = Number(box.getattr("presentation")); } catch (e) {}
        if (!presentation) continue;

        try { rect = box.getattr("presentation_rect"); } catch (e) {}
        if (!rect || rect.length < 4) continue;

        var x = Number(rect[0]);
        var y = Number(rect[1]);
        var w = Number(rect[2]);
        var h = Number(rect[3]);
        if (!isFiniteNumber(x) || !isFiniteNumber(y) || !isFiniteNumber(w) || !isFiniteNumber(h)) continue;

        minX = minX === null ? x : Math.min(minX, x);
        minY = minY === null ? y : Math.min(minY, y);
        maxX = maxX === null ? x + w : Math.max(maxX, x + w);
        maxY = maxY === null ? y + h : Math.max(maxY, y + h);
    }

    if (maxX === null || maxY === null) return null;
    return {
        width: Math.max(1, maxX - Math.min(0, minX || 0)),
        height: Math.max(1, maxY - Math.min(0, minY || 0))
    };
}

function setBoxSize(box, width, height) {
    var changed = false;

    try {
        var pr = box.getattr("presentation_rect");
        if (pr && pr.length >= 4 && (Math.round(pr[2]) !== width || Math.round(pr[3]) !== height)) {
            box.message("presentation_rect", pr[0], pr[1], width, height);
            changed = true;
        }
    } catch (e) {}

    try {
        var r = box.getattr("patching_rect");
        if (r && r.length >= 4 && (Math.round(r[2]) !== width || Math.round(r[3]) !== height)) {
            box.message("patching_rect", r[0], r[1], width, height);
            changed = true;
        }
    } catch (e2) {}

    return changed;
}

function isFiniteNumber(v) {
    return typeof v === "number" && isFinite(v);
}

var deferAutosize = new Task(autosize, this);

function notifydeleted() {
    deferAutosize.cancel();
}
