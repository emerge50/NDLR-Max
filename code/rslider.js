autowatch = 1;
outlets = 2;

// ----------------------------------------------------
// rslider2.js
// Slider à deux poignées pour Max / jsui
// outlet 0 : min max       valeurs scalées
// outlet 1 : norm min max  valeurs normalisées 0..1
// ----------------------------------------------------

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// valeurs normalisées internes
var leftNorm = 0.0;
var rightNorm = 1.0;

// plage de sortie
var rangeMin = 0;
var rangeMax = 100;

// apparence
var margin = 12;
var handleRadius = 5;
var lineWidth = 2;

// interaction
var activeHandle = -1; 
// -1 = aucun
//  0 = poignée gauche
//  1 = poignée droite

// ----------------------------------------------------
// Dessin
// ----------------------------------------------------

function paint()
{
    var w = getWidth();
    var h = getHeight();

    var y = h * 0.5;

    var x1 = normToX(leftNorm);
    var x2 = normToX(rightNorm);

    // ligne de fond
    mgraphics.set_source_rgba(0.449, 0.966, 0.667, 0.35);
    mgraphics.set_line_width(lineWidth);
    mgraphics.move_to(margin, y);
    mgraphics.line_to(w - margin, y);
    mgraphics.stroke();

    // ligne active entre les deux poignées
    mgraphics.set_source_rgba(0.449, 0.966, 0.667, 1);
    mgraphics.set_line_width(lineWidth);
    mgraphics.move_to(x1, y);
    mgraphics.line_to(x2, y);
    mgraphics.stroke();

    // poignée gauche
    drawHandle(x1, y, activeHandle === 0);

    // poignée droite
    drawHandle(x2, y, activeHandle === 1);
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

// ----------------------------------------------------
// Souris
// ----------------------------------------------------

var dragging = false;

function onclick(x, y, button, cmd, shift, capslock, option, ctrl)
{
    if(!button)
        return;

    if(!validNumber(x))
        return;

    var x1 = normToX(leftNorm);
    var x2 = normToX(rightNorm);

    var d1 = Math.abs(x - x1);
    var d2 = Math.abs(x - x2);

    if(d1 <= d2)
        activeHandle = 0;
    else
        activeHandle = 1;

    dragging = true;

    updateFromMouse(x);
}

function ondrag(x, y, button, cmd, shift, capslock, option, ctrl)
{
    // Relâchement de souris :
    // on arrête tout et on ne sort aucune valeur.
    if(!button)
    {
        dragging = false;
        activeHandle = -1;
        mgraphics.redraw();
        return;
    }

    if(!dragging)
        return;

    if(activeHandle === -1)
        return;

    if(!validNumber(x))
        return;

    updateFromMouse(x);
}

function onidleout()
{
    dragging = false;
    activeHandle = -1;
    mgraphics.redraw();
}

function updateFromMouse(x)
{
    if(!dragging)
        return;

    if(!validNumber(x))
        return;

    var n = xToNorm(x);

    if(!validNumber(n))
        return;

    if(activeHandle === 0)
    {
        leftNorm = clamp(n, 0, rightNorm);
    }
    else if(activeHandle === 1)
    {
        rightNorm = clamp(n, leftNorm, 1);
    }
    else
    {
        return;
    }

    outputValues();
    mgraphics.redraw();
}
// ----------------------------------------------------
// Messages Max
// ----------------------------------------------------


function set(a, b)
{
    // set avec valeurs scalées
    var n1 = valueToNorm(a);
    var n2 = valueToNorm(b);

    leftNorm = clamp(Math.min(n1, n2), 0, 1);
    rightNorm = clamp(Math.max(n1, n2), 0, 1);

    outputValues();
    mgraphics.redraw();
}

function setnorm(a, b)
{
    // setnorm avec valeurs 0..1
    leftNorm = clamp(Math.min(a, b), 0, 1);
    rightNorm = clamp(Math.max(a, b), 0, 1);

    outputValues();
    mgraphics.redraw();
}

function reset()
{
    leftNorm = 0.0;
    rightNorm = 1.0;

    outputValues();
    mgraphics.redraw();
}

function bang()
{
    outputValues();
}

// Interface de persistance Max / gestionnaire de session.
function getvalueof()
{
    return [Math.round(normToValue(leftNorm)), Math.round(normToValue(rightNorm))];
}

function setvalueof(a, b)
{
    var n1 = valueToNorm(a);
    var n2 = valueToNorm(b);
    leftNorm = clamp(Math.min(n1, n2), 0, 1);
    rightNorm = clamp(Math.max(n1, n2), 0, 1);
    mgraphics.redraw();
}

// ----------------------------------------------------
// Sorties
// ----------------------------------------------------

function outputValues()
{
    if(!validNumber(leftNorm) || !validNumber(rightNorm))
        return;

    var leftValue = Math.round(normToValue(leftNorm));
    var rightValue = Math.round(normToValue(rightNorm));

    if(!validNumber(leftValue) || !validNumber(rightValue))
        return;

    outlet(1, rightValue);
    outlet(0, leftValue);
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
