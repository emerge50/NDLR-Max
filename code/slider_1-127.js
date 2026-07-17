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
var rangeMin = 1;
var rangeMax = 127;

// apparence
var margin = 12;
var handleRadius = 5;
var lineWidth = 2;

// interaction
var dragging = false;

// ----------------------------------------------------
// Dessin
// ----------------------------------------------------

function paint()
{
    var w = getWidth();
    var h = getHeight();

    var y = h * 0.5;
    var x = normToX(valueNorm);

    // ligne de fond
    mgraphics.set_source_rgba(0.449, 0.966, 0.667, 0.35);
    mgraphics.set_line_width(lineWidth);
    mgraphics.move_to(margin, y);
    mgraphics.line_to(w - margin, y);
    mgraphics.stroke();

    // ligne active
    mgraphics.set_source_rgba(0.449, 0.966, 0.667, 1);
    mgraphics.set_line_width(lineWidth);
    mgraphics.move_to(margin, y);
    mgraphics.line_to(x, y);
    mgraphics.stroke();

    // poignée
    drawHandle(x, y);
}

function drawHandle(x, y)
{
    mgraphics.set_source_rgba(0.449, 0.966, 0.667, 1);
    mgraphics.arc(x, y, handleRadius, 0, Math.PI * 2);
    mgraphics.fill();
}

// ----------------------------------------------------
// Souris
// ----------------------------------------------------

function onclick(x, y, button, cmd, shift, capslock, option, ctrl)
{
    if(!validNumber(x))
        return;

    dragging = true;
    updateFromMouse(x);
}

function ondrag(x, y, button, cmd, shift, capslock, option, ctrl)
{
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
    set(v);
}

function msg_float(v)
{
    set(v);
}

function set(v)
{
    valueNorm = valueToNorm(v);
    valueNorm = clamp(valueNorm, 0, 1);

    mgraphics.redraw();
}

// Retour visuel silencieux de la Mod Matrix.
function modset(v)
{
    set(v);
}

function value(v)
{
    set(v);
    outputValue();
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

function setvalueof(v)
{
    set(v);
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
