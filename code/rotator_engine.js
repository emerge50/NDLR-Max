autowatch = 1;
inlets = 1;
outlets = 1;

var enabled = false;
var midiChannel = 16;
var keyIndex = 0;
var modeIndex = 0;
var scaleClasses = [0,2,4,5,7,9,11];
var patternValues = [27,24,32,15,29];
var rotationIndex = 0;
var status = 0, data = [];
var held = {};

var KEY_MIDI = [0,7,2,9,4,11,6,1,8,3,10,5];
var MODES = [
    [0,2,4,5,7,9,11],[0,2,3,5,7,9,10],[0,1,3,5,7,8,10],
    [0,2,4,6,7,9,11],[0,2,4,5,7,9,10],[0,2,3,5,7,8,10],
    [0,1,3,5,6,8,10],[0,2,3,6,7,8,10],[0,2,3,5,7,8,11],
    [0,3,5,7,10],[0,2,4,6,8,10],[0,2],[0,4],[0,5],[0,9]
];

function clampNote(n) { return Math.max(0, Math.min(127, Math.round(n))); }
function rebuildScale() {
    var root = KEY_MIDI[Math.max(0, Math.min(11, keyIndex))];
    var ints = MODES[Math.max(0, Math.min(MODES.length - 1, modeIndex))] || MODES[0];
    scaleClasses = [];
    for (var i = 0; i < ints.length; i++) scaleClasses.push((root + ints[i]) % 12);
}
function quantize(n) {
    n = clampNote(n);
    var best = n, dist = 99;
    for (var d = -6; d <= 6; d++) {
        var c = n + d;
        if (c < 0 || c > 127 || scaleClasses.indexOf(c % 12) < 0) continue;
        if (Math.abs(d) < dist) { best = c; dist = Math.abs(d); }
    }
    return best;
}
function unique(notes) {
    var out = [];
    for (var i = 0; i < notes.length; i++) if (out.indexOf(notes[i]) < 0) out.push(notes[i]);
    return out;
}
function notesFor(input) {
    var parallel = patternValues[0] - 20;
    var rotating = patternValues[1 + (rotationIndex % 4)] - 20;
    rotationIndex = (rotationIndex + 1) % 4;
    return unique([quantize(input), quantize(input + parallel), quantize(input + rotating)]);
}
function emit(notes, velocity, channel) {
    for (var i = 0; i < notes.length; i++) outlet(0, notes[i], velocity, channel);
}
function noteOn(note, velocity, channel) {
    var id = channel + ':' + note;
    if (held[id]) emit(held[id].notes, 0, channel);
    var notes = notesFor(note);
    held[id] = {input:note, velocity:velocity, channel:channel, notes:notes};
    emit(notes, velocity, channel);
}
function noteOff(note, channel) {
    var id = channel + ':' + note;
    if (!held[id]) return;
    emit(held[id].notes, 0, channel);
    delete held[id];
}
function allnotesoff() {
    for (var id in held) if (held.hasOwnProperty(id)) emit(held[id].notes, 0, held[id].channel);
    held = {};
}
function refreshHeld() {
    var copy = [];
    for (var id in held) if (held.hasOwnProperty(id)) copy.push(held[id]);
    allnotesoff();
    for (var i = 0; i < copy.length; i++) noteOn(copy[i].input, copy[i].velocity, copy[i].channel);
}

function enable(v) { enabled = v ? true : false; if (!enabled) allnotesoff(); }
function channel(v) { allnotesoff(); midiChannel = Math.max(1, Math.min(16, Math.round(v))); }
function key(v) { keyIndex = Math.max(0, Math.min(11, Math.round(v))); rebuildScale(); if (enabled) refreshHeld(); }
function mode(v) { modeIndex = Math.max(0, Math.min(14, Math.round(v))); rebuildScale(); if (enabled) refreshHeld(); }
function reload_pattern() { loadPattern40(); }

function loadPattern40() {
    if (typeof Dict === 'undefined') return;
    try {
        var dd = new Dict('ndlr_motif1_library');
        if (!dd.contains('patterns::40::values')) return;
        var raw = dd.get('patterns::40::values');
        var arr = (raw instanceof Array) ? raw : Array.prototype.slice.call(raw || []);
        if (arr.length >= 5) {
            var out = [];
            for (var i = 0; i < 5; i++) out.push(Math.max(0, Math.min(60, Number(arr[i]))));
            patternValues = out;
        }
    } catch (e) { post('rotator: Pattern 40 illisible, valeurs par défaut utilisées\n'); }
}

function msg_int(byte) {
    byte = Math.max(0, Math.min(255, Math.round(byte)));
    if (byte >= 0x80) {
        if (byte >= 0xF8) return;
        status = byte; data = []; return;
    }
    if (!status) return;
    data.push(byte);
    var type = status & 0xF0, ch = (status & 0x0F) + 1;
    var needed = (type === 0xC0 || type === 0xD0) ? 1 : 2;
    if (data.length < needed) return;
    if (enabled && ch === midiChannel && (type === 0x80 || type === 0x90)) {
        var note = data[0], vel = type === 0x80 ? 0 : data[1];
        if (vel > 0) noteOn(note, vel, ch); else noteOff(note, ch);
    }
    data = [];
}
function loadbang() { rebuildScale(); loadPattern40(); }
