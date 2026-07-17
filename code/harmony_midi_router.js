// harmony_midi_router.js — Filtre MIDI pour les roues Key et Degree
//
// Inlet 0 : flux MIDI brut (octets venant de [midiin])
// Inlet 1 : canal MIDI Key (1-16)
// Inlet 2 : canal MIDI Degree (1-16)
//
// Outlet 0 : index Key (0-11, note MIDI modulo 12)
// Outlet 1 : vélocité Key (émise avant l'index Key)
// Outlet 2 : index Degree (0-6, touches blanches C-B = I-VII)

autowatch = 1;
inlets = 3;
outlets = 3;

var keyChannel = 1;
var degreeChannel = 2;
var runningStatus = 0;
var data = [];

// C, D, E, F, G, A, B -> I, II, III, IV, V, VI, VII.
// Les touches noires ne changent pas le degré.
var DEGREE_BY_PITCH_CLASS = {
    0: 0,
    2: 1,
    4: 2,
    5: 3,
    7: 4,
    9: 5,
    11: 6
};

function clampChannel(v) {
    return Math.max(1, Math.min(16, Math.round(v)));
}

function setKeyChannel(v) {
    keyChannel = clampChannel(v);
}

function setDegreeChannel(v) {
    degreeChannel = clampChannel(v);
}

function handleNoteOn(note, velocity, channel) {
    if (channel === keyChannel) {
        // La vélocité doit atteindre l'inlet froid avant l'index de Key.
        outlet(1, velocity);
        outlet(0, note % 12);
    }

    if (channel === degreeChannel) {
        var pitchClass = note % 12;
        if (DEGREE_BY_PITCH_CLASS[pitchClass] !== undefined) {
            outlet(2, DEGREE_BY_PITCH_CLASS[pitchClass]);
        }
    }
}

function parseMidiByte(byte) {
    byte = Math.max(0, Math.min(255, Math.round(byte)));

    // Les messages temps réel peuvent apparaître au milieu d'un message MIDI.
    if (byte >= 0xF8) return;

    if (byte >= 0x80) {
        // On ne traite ici que les messages de canal ; SysEx et messages système
        // annulent proprement le running status.
        if (byte >= 0xF0) {
            runningStatus = 0;
            data = [];
            return;
        }
        runningStatus = byte;
        data = [];
        return;
    }

    if (!runningStatus) return;

    data.push(byte);
    var type = runningStatus & 0xF0;
    var needed = (type === 0xC0 || type === 0xD0) ? 1 : 2;
    if (data.length < needed) return;

    if (type === 0x90 && data[1] > 0) {
        handleNoteOn(data[0], data[1], (runningStatus & 0x0F) + 1);
    }

    // Le running status reste actif pour le prochain groupe de données.
    data = [];
}

function msg_int(v) {
    if (inlet === 1) {
        setKeyChannel(v);
    } else if (inlet === 2) {
        setDegreeChannel(v);
    } else {
        parseMidiByte(v);
    }
}

function key_channel(v) {
    setKeyChannel(v);
}

function degree_channel(v) {
    setDegreeChannel(v);
}
