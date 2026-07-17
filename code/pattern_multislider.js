autowatch = 1;
inlets = 1;
outlets = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var values = [];
var previewValues = null;
var sliderCount = 16;
var rangeMin = 1;
var rangeMax = 20;
var activeStep = 0;
var spacing = 4;
var dragging = false;

var GREEN = [0.0, 0.980392156862745, 0.63921568627451, 1.0];
var YELLOW = [1.0, 0.86, 0.0, 1.0];

function ensureValues() {
    while (values.length < sliderCount) values.push(rangeMin);
    if (values.length > sliderCount) values = values.slice(0, sliderCount);
}

function list() {
    values = arrayfromargs(arguments);
    sliderCount = Math.max(1, values.length);
    ensureValues();
    mgraphics.redraw();
}

function setlist() {
    values = arrayfromargs(arguments);
    sliderCount = Math.max(1, values.length);
    ensureValues();
    mgraphics.redraw();
}

function preview() {
    previewValues = arrayfromargs(arguments);
    sliderCount = Math.max(1, previewValues.length);
    ensureValues();
    mgraphics.redraw();
}

function clearpreview() {
    previewValues = null;
    mgraphics.redraw();
}

function size(v) {
    sliderCount = Math.max(1, Math.min(16, Math.round(Number(v) || 1)));
    ensureValues();
    if (activeStep > sliderCount) activeStep = 0;
    mgraphics.redraw();
}

function setmax(v) {
    rangeMax = Math.max(rangeMin, Number(v) || rangeMin);
    mgraphics.redraw();
}

function setmin(v) {
    rangeMin = Number(v) || 0;
    if (rangeMax < rangeMin) rangeMax = rangeMin;
    mgraphics.redraw();
}

function setminmax(lo, hi) {
    rangeMin = Number(lo) || 0;
    rangeMax = Math.max(rangeMin, Number(hi) || rangeMin);
    mgraphics.redraw();
}

function active(step, value, length, maximum) {
    activeStep = Math.max(0, Math.round(Number(step) || 0));
    sliderCount = Math.max(1, Math.min(16, Math.round(Number(length) || sliderCount)));
    rangeMax = Math.max(rangeMin, Number(maximum) || rangeMax);
    ensureValues();
    // Le moteur fournit aussi la valeur réellement jouée : elle maintient le
    // surlignage exact même pendant un changement de pattern en temps réel.
    if (previewValues && activeStep >= 1 && activeStep <= sliderCount && Number(value) >= rangeMin) {
        previewValues[activeStep - 1] = Number(value);
    }
    mgraphics.redraw();
}

function paint() {
    ensureValues();
    var width = box.rect[2] - box.rect[0];
    var height = box.rect[3] - box.rect[1];
    var barWidth = Math.max(1, (width - spacing * (sliderCount - 1)) / sliderCount);
    var span = Math.max(1, rangeMax - rangeMin);

    var paintValues = previewValues || values;
    for (var i = 0; i < sliderCount; i++) {
        var value = Math.max(rangeMin, Math.min(rangeMax, Number(paintValues[i]) || rangeMin));
        var normalized = (value - rangeMin) / span;
        var barHeight = Math.max(2, normalized * (height - 2));
        var x = i * (barWidth + spacing);
        var y = height - barHeight;
        var color = (i + 1 === activeStep) ? YELLOW : GREEN;
        mgraphics.set_source_rgba(color[0], color[1], color[2], color[3]);
        mgraphics.rectangle(x, y, barWidth, barHeight);
        mgraphics.fill();
    }
}

function updateFromMouse(x, y) {
    previewValues = null;
    var width = box.rect[2] - box.rect[0];
    var height = box.rect[3] - box.rect[1];
    var cellWidth = width / sliderCount;
    var index = Math.max(0, Math.min(sliderCount - 1, Math.floor(x / cellWidth)));
    var normalized = Math.max(0, Math.min(1, (height - y) / height));
    values[index] = Math.round(rangeMin + normalized * (rangeMax - rangeMin));
    mgraphics.redraw();
}

function onclick(x, y) {
    dragging = true;
    updateFromMouse(x, y);
}

function ondrag(x, y, button) {
    if (!button) {
        if (dragging) outputValues();
        dragging = false;
        return;
    }
    if (dragging) updateFromMouse(x, y);
}

function onidleout() {
    if (dragging) outputValues();
    dragging = false;
}

function outputValues() {
    outlet.apply(this, [0].concat(values));
}

function onresize() { mgraphics.redraw(); }
