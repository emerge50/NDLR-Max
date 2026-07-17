autowatch = 1;
outlets = 1;

// ----------------------------------------------------
// simple_slider.js
// Slider simple pour Max / jsui
// outlet 0 : valeur entière 0–100
// ----------------------------------------------------

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// valeur interne normalisée 0..1
var valueNorm = 0.5;

// plage de sortie
var rangeMin = 0;
var rangeMax = 100;

// apparence
var margin = 12;
var handleRadius = 5;
var lineWidth = 2;
var bgColor = [0, 0, 0, 0];
var trackColor = [0.449, 0.966, 0.667, 0.35];
var activeColor = [0.449, 0.966, 0.667, 1];
var handleColor = [0.449, 0.966, 0.667, 1];

// interaction
var dragging = false;
var clickIgnored = false;

initRangeFromArguments();

// ----------------------------------------------------
// Dessin
// ----------------------------------------------------

function paint()
{
    var w = getWidth();
    var h = getHeight();

    var y = h * 0.5;
    var x = normToX(valueNorm);

    if(bgColor[3] > 0)
    {
        mgraphics.set_source_rgba(bgColor[0], bgColor[1], bgColor[2], bgColor[3]);
        mgraphics.rectangle(0, 0, w, h);
        mgraphics.fill();
    }

    // ligne de fond
    mgraphics.set_source_rgba(trackColor[0], trackColor[1], trackColor[2], trackColor[3]);
    mgraphics.set_line_width(lineWidth);
    mgraphics.move_to(margin, y);
    mgraphics.line_to(w - margin, y);
    mgraphics.stroke();

    // ligne active
    mgraphics.set_source_rgba(activeColor[0], activeColor[1], activeColor[2], activeColor[3]);
    mgraphics.set_line_width(lineWidth);
    mgraphics.move_to(margin, y);
    mgraphics.line_to(x, y);
    mgraphics.stroke();

    // poignée
    drawHandle(x, y);
}

function drawHandle(x, y)
{
    mgraphics.set_source_rgba(handleColor[0], handleColor[1], handleColor[2], handleColor[3]);
    mgraphics.arc(x, y, handleRadius, 0, Math.PI * 2);
    mgraphics.fill();
}

// ----------------------------------------------------
// Souris
// ----------------------------------------------------

function onclick(x, y, button, cmd, shift, capslock, option, ctrl)
{
    if(clickIgnored)
        return;

    if(!validNumber(x))
        return;

    dragging = true;
    updateFromMouse(x);
}

function ondrag(x, y, button, cmd, shift, capslock, option, ctrl)
{
    if(clickIgnored)
        return;

    if(!button)
    {
        dragging = false;
        mgraphics.redraw();
        return;
    }

    if(!dragging)
        return;

    if(!validNumber(x))
        return;

    updateFromMouse(x);
}

function onidleout()
{
    dragging = false;
    mgraphics.redraw();
}

function updateFromMouse(x)
{
    if(!validNumber(x))
        return;

    valueNorm = xToNorm(x);

    outputValue();
    mgraphics.redraw();
}

// ----------------------------------------------------
// Messages Max
// ----------------------------------------------------

function bang()
{
    outputValue();
}

function msg_int(v)
{
    value(v);
}

function msg_float(v)
{
    value(v);
}

function set(v)
{
    valueNorm = valueToNorm(v);
    valueNorm = clamp(valueNorm, 0, 1);

    mgraphics.redraw();
}

function value(v)
{
    set(v);
    outputValue();
}

function range(minValue, maxValue)
{
    var oldValue = normToValue(valueNorm);
    var nextMin = Number(minValue);
    var nextMax = Number(maxValue);

    if(!validNumber(nextMin) || !validNumber(nextMax) || nextMin === nextMax)
        return;

    rangeMin = Math.min(nextMin, nextMax);
    rangeMax = Math.max(nextMin, nextMax);
    valueNorm = clamp(valueToNorm(oldValue), 0, 1);
    mgraphics.redraw();
}

// Retour visuel silencieux de la Mod Matrix.
function modset(v)
{
    valueNorm = clamp(valueToNorm(Number(v)), 0, 1);
    mgraphics.redraw();
}

function setnorm(v)
{
    valueNorm = clamp(v, 0, 1);

    outputValue();
    mgraphics.redraw();
}

function reset()
{
    valueNorm = 0.5;

    outputValue();
    mgraphics.redraw();
}

// Interface de persistance Max / gestionnaire de session.
function getvalueof()
{
    return Math.round(normToValue(valueNorm));
}

// Restauration silencieuse : session_state.js emet ensuite un bang commun a
// tous les controles, une fois que toutes les valeurs ont ete repositionnees.
function setvalueof(v)
{
    set(v);
}

function ignoreclick(v)
{
    clickIgnored = (Number(v) !== 0);
    dragging = false;
    mgraphics.redraw();
}

function bgcolor(r, g, b, a)
{
    bgColor = rgbaArgs(r, g, b, a, bgColor);
    mgraphics.redraw();
}

function elementcolor(r, g, b, a)
{
    trackColor = rgbaArgs(r, g, b, a, trackColor);
    mgraphics.redraw();
}

function knobcolor(r, g, b, a)
{
    handleColor = rgbaArgs(r, g, b, a, handleColor);
    activeColor = rgbaArgs(r, g, b, a, activeColor);
    mgraphics.redraw();
}

// ----------------------------------------------------
// Sortie
// ----------------------------------------------------

function outputValue()
{
    if(!validNumber(valueNorm))
        return;

    var value = Math.round(normToValue(valueNorm));

    if(!validNumber(value))
        return;

    outlet(0, value);
}

// ----------------------------------------------------
// Conversions
// ----------------------------------------------------

function validNumber(v)
{
    return typeof v === "number" && v === v && v !== Infinity && v !== -Infinity;
}

function normToX(n)
{
    var w = getWidth();
    return margin + n * (w - margin * 2);
}

function xToNorm(x)
{
    var w = getWidth();
    var usableWidth = w - margin * 2;

    if(usableWidth <= 0)
        return 0;

    return clamp((x - margin) / usableWidth, 0, 1);
}

function normToValue(n)
{
    return rangeMin + n * (rangeMax - rangeMin);
}

function valueToNorm(v)
{
    if(rangeMax === rangeMin)
        return 0;

    return (v - rangeMin) / (rangeMax - rangeMin);
}

function clamp(v, min, max)
{
    if(!validNumber(v))
        return min;

    if(!validNumber(min))
        min = 0;

    if(!validNumber(max))
        max = 1;

    return Math.max(min, Math.min(max, v));
}

function rgbaArgs(r, g, b, a, fallback)
{
    var c = [
        validNumber(Number(r)) ? Number(r) : fallback[0],
        validNumber(Number(g)) ? Number(g) : fallback[1],
        validNumber(Number(b)) ? Number(b) : fallback[2],
        validNumber(Number(a)) ? Number(a) : fallback[3]
    ];
    return [
        clamp(c[0], 0, 1),
        clamp(c[1], 0, 1),
        clamp(c[2], 0, 1),
        clamp(c[3], 0, 1)
    ];
}

function getWidth()
{
    return box.rect[2] - box.rect[0];
}

function getHeight()
{
    return box.rect[3] - box.rect[1];
}

function onresize(w, h)
{
    mgraphics.redraw();
}

function initRangeFromArguments()
{
    if(typeof jsarguments === "undefined" || jsarguments.length < 3)
        return;

    var nextMin = Number(jsarguments[1]);
    var nextMax = Number(jsarguments[2]);

    if(!validNumber(nextMin) || !validNumber(nextMax) || nextMin === nextMax)
        return;

    rangeMin = Math.min(nextMin, nextMax);
    rangeMax = Math.max(nextMin, nextMax);
}
