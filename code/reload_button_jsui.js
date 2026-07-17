// reload_button_jsui.js
// Utilisation : [jsui reload_button_jsui.js]
// Outlet 0 : bang immédiat au clic ou à la réception d'un bang.

autowatch = 1;
inlets = 1;
outlets = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var PLAY_GREEN = [0.0, 0.9803921569, 0.6392156863, 1.0];
var HOVER_GREEN = [0.28, 1.0, 0.76, 1.0];
var ANIMATION_MS = 600;
var FRAME_MS = 1000 / 60;
var TWO_PI = Math.PI * 2;
var RELOAD_PATH = "M12 3c4.9706 0 9 4.02944 9 9 0 4.9706 -4.0294 9 -9 9 -4.97056 0 -9 -4.0294 -9 -9h2c0 3.866 3.13401 7 7 7 3.866 0 7 -3.134 7 -7 0 -3.86599 -3.134 -7 -7 -7 -2.37754 0 -4.47955 1.18578 -5.74512 3H9.5v2H4c-0.55228 0 -1 -0.44772 -1 -1V3.5h2v2.84277C6.64935 4.30431 9.17173 3 12 3";

var icon = new MGraphicsSVG();
var angle = 0;
var frame = 0;
var frameCount = Math.max(1, Math.round(ANIMATION_MS / FRAME_MS));
var isAnimating = false;
var isHover = false;
var offsetX = 0;
var offsetY = 0;

function colorToHex(color) {
    function channel(value) {
        var hex = Math.round(Math.max(0, Math.min(1, value)) * 255).toString(16);
        return hex.length < 2 ? "0" + hex : hex;
    }
    return "#" + channel(color[0]) + channel(color[1]) + channel(color[2]);
}

function updateSvg() {
    var degrees = angle * 180 / Math.PI;
    var color = colorToHex(isHover ? HOVER_GREEN : PLAY_GREEN);
    var source = "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'>" +
        "<g transform='rotate(" + degrees + " 12 12)'>" +
        "<path fill='" + color + "' d='" + RELOAD_PATH + "'/>" +
        "</g></svg>";
    icon.setsvg(source);
}

function animationStep() {
    frame++;
    var progress = Math.min(1, frame / frameCount);
    // Vitesse constante : un tour complet, lisible, de 0 à 360 degrés.
    angle = -TWO_PI * progress;

    if (progress >= 1) {
        angle = 0;
        isAnimating = false;
        animationTask.cancel();
    }
    mgraphics.redraw();
}

var animationTask = new Task(animationStep, this);
animationTask.interval = FRAME_MS;

function startAnimation() {
    animationTask.cancel();
    frame = 0;
    angle = 0;
    isAnimating = true;
    animationTask.repeat();
    mgraphics.redraw();
}

function paint() {
    // mgraphics.size correspond toujours au canevas réellement dessiné.
    // box.rect peut conserver les dimensions du patching_rect lorsque le jsui
    // possède un presentation_rect différent, ce qui décentre alors l'icône.
    var dimensions = mgraphics.size;
    var w = dimensions[0];
    var h = dimensions[1];
    var size = Math.max(1, Math.min(w, h) * 0.82);
    var centerX = w * 0.5 + offsetX;
    var centerY = h * 0.5 + offsetY;

    // Rotation directement dans le SVG, autour du point central (12, 12).
    // Le mouvement reste ainsi strictement dans le plan de l'écran.
    updateSvg();
    mgraphics.svg_render(icon,
        centerX - size * 0.5,
        centerY - size * 0.5,
        size,
        size);
}

function trigger() {
    outlet(0, "bang");
    startAnimation();
}

function onclick(x, y) {
    trigger();
}

function onidlemousemove(x, y) {
    if (!isHover) {
        isHover = true;
        mgraphics.redraw();
    }
}

function onidleout() {
    if (isHover) {
        isHover = false;
        mgraphics.redraw();
    }
}

function bang() {
    trigger();
}

// Ajustement optique facultatif : message "offset x y", en pixels.
function offset(x, y) {
    offsetX = Number(x) || 0;
    offsetY = Number(y) || 0;
    mgraphics.redraw();
}

function notifydeleted() {
    animationTask.cancel();
}
