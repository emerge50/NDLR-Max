// key_degree_jsui.js — Roue combinée tonalité + degré pour Max jsui
//
// Utilisation : [jsui key_degree_jsui.js]
//
// Inlet 0 : index de tonalité (0=C, 1=G, ... 11=F)
// Inlet 1 : vélocité MIDI associée à la prochaine tonalité (cold inlet)
// Inlet 2 : index de degré (0=I, ... 6=VII)
//
// Outlet 0 : index de tonalité
// Outlet 1 : nom de tonalité
// Outlet 2 : vélocité MIDI (uniquement lors d'un changement par l'inlet 0)
// Outlet 3 : index de degré
// Outlet 4 : chiffre romain du degré

autowatch = 1;
inlets = 3;
outlets = 5;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var CFG = {
    notes: ["C", "G", "D", "A", "E", "B", "G♭", "D♭", "A♭", "E♭", "B♭", "F"],
    degrees: ["I", "II", "III", "IV", "V", "VI", "VII"],

    outerRatio: 0.96,
    keyInnerRatio: 0.64,
    degreeOuterRatio: 0.60,
    centerRatio: 0.29,
    keyGap: 0.025,
    degreeGap: 0.035,

    fontName: "Arial",
    keyFontSize: 12,
    degreeFontSize: 11,
    centerFontSize: 14,

    bgColor: [0.0, 0.0, 0.0, 0.0],
    segBg: [0.165, 0.165, 0.165, 1.0],
    degreeBg: [0.135, 0.135, 0.135, 1.0],
    segText: [0.66, 0.66, 0.66, 1.0],
    hoverBg: [0.24, 0.24, 0.24, 1.0],
    hoverBlinkBg: [0.42, 0.42, 0.42, 1.0],
    hoverText: [1.0, 1.0, 1.0, 1.0],
    selectedBg: [0.449, 0.966, 0.667, 1.0],
    selectedHoverBg: [0.66, 1.0, 0.79, 1.0],
    selectedText: [0.10, 0.10, 0.10, 1.0],
    divider: [0.0, 0.0, 0.0, 0.55],
    border: [1.0, 1.0, 1.0, 0.10],
    borderWidth: 1.0,
    centerBg: [0.10, 0.10, 0.10, 1.0],
    centerText: [0.449, 0.966, 0.667, 1.0],
    centerSubText: [0.55, 0.55, 0.55, 1.0],
    hoverBlinkMs: 260
};

var selectedKey = 0;
var selectedDegree = 0;
var lastVel = 100;
var hoveredRing = "";
var hoveredIndex = -1;
var hoverBlinkOn = false;

function hoverBlinkStep() {
    if (hoveredIndex < 0) {
        hoverBlinkTask.cancel();
        hoverBlinkOn = false;
        return;
    }
    hoverBlinkOn = !hoverBlinkOn;
    mgraphics.redraw();
}

var hoverBlinkTask = new Task(hoverBlinkStep, this);
hoverBlinkTask.interval = CFG.hoverBlinkMs;

function setHovered(ring, idx) {
    if (ring === hoveredRing && idx === hoveredIndex) return;
    hoveredRing = ring;
    hoveredIndex = idx;
    hoverBlinkTask.cancel();
    hoverBlinkOn = idx >= 0;
    if (idx >= 0) hoverBlinkTask.repeat();
    mgraphics.redraw();
}

function sc(c) {
    mgraphics.set_source_rgba(c[0], c[1], c[2], c.length > 3 ? c[3] : 1.0);
}

function dims() {
    var w = box.rect[2] - box.rect[0];
    var h = box.rect[3] - box.rect[1];
    var R = Math.min(w, h) * 0.5 * CFG.outerRatio;
    return {
        w: w,
        h: h,
        cx: w * 0.5,
        cy: h * 0.5,
        outerR: R,
        keyInnerR: R * CFG.keyInnerRatio,
        degreeOuterR: R * CFG.degreeOuterRatio,
        centerR: R * CFG.centerRatio
    };
}

function sectorPath(cx, cy, outerR, innerR, sa, ea) {
    mgraphics.move_to(cx + innerR * Math.cos(sa), cy + innerR * Math.sin(sa));
    mgraphics.line_to(cx + outerR * Math.cos(sa), cy + outerR * Math.sin(sa));
    mgraphics.arc(cx, cy, outerR, sa, ea);
    mgraphics.line_to(cx + innerR * Math.cos(ea), cy + innerR * Math.sin(ea));
    mgraphics.arc_negative(cx, cy, innerR, ea, sa);
    mgraphics.close_path();
}

function centeredText(txt, x, y, size) {
    mgraphics.select_font_face(CFG.fontName);
    mgraphics.set_font_size(size);
    try {
        var ext = mgraphics.text_measure(txt);
        mgraphics.move_to(x - ext[0] * 0.5, y + ext[1] * 0.35);
    } catch (e) {
        mgraphics.move_to(x - size * 0.3 * txt.length, y + size * 0.35);
    }
    mgraphics.show_text(txt);
}

function fontSizeForRadius(baseSize, R) {
    var scaled = R * baseSize / 105.0;
    return Math.max(8, Math.min(baseSize + 3, scaled));
}

function hitRing(x, y) {
    var d = dims();
    var dx = x - d.cx;
    var dy = y - d.cy;
    var dist = Math.sqrt(dx * dx + dy * dy);

    if (dist >= d.keyInnerR && dist <= d.outerR) {
        return { ring: "key", index: hitSegment(dx, dy, CFG.notes.length, CFG.keyGap) };
    }
    if (dist >= d.centerR && dist <= d.degreeOuterR) {
        return { ring: "degree", index: hitSegment(dx, dy, CFG.degrees.length, CFG.degreeGap) };
    }
    return { ring: "", index: -1 };
}

function hitSegment(dx, dy, count, gap) {
    var angle = Math.atan2(dy, dx) + Math.PI / 2;
    if (angle < 0) angle += 2 * Math.PI;
    var full = 2 * Math.PI / count;
    var idx = Math.floor((angle + full * 0.5) / full) % count;
    var localAngle = angle - idx * full;
    while (localAngle > Math.PI) localAngle -= 2 * Math.PI;
    while (localAngle < -Math.PI) localAngle += 2 * Math.PI;
    if (Math.abs(localAngle) > full * 0.5 - gap) return -1;
    return idx;
}

function segmentColor(isSelected, isHovered, normalColor) {
    if (isHovered && hoverBlinkOn) {
        return isSelected ? CFG.selectedHoverBg : CFG.hoverBlinkBg;
    }
    if (isSelected) return CFG.selectedBg;
    if (isHovered) return CFG.hoverBg;
    return normalColor;
}

function drawRing(cx, cy, outerR, innerR, labels, selected, ringName, gap, normalColor, fontSize) {
    var count = labels.length;
    var full = 2 * Math.PI / count;
    var i;

    sc(normalColor);
    mgraphics.arc(cx, cy, outerR, 0, 2 * Math.PI);
    mgraphics.fill();
    sc(CFG.bgColor);
    mgraphics.arc(cx, cy, innerR, 0, 2 * Math.PI);
    mgraphics.fill();

    for (i = 0; i < count; i++) {
        var mid = -Math.PI / 2 + i * full;
        var sa = mid - full * 0.5 + gap;
        var ea = mid + full * 0.5 - gap;
        var isSelected = i === selected;
        var isHovered = ringName === hoveredRing && i === hoveredIndex;

        sc(segmentColor(isSelected, isHovered, normalColor));
        sectorPath(cx, cy, outerR, innerR, sa, ea);
        mgraphics.fill();

        sc(isSelected ? CFG.selectedText : (isHovered ? CFG.hoverText : CFG.segText));
        var textR = (outerR + innerR) * 0.5;
        centeredText(labels[i], cx + textR * Math.cos(mid), cy + textR * Math.sin(mid), isSelected ? fontSize + 1 : fontSize);
    }

    sc(CFG.divider);
    mgraphics.set_line_width(CFG.borderWidth);
    for (i = 0; i < count; i++) {
        var a = -Math.PI / 2 + i * full - full * 0.5;
        mgraphics.move_to(cx + innerR * Math.cos(a), cy + innerR * Math.sin(a));
        mgraphics.line_to(cx + outerR * Math.cos(a), cy + outerR * Math.sin(a));
        mgraphics.stroke();
    }

    sc(CFG.border);
    mgraphics.set_line_width(CFG.borderWidth);
    mgraphics.arc(cx, cy, outerR, 0, 2 * Math.PI);
    mgraphics.stroke();
    mgraphics.arc(cx, cy, innerR, 0, 2 * Math.PI);
    mgraphics.stroke();
}

function paint() {
    var d = dims();

    sc(CFG.bgColor);
    mgraphics.rectangle(0, 0, d.w, d.h);
    mgraphics.fill();

    drawRing(
        d.cx, d.cy, d.outerR, d.keyInnerR,
        CFG.notes, selectedKey, "key", CFG.keyGap, CFG.segBg,
        fontSizeForRadius(CFG.keyFontSize, d.outerR)
    );

    drawRing(
        d.cx, d.cy, d.degreeOuterR, d.centerR,
        CFG.degrees, selectedDegree, "degree", CFG.degreeGap, CFG.degreeBg,
        fontSizeForRadius(CFG.degreeFontSize, d.outerR)
    );

    sc(CFG.centerBg);
    mgraphics.arc(d.cx, d.cy, d.centerR - 2, 0, 2 * Math.PI);
    mgraphics.fill();
    sc(CFG.border);
    mgraphics.set_line_width(CFG.borderWidth);
    mgraphics.arc(d.cx, d.cy, d.centerR - 1, 0, 2 * Math.PI);
    mgraphics.stroke();

    var label = CFG.notes[selectedKey] + " " + CFG.degrees[selectedDegree];
    sc(CFG.centerText);
    centeredText(label, d.cx, d.cy, fontSizeForRadius(CFG.centerFontSize, d.outerR));
}

function selectKey(idx, emit, emitVelocity) {
    idx = Math.round(idx);
    if (idx < 0 || idx >= CFG.notes.length) return;
    selectedKey = idx;
    if (emit) {
        outlet(0, selectedKey);
        outlet(1, CFG.notes[selectedKey]);
        if (emitVelocity) outlet(2, lastVel);
    }
    mgraphics.redraw();
}

function selectDegree(idx, emit) {
    idx = Math.round(idx);
    if (idx < 0 || idx >= CFG.degrees.length) return;
    selectedDegree = idx;
    if (emit) {
        outlet(3, selectedDegree);
        outlet(4, CFG.degrees[selectedDegree]);
    }
    mgraphics.redraw();
}

function onclick(x, y) {
    var hit = hitRing(x, y);
    if (hit.index < 0) return;
    if (hit.ring === "key") selectKey(hit.index, true, false);
    else if (hit.ring === "degree") selectDegree(hit.index, true);
}

function onidlemousemove(x, y) {
    var hit = hitRing(x, y);
    setHovered(hit.ring, hit.index);
}

function onidleout() {
    setHovered("", -1);
}

function notifydeleted() {
    hoverBlinkTask.cancel();
}

// Message "set N" : l'inlet choisit la roue et la mise à jour reste silencieuse.
function set(v) {
    if (inlet === 2) selectDegree(v, false);
    else if (inlet === 0) selectKey(v, false, false);
}

function msg_int(v) {
    if (inlet === 1) {
        lastVel = v;
        return;
    }
    if (inlet === 2) {
        selectDegree(v, true);
        return;
    }
    if (lastVel <= 0) return;
    selectKey(v, true, true);
}

// Messages nommés pratiques, indépendants de l'inlet utilisé.
function key(v) {
    selectKey(v, true, false);
}

function degree(v) {
    selectDegree(v, true);
}

function velocity(v) {
    lastVel = v;
}

function bang() {
    if (inlet === 2) {
        outlet(3, selectedDegree);
        outlet(4, CFG.degrees[selectedDegree]);
    } else {
        outlet(0, selectedKey);
        outlet(1, CFG.notes[selectedKey]);
        outlet(2, lastVel);
    }
}
