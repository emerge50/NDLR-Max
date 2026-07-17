autowatch = 1;
inlets = 1;
outlets = 0;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var activeStep = 0;
var activeValue = 0;
var patternLength = 16;
var patternMaximum = 20;
var spacing = 4;

function active(step, value, length, maximum) {
    activeStep = Math.max(0, Math.round(Number(step) || 0));
    activeValue = Number(value) || 0;
    patternLength = Math.max(1, Math.min(16, Math.round(Number(length) || 1)));
    patternMaximum = Math.max(1, Number(maximum) || 1);
    mgraphics.redraw();
}

function paint() {
    if (activeStep < 1 || activeStep > patternLength || activeValue <= 1) return;

    var width = box.rect[2] - box.rect[0];
    var height = box.rect[3] - box.rect[1];
    var barWidth = (width - spacing * (patternLength - 1)) / patternLength;
    var normalized = patternMaximum > 1
        ? Math.max(0, Math.min(1, (activeValue - 1) / (patternMaximum - 1)))
        : 0;
    var barHeight = normalized * height;
    if (barHeight <= 0 || barWidth <= 0) return;

    var x = (activeStep - 1) * (barWidth + spacing);
    var y = height - barHeight;
    mgraphics.set_source_rgba(1.0, 0.86, 0.0, 1.0);
    mgraphics.rectangle(x, y, barWidth, barHeight);
    mgraphics.fill();
}

function onresize() { mgraphics.redraw(); }
