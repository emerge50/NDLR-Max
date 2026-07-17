// Panic_jsui.js — bouton "All Notes Off"
// Utilisation : [jsui Panic_jsui.js]
// Outlet 0 : bang au clic
//
// ⚠ Si l'outlet n'apparaît pas : supprimer le jsui du patch et le recréer,
//   Max ne met à jour le nombre d'outlets qu'à la création de l'objet.

autowatch = 1;
outlets = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ═══════════════════════════════════════
//  CONFIG
// ═══════════════════════════════════════

var CFG = {
    label:          "All Notes Off",
    fontName:       "Arial",
    fontSize:        18,
    cornerRadius:    10,
    borderWidth:     1.2,
    shineOpacity:    0.08,
    blinkInterval:   150,   // ms par demi-période

    // ── État normal (rouge) ───────────────
    bgColor:        [0.45, 0.05, 0.05, 1.0],
    borderColor:    [0.90, 0.22, 0.22, 0.90],
    textColor:      [1.00, 1.00, 1.00, 1.0],

    // ── Hover (rouge plus vif) ────────────
    hoverBg:        [0.58, 0.08, 0.08, 1.0],
    hoverBorder:    [1.00, 0.35, 0.35, 1.0],
    hoverText:      [1.00, 1.00, 1.00, 1.0],

    // ── Clignotement (rouge éclatant) ─────
    blinkBg:        [0.90, 0.10, 0.10, 1.0],
    blinkBorder:    [1.00, 0.60, 0.60, 1.0],
    blinkText:      [1.00, 1.00, 1.00, 1.0],
};

// ═══════════════════════════════════════
//  ÉTAT
// ═══════════════════════════════════════

var isHover   = false;
var blinkOn   = false;
var blinkLeft = 0;

// ═══════════════════════════════════════
//  TASK (déclaré au niveau fichier)
// ═══════════════════════════════════════

function doBlinkStep() {
    blinkOn = !blinkOn;
    blinkLeft--;
    if (blinkLeft <= 0) {
        blinkOn = false;
        blinkTask.cancel();
    }
    mgraphics.redraw();
}

var blinkTask = new Task(doBlinkStep, this);
blinkTask.interval = CFG.blinkInterval;

function startBlink() {
    blinkTask.cancel();
    blinkLeft = 3;   // ON → OFF → ON → OFF
    blinkOn   = true;
    blinkTask.repeat(3);
    mgraphics.redraw();
}

// ═══════════════════════════════════════
//  HELPERS
// ═══════════════════════════════════════

function sc(c) {
    mgraphics.set_source_rgba(c[0], c[1], c[2], c.length > 3 ? c[3] : 1.0);
}

function rrect(x, y, w, h, r) {
    mgraphics.rectangle_rounded(x, y, w, h, r, r);
}

// ═══════════════════════════════════════
//  PAINT
// ═══════════════════════════════════════

function paint() {
    var w  = box.rect[2] - box.rect[0];
    var h  = box.rect[3] - box.rect[1];
    var r  = CFG.cornerRadius;
    var bw = CFG.borderWidth / 2;

    var bg, border, textCol;
    if (blinkOn) {
        bg      = CFG.blinkBg;
        border  = CFG.blinkBorder;
        textCol = CFG.blinkText;
    } else if (isHover) {
        bg      = CFG.hoverBg;
        border  = CFG.hoverBorder;
        textCol = CFG.hoverText;
    } else {
        bg      = CFG.bgColor;
        border  = CFG.borderColor;
        textCol = CFG.textColor;
    }

    // Fond
    sc(bg);
    rrect(0, 0, w, h, r);
    mgraphics.fill();

    // Reflet
    if (CFG.shineOpacity > 0) {
        try {
            var shine = mgraphics.pattern_create_linear(0, 0, 0, h * 0.55);
            shine.add_color_stop_rgba(0, 1, 1, 1, blinkOn ? CFG.shineOpacity * 2 : CFG.shineOpacity);
            shine.add_color_stop_rgba(1, 1, 1, 1, 0);
            mgraphics.set_source(shine);
            rrect(0, 0, w, h, r);
            mgraphics.fill();
        } catch(e) {}
    }

    // Bordure
    sc(border);
    mgraphics.set_line_width(CFG.borderWidth);
    rrect(bw, bw, w - bw * 2, h - bw * 2, r);
    mgraphics.stroke();

    // Texte centré
    sc(textCol);
    mgraphics.select_font_face(CFG.fontName);
    mgraphics.set_font_size(CFG.fontSize);
    var ty = h * 0.5 + CFG.fontSize * 0.36;
    var tx = 0;
    try {
        var ext = mgraphics.text_measure(CFG.label);
        tx = (w - ext[0]) * 0.5;
    } catch(e) {
        tx = w * 0.15;
    }
    mgraphics.move_to(tx, ty);
    mgraphics.show_text(CFG.label);
}

// ═══════════════════════════════════════
//  INTERACTIONS
// ═══════════════════════════════════════

function onclick(x, y) {
    outlet(0, "bang");
    startBlink();
}

function onidlemousemove(x, y) {
    if (!isHover) {
        isHover = true;
        mgraphics.redraw();
    }
}

function onidleout() {
    isHover = false;
    mgraphics.redraw();
}

// ═══════════════════════════════════════
//  MESSAGES ENTRANTS
// ═══════════════════════════════════════

function bang() {
    outlet(0, "bang");
    startBlink();
}
