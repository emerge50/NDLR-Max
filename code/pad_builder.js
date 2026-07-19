// pad_builder.js
// inlet 0 : messages nommés
//   pool [notes...]      : pool complet des notes de l'accord
//   roles [-1 tonic nc r...] : centre tonal puis paires noteClass/role
//   register [-2..2]     : transposition finale par octaves
//   strum_on [0-1]       : active/désactive le strum
//   strum_div [1-21]     : division d'horloge entre les notes
//   strum_group [0-1]    : joue les 3 premières notes ensemble
//   strum [1-7]          : compatibilité avec l'ancien sélecteur
//   spread [0-11]        : None + profils Voice Grouping Scaler 3.3 (alias historique)
//   polychain [1-4]      : répartit les voix sur 1 à 4 canaux MIDI
//   channel [1-16]       : premier canal MIDI utilisé par Poly-Chain
//   inversion [0-6]      : aucune inversion ou profil Scaler 3.3
//   chord_invert [0-1]   : alias historique (1 = 1st Inversion)
//   pad_quant [0-2]      : 0=off, 1=1/4, 2=1/8
//   beat                 : tick maître 96 PPQN pour la quantification
//   tempo [10-300]       : tempo en BPM
//   vel [0-127]          : vélocité des notes envoyées
//   start                : active le pad
//   stop                 : désactive le pad et coupe les notes actives
//   allnotesoff          : coupe toutes les notes actives
// outlet 0 : NoteOn  — [note MIDI, vélocité]
// outlet 1 : extinction brute — [status NoteOn canal, note MIDI, 0]

autowatch = 1;
inlets  = 1;
outlets = 2;

var CLK_DIVISIONS = [
    {id:1,label:'1nd',ticks:576}, {id:2,label:'1n',ticks:384}, {id:3,label:'1nt',ticks:256},
    {id:4,label:'2nd',ticks:288}, {id:5,label:'2n',ticks:192}, {id:6,label:'2nt',ticks:128},
    {id:7,label:'4nd',ticks:144}, {id:8,label:'4n',ticks:96}, {id:9,label:'4nt',ticks:64},
    {id:10,label:'8nd',ticks:72}, {id:11,label:'8n',ticks:48}, {id:12,label:'8nt',ticks:32},
    {id:13,label:'16nd',ticks:36}, {id:14,label:'16n',ticks:24}, {id:15,label:'16nt',ticks:16},
    {id:16,label:'32nd',ticks:18}, {id:17,label:'32n',ticks:12}, {id:18,label:'32nt',ticks:8},
    {id:19,label:'64nd',ticks:9}, {id:20,label:'64n',ticks:6}, {id:21,label:'128n',ticks:3}
];

var VOICE_GROUPING_PROFILES = [
    'None', 'Dynamic',
    'Grouping',
    'Open 1 Voicing', 'Open 2 Voicing', 'Open 3 Voicing',
    'Guitar Voicing', 'Drop 2 Voicing', 'Drop 3 Voicing',
    'Drop 4 Voicing', 'Drop 2 & 3 Voicing', 'Voicing Lock'
];

var INVERSION_PROFILES = [
    'No Inversion', '1st Inversion', '2nd Inversion', 'Drop 2', 'Drop 2 & 3',
    '7ths Inverted', 'Octaves & Inverted 3rds'
];

var currentPool     = [];
var currentRoles    = {};  // noteClass (0-11) → role
var stagedRoles     = {};  // rôles du prochain pool reçu
var currentTonalCenter = 60;
var stagedTonalCenter  = 60;
var currentRegister = 0;
var strumEnabled    = false;
var currentStrumDiv = 17; // 32n, équivalent de l'ancien 1/32
var strumGrouped    = false;
var currentSpread   = 0; // index du profil Voice Grouping
var currentPolyChain = 1;
var currentChannel   = 1;
var currentInversion = 0;
var currentPadQuant  = 0;
var quantTick        = 0;
var pendingPool      = null;
var pendingRoles     = null;
var pendingTonalCenter = null;
var currentTempo    = 90;
var currentVel      = 64;  // valeur initiale du curseur Pad Velocity (1-127)
var isRunning              = false;
var isEnabled              = false; // état du bouton on/off local (indépendant du transport)
var globalTransportRunning = false; // true quand le transport global ndlr est actif
var activeNotes     = [];
var activeGroupedNotes = [];
var strumTasks      = [];
var voicingLockTemplate = [];
var voicingLockRootNote = 60;
var voicingLockSourceProfile = 0;
var voicingLockPreviousInversion = 0;
var dynamicVoicingHistory = {};
// Laisser aux Note Off le temps d'etre serialises avant de rejouer exactement
// le meme accord. Ce court intervalle evite les extinctions partielles chez
// certains recepteurs MIDI lors de clics repetes sur la roue.
var RETRIGGER_GAP_MS = 5;
var pendingControls = {
    spread: currentSpread,
    vel: currentVel,
    spreadDirty: false,
    velDirty: false
};

// Rôles harmoniques
var ROLE_ROOT    = 0;
var ROLE_SECOND  = 1;
var ROLE_THIRD   = 2;
var ROLE_FOURTH  = 3;
var ROLE_FIFTH   = 4;
var ROLE_SIXTH   = 5;
var ROLE_SEVENTH = 6;

function getStrumDelay() {
    if (!strumEnabled) return 0;
    var quarter = 60000 / currentTempo;
    var division = CLK_DIVISIONS[Math.max(0, Math.min(CLK_DIVISIONS.length - 1, currentStrumDiv - 1))];
    return quarter * division.ticks / 96;
}

function cancelStrumTasks() {
    for (var i = 0; i < strumTasks.length; i++) {
        strumTasks[i].cancel();
    }
    strumTasks = [];
}

function channelForVoice(index) {
    return ((currentChannel - 1 + (index % currentPolyChain)) % 16) + 1;
}

function playStrumNote(note, velocity, channel) {
    outlet(0, note, velocity, channel);
}

// Scaler éteint les notes avec un statut Note On (0x9n) et une vélocité 0.
// Envoyer les trois octets bruts évite la conversion de noteout en statut 0x8n.
function releaseNote(note, channel) {
    outlet(1, 143 + channel, note, 0);
}

// Une seule callback scheduler émet tout l'accord : les voix partagent ainsi
// le même instant MIDI, même lorsqu'un court délai sépare Note Off et Note On.
function playChordNotes(notes, velocity, channels) {
    for (var i = 0; i < notes.length; i++) {
        outlet(0, notes[i], velocity, channels[i]);
    }
}

function scheduleChordNotes(notes, velocity, channels, timeOffset) {
    var task = new Task(playChordNotes, this, notes.slice(), velocity, channels.slice());
    task.schedule(timeOffset);
    strumTasks.push(task);
}

// Retourne le rôle d'une note MIDI
function getRole(midiNote) {
    var nc = midiNote % 12;
    return (currentRoles[nc] !== undefined) ? currentRoles[nc] : ROLE_ROOT;
}

function uniqueSorted(notes) {
    var result = [];
    var sorted = notes.slice().sort(function(a, b) { return a - b; });
    for (var i = 0; i < sorted.length; i++) {
        var note = Math.max(0, Math.min(127, Math.round(sorted[i])));
        if (result.indexOf(note) < 0) result.push(note);
    }
    return result;
}

function nearestPitchClass(noteClass, target, low, high) {
    var best = low;
    var bestDistance = 999;
    for (var note = low; note <= high; note++) {
        if (((note % 12) + 12) % 12 !== noteClass) continue;
        var distance = Math.abs(note - target);
        if (distance < bestDistance) {
            best = note;
            bestDistance = distance;
        }
    }
    return best;
}

function rootClassFor(notes) {
    for (var i = 0; i < notes.length; i++) {
        if (getRole(notes[i]) === ROLE_ROOT) return ((notes[i] % 12) + 12) % 12;
    }
    return notes.length ? ((notes[0] % 12) + 12) % 12 : 0;
}

function normalizedNoteClass(note) {
    return ((Math.round(note) % 12) + 12) % 12;
}

function hasHarmonicRole(role) {
    for (var noteClass in currentRoles) {
        if (currentRoles.hasOwnProperty(noteClass) && currentRoles[noteClass] === role) return true;
    }
    return false;
}

function isUpperExtensionRole(role) {
    // Une seconde/quarte sans tierce est une suspension, pas une 9e/11e.
    // Une sixte ne devient 13e que lorsque les extensions inférieures existent.
    if (role === ROLE_SECOND || role === ROLE_FOURTH) return hasHarmonicRole(ROLE_THIRD);
    if (role === ROLE_SIXTH) return hasHarmonicRole(ROLE_SECOND) || hasHarmonicRole(ROLE_FOURTH);
    return false;
}

function pitchClassesFor(notes, excludeExtensions) {
    var result = [];
    var source = uniqueSorted(notes);
    for (var i = 0; i < source.length; i++) {
        var noteClass = normalizedNoteClass(source[i]);
        var role = getRole(source[i]);
        if (excludeExtensions && isUpperExtensionRole(role)) continue;
        if (result.indexOf(noteClass) < 0) result.push(noteClass);
    }
    return result;
}

function notesForPitchClass(noteClass, low, high) {
    var result = [];
    for (var note = Math.max(0, Math.round(low)); note <= Math.min(127, Math.round(high)); note++) {
        if (normalizedNoteClass(note) === noteClass) result.push(note);
    }
    return result;
}

// Distance ordonnée avec coût d'insertion/suppression : elle reste stable
// quand une couleur ajoute ou retire une extension.
function voicingDistance(a, b) {
    if (!b || !b.length) return 0;
    var rows = a.length + 1;
    var cols = b.length + 1;
    var matrix = [];
    var insertionCost = 7;
    for (var i = 0; i < rows; i++) {
        matrix[i] = [];
        matrix[i][0] = i * insertionCost;
    }
    for (var j = 0; j < cols; j++) matrix[0][j] = j * insertionCost;
    for (var r = 1; r < rows; r++) {
        for (var c = 1; c < cols; c++) {
            var move = matrix[r - 1][c - 1] + Math.abs(a[r - 1] - b[c - 1]);
            var remove = matrix[r - 1][c] + insertionCost;
            var insert = matrix[r][c - 1] + insertionCost;
            matrix[r][c] = Math.min(move, remove, insert);
        }
    }
    return matrix[rows - 1][cols - 1];
}

function scoreVoicing(candidate, previous, center) {
    var tonalDistance = 0;
    for (var i = 0; i < candidate.length; i++) tonalDistance += Math.abs(candidate[i] - center);
    var span = candidate.length > 1 ? candidate[candidate.length - 1] - candidate[0] : 0;
    var spanPenalty = Math.max(0, span - 12) * 2;
    if (previous && previous.length) {
        return voicingDistance(candidate, previous) * 20 + tonalDistance + spanPenalty;
    }
    return tonalDistance + spanPenalty;
}

function bestVoicingInRange(noteClasses, low, high, center, previous) {
    if (!noteClasses.length) return [];
    var choices = [];
    for (var i = 0; i < noteClasses.length; i++) {
        var notes = notesForPitchClass(noteClasses[i], low, high);
        if (!notes.length) return [];
        choices.push(notes);
    }
    var best = [];
    var bestScore = 999999;
    var candidate = [];
    function visit(index) {
        if (index === choices.length) {
            var sorted = uniqueSorted(candidate);
            if (sorted.length !== noteClasses.length) return;
            var score = scoreVoicing(sorted, previous, center);
            if (score < bestScore) {
                bestScore = score;
                best = sorted.slice();
            }
            return;
        }
        for (var j = 0; j < choices[index].length; j++) {
            candidate.push(choices[index][j]);
            visit(index + 1);
            candidate.pop();
        }
    }
    visit(0);
    return best;
}

function dynamicVoicing(notes) {
    var source = uniqueSorted(notes);
    if (!source.length) return source;

    // Basse dans l'octave située deux octaves sous le centre tonal. Les voix
    // supérieures privilégient ensuite le déplacement minimal entre accords.
    // Chez Scaler, les renversements 1 et 2 changent la classe de cette basse
    // sans faire tourner à nouveau les voix supérieures du preset Dynamic.
    var center = currentTonalCenter;
    var rootClass = rootClassFor(source);
    var bassLow = Math.max(0, center - 24);
    var bassHigh = Math.min(127, center - 13);
    var rootBass = nearestPitchClass(rootClass, center - 24, bassLow, bassHigh);
    var bassClass = rootClass;
    if (currentInversion === 1) {
        bassClass = noteClassForRole(ROLE_THIRD,
            noteClassForRole(ROLE_FOURTH,
                noteClassForRole(ROLE_SECOND, rootClass)));
    } else if (currentInversion === 2) {
        bassClass = noteClassForRole(ROLE_FIFTH, rootClass);
    }

    var thirdClass = noteClassForRole(ROLE_THIRD, -1);
    var fifthClass = noteClassForRole(ROLE_FIFTH, -1);
    var thirdInterval = thirdClass < 0 ? -1 : (thirdClass - rootClass + 12) % 12;
    var fifthInterval = fifthClass < 0 ? -1 : (fifthClass - rootClass + 12) % 12;
    var diminishedFirstInversion = currentInversion === 1 &&
        thirdInterval === 3 && fifthInterval === 6;

    // Pour I à VI, la tierce reste dans la plage ascendante ouverte par la
    // fondamentale grave (VI donne ainsi C2). Sur le degré VII diminué,
    // Scaler conserve D1 dans l'octave grave du centre tonal.
    var bass = diminishedFirstInversion ?
        nearestPitchClass(bassClass, center - 24, bassLow, bassHigh) :
        nearestPitchClass(bassClass, rootBass, rootBass,
            Math.min(127, rootBass + 11));

    var coreClasses = pitchClassesFor(source, true);
    if (!coreClasses.length) coreClasses = pitchClassesFor(source, false);
    if (diminishedFirstInversion) {
        // Particularité observée dans Scaler sur VII° / 1st inversion : la
        // septième mineure de la fondamentale (A pour B°) complète les voix.
        var addedClass = (rootClass + 10) % 12;
        if (coreClasses.indexOf(addedClass) < 0) coreClasses.push(addedClass);
    }
    var previous = dynamicVoicingHistory[1] || [];
    var upper = bestVoicingInRange(coreClasses,
        Math.max(0, center - 12), Math.min(127, center + 11), center, previous);

    // 9e, 11e et 13e commencent dans la seconde octave. Une extension située
    // trop loin du centre tonal est rabattue dans la première octave.
    var extensionRoles = [ROLE_SECOND, ROLE_FOURTH, ROLE_SIXTH];
    for (var i = 0; i < extensionRoles.length; i++) {
        if (!isUpperExtensionRole(extensionRoles[i])) continue;
        var extensionClass = noteClassForRole(extensionRoles[i], -1);
        if (extensionClass < 0) continue;
        var extension = nearestPitchClass(extensionClass, center + 12,
            Math.max(0, center + 12), Math.min(127, center + 23));
        if (extension - center > 19) extension -= 12;
        upper.push(extension);
    }
    upper = uniqueSorted(upper);
    dynamicVoicingHistory[1] = upper.slice();
    return uniqueSorted([bass].concat(upper));
}

function groupingVoicing(notes, low, high, profile) {
    var source = uniqueSorted(notes);
    var noteClasses = pitchClassesFor(source, false);
    if (!noteClasses.length) return [];
    var rangeCenter = nearestPitchClass(normalizedNoteClass(currentTonalCenter),
        (low + high) / 2, low, high);
    var result = bestVoicingInRange(noteClasses, low, high, rangeCenter,
        dynamicVoicingHistory[profile] || []);
    dynamicVoicingHistory[profile] = result.slice();
    return result;
}

function openVoicing(notes, level) {
    var source = uniqueSorted(notes);
    if (source.length < 2) return source;

    // Open 1 : spread classique. Une voix intérieure sur deux monte d'une
    // octave, ce qui transforme par exemple C3-E3-G3 en C3-G3-E4.
    var result = [];
    for (var i = 0; i < source.length; i++) {
        var note = source[i];
        if (i > 0 && i % 2 === 1 && note + 12 <= 127) note += 12;
        result.push(note);
    }
    result = uniqueSorted(result);

    // Open 2 : même contour avec une basse réellement ouverte. Register reste
    // différent puisqu'il transpose toutes les voix, et non la basse seule.
    if (level >= 2 && result.length && result[0] - 12 >= 0) {
        result[0] -= 12;
        result = uniqueSorted(result);
    }

    // Open 3 : étend aussi la voix supérieure, pour une largeur clairement
    // distincte d'Open 1 et Open 2.
    if (level >= 3 && result.length) {
        var top = result.length - 1;
        if (result[top] + 12 <= 127) result[top] += 12;
    }

    // Les trois profils Open sont positionnés une octave sous leur construction
    // interne. Register reste ensuite libre de transposer le résultat complet.
    var lowered = [];
    for (var j = 0; j < result.length; j++) lowered.push(result[j] - 12);
    return uniqueSorted(lowered);
}

function dropVoicing(notes, drops) {
    var result = uniqueSorted(notes);
    for (var i = 0; i < drops.length; i++) {
        var index = result.length - drops[i];
        if (index >= 0 && result[index] - 12 >= 0) result[index] -= 12;
    }
    return uniqueSorted(result);
}

function guitarVoicing(notes) {
    var source = uniqueSorted(notes);
    var chordClasses = pitchClassesFor(source, false);
    if (!chordClasses.length) return [];

    // Accordage standard E2 A2 D3 G3 B3 E4. Une recherche par faisceau garde
    // les meilleures positions dans des fenêtres jouables de quatre frettes.
    var tuning = [40, 45, 50, 55, 59, 64];
    var best = [];
    var bestScore = 999999;
    var beamWidth = 96;

    function roleWeight(noteClass) {
        var role = currentRoles[noteClass];
        if (role === ROLE_ROOT) return 40;
        if (role === ROLE_THIRD || role === ROLE_FOURTH) return 30;
        if (role === ROLE_SEVENTH) return 24;
        if (role === ROLE_FIFTH) return 10;
        return 16;
    }

    function partialGuitarScore(state) {
        var coverageReward = 0;
        for (var noteClass in state.covered) {
            if (state.covered.hasOwnProperty(noteClass)) coverageReward += roleWeight(parseInt(noteClass, 10));
        }
        var minFret = state.frets.length ? Math.min.apply(null, state.frets) : 0;
        var maxFret = state.frets.length ? Math.max.apply(null, state.frets) : 0;
        var bassPenalty = state.notes.length && getRole(state.notes[0]) !== ROLE_ROOT ? 35 : 0;
        return -coverageReward * 10 + bassPenalty + (maxFret - minFret) * 4 +
            minFret * 2 - state.notes.length * 3;
    }

    function finalGuitarScore(state) {
        if (state.notes.length < Math.min(3, chordClasses.length)) return 999999;
        var missingPenalty = 0;
        for (var i = 0; i < chordClasses.length; i++) {
            if (!state.covered[chordClasses[i]]) missingPenalty += roleWeight(chordClasses[i]);
        }
        return missingPenalty * 100 + partialGuitarScore(state);
    }

    function searchWindow(windowStart) {
        var states = [{notes:[], covered:{}, frets:[]}];
        for (var stringIndex = 0; stringIndex < tuning.length; stringIndex++) {
            var options = [-1];
            if (chordClasses.indexOf(normalizedNoteClass(tuning[stringIndex])) >= 0) {
                options.push(tuning[stringIndex]);
            }
            for (var fret = Math.max(1, windowStart); fret <= Math.min(12, windowStart + 4); fret++) {
                if (chordClasses.indexOf(normalizedNoteClass(tuning[stringIndex] + fret)) >= 0) {
                    options.push(tuning[stringIndex] + fret);
                }
            }

            var nextStates = [];
            for (var stateIndex = 0; stateIndex < states.length; stateIndex++) {
                for (var optionIndex = 0; optionIndex < options.length; optionIndex++) {
                    var option = options[optionIndex];
                    var state = states[stateIndex];
                    var next = {
                        notes: state.notes.slice(),
                        covered: copyRoles(state.covered),
                        frets: state.frets.slice()
                    };
                    if (option >= 0) {
                        next.notes.push(option);
                        next.covered[normalizedNoteClass(option)] = true;
                        var selectedFret = option - tuning[stringIndex];
                        if (selectedFret > 0) next.frets.push(selectedFret);
                    }
                    next.score = partialGuitarScore(next);
                    nextStates.push(next);
                }
            }
            nextStates.sort(function(a, b) { return a.score - b.score; });
            states = nextStates.slice(0, beamWidth);
        }

        for (var i = 0; i < states.length; i++) {
            var score = finalGuitarScore(states[i]);
            if (score < bestScore) {
                bestScore = score;
                best = states[i].notes.slice();
            }
        }
    }

    for (var windowStart = 0; windowStart <= 8; windowStart++) searchWindow(windowStart);
    return uniqueSorted(best);
}

// Sans Voice Grouping, conserver l'accord compact en position fondamentale
// dans l'octave C2-B2 de Scaler (C3=60). Exemple : C majeur -> C2 E2 G2.
// Register reste applique ensuite, comme pour tous les autres profils.
function noVoiceGrouping(notes) {
    var source = uniqueSorted(notes);
    var result = [];
    for (var i = 0; i < source.length; i++) result.push(source[i] - 12);
    return uniqueSorted(result);
}

function voicingLockFallbackClass(sourceClasses, desired) {
    var bestClass = sourceClasses.length ? sourceClasses[0] : 0;
    var bestDistance = 999;
    for (var i = 0; i < sourceClasses.length; i++) {
        var candidate = nearestPitchClass(sourceClasses[i], desired, 0, 127);
        var distance = Math.abs(candidate - desired);
        if (distance < bestDistance) {
            bestClass = sourceClasses[i];
            bestDistance = distance;
        }
    }
    return bestClass;
}

function voicingLockPitch(noteClass, desired, minimum) {
    var choices = notesForPitchClass(noteClass, Math.max(0, minimum), 127);
    if (!choices.length) choices = notesForPitchClass(noteClass, 0, 127);
    if (!choices.length) return Math.max(0, Math.min(127, Math.round(desired)));
    var best = choices[0];
    var bestDistance = Math.abs(best - desired);
    for (var i = 1; i < choices.length; i++) {
        var distance = Math.abs(choices[i] - desired);
        if (distance < bestDistance) {
            best = choices[i];
            bestDistance = distance;
        }
    }
    return best;
}

function voicingLockVoicing(notes) {
    var source = uniqueSorted(notes);
    if (!source.length || !voicingLockTemplate.length) return source;

    var sourceClasses = pitchClassesFor(source, false);
    var rootClass = rootClassFor(source);
    var targetRoot = nearestPitchClass(rootClass, voicingLockRootNote, 0, 127);
    var result = [];
    var previous = -1;

    for (var i = 0; i < voicingLockTemplate.length; i++) {
        var voice = voicingLockTemplate[i];
        var desired = targetRoot + voice.offset;
        var targetClass = noteClassForRole(voice.role, -1);
        if (targetClass < 0 || sourceClasses.indexOf(targetClass) < 0) {
            targetClass = voicingLockFallbackClass(sourceClasses, desired);
        }
        var candidate = voicingLockPitch(targetClass, desired, previous + 1);
        result.push(candidate);
        previous = candidate;
    }
    return uniqueSorted(result);
}

function voicingLockCaptureSource() {
    if (activeGroupedNotes.length) return uniqueSorted(activeGroupedNotes);
    if (!currentPool.length) return [];

    var harmonicNotes = compactChordVoicing(currentPool);
    if (currentSpread === 11) return harmonicNotes;
    var groupingSource = (currentSpread >= 1 && currentSpread <= 2) ?
        harmonicNotes : applyInversion(harmonicNotes);
    return uniqueSorted(applyVoiceGrouping(groupingSource));
}

function midiNoteName(note) {
    var names = ['C','C#','D','D#','E','F','F#','G','G#','A','A#','B'];
    return names[normalizedNoteClass(note)] + (Math.floor(note / 12) - 2);
}

function voicingLockSummary(notes) {
    var result = [];
    for (var i = 0; i < notes.length; i++) result.push(midiNoteName(notes[i]));
    return result.join(' ');
}

function updateVoicingLockUI() {
    if (!this.patcher || !this.patcher.getnamed) return;
    var locked = currentSpread === 11 && voicingLockTemplate.length > 0;
    var button = this.patcher.getnamed('pad_voicing_lock_button');
    if (button) button.message('set', locked ? 'Clear Lock' : 'Extract Voicing');
    var inversionMenu = this.patcher.getnamed('pad_inversion_menu');
    if (inversionMenu) {
        inversionMenu.message('ignoreclick', locked ? 1 : 0);
        inversionMenu.message('set', currentInversion);
    }
}

function captureVoicingLock() {
    var template = voicingLockCaptureSource();
    if (!template.length) {
        post('Voicing Lock: aucun accord à extraire\n');
        return false;
    }

    voicingLockSourceProfile = currentSpread === 11 ? 0 : currentSpread;
    voicingLockPreviousInversion = currentInversion;

    var rootNote = -1;
    for (var i = 0; i < template.length; i++) {
        if (getRole(template[i]) === ROLE_ROOT) {
            rootNote = template[i];
            break;
        }
    }
    if (rootNote < 0) rootNote = template[0];

    voicingLockRootNote = rootNote;
    voicingLockTemplate = [];
    for (var j = 0; j < template.length; j++) {
        voicingLockTemplate.push({
            role: getRole(template[j]),
            offset: template[j] - rootNote
        });
    }

    currentSpread = 11;
    currentInversion = 0;
    pendingControls.spread = currentSpread;
    pendingControls.spreadDirty = false;
    configureVoiceGroupingMenu.call(this);
    updateVoicingLockUI.call(this);
    messnamed('pad_spread', currentSpread);
    messnamed('pad_inversion', currentInversion);
    post('Voicing Lock: ' + voicingLockSummary(template) + '\n');
    if (isRunning) buildPad(true);
    return true;
}

function deactivateVoicingLock(nextProfile) {
    currentSpread = nextProfile;
    currentInversion = voicingLockPreviousInversion;
    pendingControls.spread = currentSpread;
    pendingControls.spreadDirty = false;
    configureVoiceGroupingMenu.call(this);
    updateVoicingLockUI.call(this);
    messnamed('pad_inversion', currentInversion);
}

function clearVoicingLock() {
    var nextProfile = voicingLockSourceProfile === 11 ? 0 : voicingLockSourceProfile;
    voicingLockTemplate = [];
    voicingLockRootNote = 60;
    deactivateVoicingLock(nextProfile);
    messnamed('pad_spread', currentSpread);
    if (isRunning) buildPad(true);
}

function voicing_lock_toggle() {
    if (currentSpread === 11 && voicingLockTemplate.length) clearVoicingLock.call(this);
    else captureVoicingLock.call(this);
}

function applyVoiceGrouping(notes) {
    switch (currentSpread) {
        case 0:  return noVoiceGrouping(notes);
        case 1:  return dynamicVoicing(notes);
        case 2:  return groupingVoicing(notes, 36, 59, 2); // plage de base, transposée par Register
        case 3:  return openVoicing(notes, 1);
        case 4:  return openVoicing(notes, 2);
        case 5:  return openVoicing(notes, 3);
        case 6:  return guitarVoicing(notes);
        case 7:  return dropVoicing(notes, [2]);
        case 8:  return dropVoicing(notes, [3]);
        case 9:  return dropVoicing(notes, [4]);
        case 10: return dropVoicing(notes, [2, 3]);
        case 11: return voicingLockVoicing(notes);
    }
    return notes;
}

function rotateVoices(notes, count) {
    var result = uniqueSorted(notes);
    for (var i = 0; i < count && result.length > 1; i++) {
        var raised = result.shift() + 12;
        if (raised <= 127) result.push(raised);
    }
    return uniqueSorted(result);
}

// Reconstruit une seule occurrence de chaque note harmonique en position
// fondamentale. Aucun ancien controle Range ne limite plus l'accord source.
function compactChordVoicing(notes) {
    var source = uniqueSorted(notes);
    if (!source.length) return source;

    var rootClass = rootClassFor(source);
    // Position fondamentale déterministe dans C3-B3. Utiliser le milieu du
    // pool 0-127 faisait basculer A et B dans l'octave inférieure à cause des
    // limites asymétriques du clavier MIDI.
    var root = 60 + rootClass;
    var noteClasses = {};
    for (var i = 0; i < source.length; i++) {
        noteClasses[source[i] % 12] = true;
    }

    var result = [];
    for (var key in noteClasses) {
        if (!noteClasses.hasOwnProperty(key)) continue;
        var interval = (parseInt(key, 10) - rootClass + 12) % 12;
        result.push(root + interval);
    }
    result = uniqueSorted(result);

    while (result.length && result[result.length - 1] > 127) {
        for (var j = 0; j < result.length; j++) result[j] -= 12;
    }
    while (result.length && result[0] < 0) {
        for (var k = 0; k < result.length; k++) result[k] += 12;
    }
    return uniqueSorted(result);
}

function noteClassForRole(role, fallback) {
    for (var noteClass in currentRoles) {
        if (currentRoles.hasOwnProperty(noteClass) && currentRoles[noteClass] === role) {
            return parseInt(noteClass, 10);
        }
    }
    return fallback;
}

// Voicing Scaler "7ths Inverted" : fondamentale en doubles octaves graves,
// puis quinte et septieme sous la fondamentale, tierce au-dessus.
function seventhsInverted(notes) {
    var source = uniqueSorted(notes);
    if (!source.length) return source;
    var rootClass = rootClassFor(source);
    var center = (source[0] + source[source.length - 1]) / 2;
    var root = nearestPitchClass(rootClass, center, 36, 96);
    var thirdClass = noteClassForRole(ROLE_THIRD, source[Math.min(1, source.length - 1)] % 12);
    var fifthClass = noteClassForRole(ROLE_FIFTH, source[Math.min(2, source.length - 1)] % 12);
    var seventhClass = noteClassForRole(ROLE_SEVENTH, source[source.length - 1] % 12);
    return uniqueSorted([
        root - 24,
        root - 12,
        nearestPitchClass(fifthClass, root - 5, 0, 127),
        nearestPitchClass(seventhClass, root - 1, 0, 127),
        nearestPitchClass(thirdClass, root + 4, 0, 127)
    ]);
}

// Reprend le dessin du preset Scaler : fondamentale sur trois octaves et
// tierce de l'accord entre les deux voix superieures.
function octavesAndInvertedThirds(notes) {
    var source = uniqueSorted(notes);
    if (!source.length) return source;
    var rootClass = rootClassFor(source);
    var center = (source[0] + source[source.length - 1]) / 2;
    var root = nearestPitchClass(rootClass, center, 36, 96);
    var thirdClass = noteClassForRole(ROLE_THIRD, source[Math.min(1, source.length - 1)] % 12);
    return uniqueSorted([
        root - 24,
        root - 12,
        nearestPitchClass(thirdClass, root + 4, 0, 127),
        root + 12
    ]);
}

function applyInversion(notes) {
    var source = uniqueSorted(notes);
    if (currentInversion === 0) return source;

    var compact = compactChordVoicing(notes);
    switch (currentInversion) {
        case 1: return rotateVoices(compact, 1);
        case 2: return rotateVoices(compact, 2);
        case 3: return dropVoicing(compact, [2]);
        case 4: return dropVoicing(compact, [2, 3]);
        case 5: return seventhsInverted(compact);
        case 6: return octavesAndInvertedThirds(compact);
    }
    return compact;
}

// Register intervient en toute derniere etape : il ne change ni l'inversion,
// ni le choix des voix effectue par Voice Grouping.
function applyRegister(notes) {
    var shift = currentRegister * 12;
    var shifted = [];
    for (var i = 0; i < notes.length; i++) shifted.push(notes[i] + shift);
    return uniqueSorted(shifted);
}

function buildPad(forceRetrigger) {
    if (!isRunning) return;
    if (currentPool.length === 0) return;

    // 1. Accord harmonique complet, sans fenetre Range.
    var harmonicNotes = compactChordVoicing(currentPool);

    // 2. Dynamic, Grouping et Voicing Lock déterminent eux-mêmes la disposition.
    // Les autres profils reçoivent l'inversion manuelle.
    var groupingSource = ((currentSpread >= 1 && currentSpread <= 2) || currentSpread === 11) ?
        harmonicNotes : applyInversion(harmonicNotes);
    var groupedNotes = applyVoiceGrouping(groupingSource);

    // 3. Register transpose uniquement le resultat final par octaves.
    var newNotes = applyRegister(groupedNotes);
    activeGroupedNotes = groupedNotes.slice();

    // 4. Calculer toStop et toPlay
    var previousNotes = activeNotes.slice();
    var toStop = [];
    var toPlay = [];

    if (forceRetrigger) {
        // Un changement de pool/type d'accord doit réarticuler l'accord
        // complet. Ne jouer que la différence entre les deux accords laisse
        // souvent une seule note à strummer, car leurs notes se recouvrent.
        toStop = previousNotes.slice();
        toPlay = newNotes.slice();
    } else {
        for (var k = 0; k < previousNotes.length; k++) {
            if (newNotes.indexOf(previousNotes[k]) === -1) {
                toStop.push(previousNotes[k]);
            }
        }

        for (var l = 0; l < newNotes.length; l++) {
            if (previousNotes.indexOf(newNotes[l]) === -1) {
                toPlay.push(newNotes[l]);
            }
        }
    }

    // 6. Mettre à jour les notes actives
    activeNotes = newNotes;

    // 7. Annuler les tâches strum en cours — uniquement si les notes changent réellement.
    // Sinon, un mod_matrix qui module en continu un paramètre du pad (position, range,
    // spread...) appelle buildPad() à ~25Hz et annulerait systématiquement les notes
    // de strum programmées avant qu'elles ne se déclenchent.
    if (toStop.length > 0 || toPlay.length > 0) {
        cancelStrumTasks();
    }

    // 8. NoteOff toujours immédiat
    for (var m = 0; m < toStop.length; m++) {
        releaseNote(toStop[m],
            channelForVoice(Math.max(0, previousNotes.indexOf(toStop[m]))));
    }

    // 9. NoteOn avec ou sans strum
    if (toPlay.length > 0) {
        var delay = getStrumDelay();
        var retriggerGap = forceRetrigger && previousNotes.length > 0 ? RETRIGGER_GAP_MS : 0;
        var channels = [];
        for (var p = 0; p < toPlay.length; p++) {
            channels.push(channelForVoice(Math.max(0, newNotes.indexOf(toPlay[p]))));
        }

        if (delay === 0 && retriggerGap === 0) {
            playChordNotes(toPlay, currentVel, channels);
        } else if (delay === 0) {
            scheduleChordNotes(toPlay, currentVel, channels, retriggerGap);
        } else if (strumGrouped) {
            var groupedCount = Math.min(3, toPlay.length);
            scheduleChordNotes(toPlay.slice(0, groupedCount), currentVel,
                channels.slice(0, groupedCount), retriggerGap);
            for (var n = groupedCount; n < toPlay.length; n++) {
                var groupedTask = new Task(playStrumNote, this, toPlay[n], currentVel, channels[n]);
                groupedTask.schedule(retriggerGap + (n - groupedCount + 1) * delay);
                strumTasks.push(groupedTask);
            }
        } else {
            for (var s = 0; s < toPlay.length; s++) {
                var strumTask = new Task(playStrumNote, this, toPlay[s], currentVel, channels[s]);
                strumTask.schedule(retriggerGap + s * delay);
                strumTasks.push(strumTask);
            }
        }
    }
}

function pool() {
    var nextPool = arrayfromargs(arguments).filter(function(x) {
        return typeof x === "number";
    });
    if (currentPadQuant > 0 && isRunning) {
        pendingPool = nextPool;
        pendingRoles = copyRoles(stagedRoles);
        pendingTonalCenter = stagedTonalCenter;
        return;
    }
    currentPool = nextPool;
    currentRoles = copyRoles(stagedRoles);
    currentTonalCenter = stagedTonalCenter;
    buildPad(true);
}

function copyRoles(source) {
    var result = {};
    for (var key in source) if (source.hasOwnProperty(key)) result[key] = source[key];
    return result;
}

// Réception des rôles : paires successives [noteClass, role, ...]
function roles() {
    var args = arrayfromargs(arguments).filter(function(x) {
        return typeof x === "number";
    });
    stagedRoles = {};
    for (var i = 0; i < args.length - 1; i += 2) {
        if (args[i] === -1) stagedTonalCenter = args[i + 1];
        else stagedRoles[args[i]] = args[i + 1];
    }
    // chord_builder émet toujours roles avant pool. Le pool qui suit est
    // l'unique déclencheur de reconstruction : sinon deux rebuilds successifs
    // annulent les Task du strum avant qu'elles aient pu jouer.
}

function register(v) {
    currentRegister = Math.max(-2, Math.min(2, Math.round(v)));
    buildPad();
}

function register_select(v) {
    register(v);
    messnamed('pad_register', currentRegister);
}

function strum_on(v) {
    strumEnabled = v ? true : false;
}

function strum(v) {
    var legacyMode = Math.max(1, Math.min(7, Math.round(v)));
    strumEnabled = legacyMode !== 1;
    strumGrouped = legacyMode === 5 || legacyMode === 7;
    if (legacyMode === 2) currentStrumDiv = 17;      // 32n
    else if (legacyMode === 3) currentStrumDiv = 14; // 16n
    else if (legacyMode === 4 || legacyMode === 5) currentStrumDiv = 12; // 8nt
    else if (legacyMode === 6 || legacyMode === 7) currentStrumDiv = 11; // 8n
}

function strum_div(v) {
    currentStrumDiv = Math.max(1, Math.min(CLK_DIVISIONS.length, Math.round(v)));
}

function strum_group(v) {
    strumGrouped = v ? true : false;
}

function readClockDivisions() {
    // Table CLK_DIVISIONS hardcodée — plus de fichier externe nécessaire.
}

function configureStrumMenu() {
    if (!this.patcher || !this.patcher.getnamed) return;
    var menu = this.patcher.getnamed('pad_strum_div_menu');
    if (!menu) return;
    menu.message('clear');
    for (var i = 0; i < CLK_DIVISIONS.length; i++) menu.message('append', CLK_DIVISIONS[i].label);
    menu.message('set', currentStrumDiv - 1);
}

function configureVoiceGroupingMenu() {
    if (!this.patcher || !this.patcher.getnamed) return;
    var menu = this.patcher.getnamed('pad_voice_grouping_ui');
    if (!menu) return;
    menu.message('clear');
    for (var i = 0; i < VOICE_GROUPING_PROFILES.length; i++) {
        menu.message('append', VOICE_GROUPING_PROFILES[i]);
    }
    menu.message('set', currentSpread);
}

function configureInversionMenu() {
    if (!this.patcher || !this.patcher.getnamed) return;
    var menu = this.patcher.getnamed('pad_inversion_menu');
    if (!menu) return;
    menu.message('clear');
    for (var i = 0; i < INVERSION_PROFILES.length; i++) {
        menu.message('append', INVERSION_PROFILES[i]);
    }
    menu.message('set', currentInversion);
}

function loadbang() {
    readClockDivisions();
    configureStrumMenu.call(this);
    configureVoiceGroupingMenu.call(this);
    configureInversionMenu.call(this);
    updateVoicingLockUI.call(this);
    messnamed('mod_input', 'part_active', 'pad', 0);
}

function spread(v) {
    var nextProfile = Math.max(0, Math.min(VOICE_GROUPING_PROFILES.length - 1, Math.round(v)));

    if (nextProfile === 11) {
        if (!voicingLockTemplate.length) {
            captureVoicingLock.call(this);
            return;
        }
        if (currentSpread !== 11) {
            voicingLockSourceProfile = currentSpread;
            voicingLockPreviousInversion = currentInversion;
        }
        currentSpread = 11;
        currentInversion = 0;
        pendingControls.spread = currentSpread;
        pendingControls.spreadDirty = false;
        updateVoicingLockUI.call(this);
        messnamed('pad_inversion', currentInversion);
        buildPad();
        return;
    }

    if (currentSpread === 11) deactivateVoicingLock.call(this, nextProfile);
    else {
        currentSpread = nextProfile;
        pendingControls.spread = currentSpread;
        pendingControls.spreadDirty = false;
        updateVoicingLockUI.call(this);
    }
    buildPad();
}

// Nouveau nom explicite, tout en conservant spread() pour les anciens patchers.
function voice_grouping(v) { spread(v); }

// Le umenu est un controle discret : valider immediatement la selection et
// publier sa valeur de base, sans attendre le mouse-up utilise par les sliders.
function voice_grouping_select(v) {
    spread(v);
    messnamed('pad_spread', currentSpread);
}

function polychain(v) {
    currentPolyChain = Math.max(1, Math.min(4, Math.round(v)));
    if (isRunning) buildPad(true);
}

function channel(v) {
    currentChannel = Math.max(1, Math.min(16, Math.round(v)));
}

function inversion(v) {
    var nextInversion = Math.max(0, Math.min(6, Math.round(v)));

    // Le renversement est déjà inclus dans le modèle extrait. Pendant le
    // verrouillage, l'interface reste donc sur No Inversion.
    if (currentSpread === 11 && voicingLockTemplate.length) {
        currentInversion = 0;
        updateVoicingLockUI.call(this);
        if (nextInversion !== 0) messnamed('pad_inversion', 0);
        return;
    }

    if (nextInversion !== currentInversion) {
        currentInversion = nextInversion;
        dynamicVoicingHistory[1] = [];
        dynamicVoicingHistory[2] = [];
    }
    if (isRunning) buildPad(true);
}

function chord_invert(v) {
    if (v) inversion(1);
}

function pad_quant(v) {
    currentPadQuant = Math.max(0, Math.min(2, Math.round(v)));
    messnamed('pad_quant_value', currentPadQuant);
    if (currentPadQuant === 0 && pendingPool) commitPendingPool();
}

function commitPendingPool() {
    if (!pendingPool) return;
    currentPool = pendingPool;
    if (pendingRoles) currentRoles = pendingRoles;
    if (pendingTonalCenter !== null) currentTonalCenter = pendingTonalCenter;
    pendingPool = null;
    pendingRoles = null;
    pendingTonalCenter = null;
    buildPad(true);
}

function beat() {
    quantTick++;
    if (!pendingPool || currentPadQuant === 0) return;
    var grid = currentPadQuant === 1 ? 96 : 48;
    if (quantTick % grid === 0) commitPendingPool();
}

function tempo(v) {
    currentTempo = Math.max(10, Math.min(300, v));
}

function vel(v) {
    currentVel = Math.max(0, Math.min(127, Math.round(v)));
    pendingControls.vel = currentVel;
    pendingControls.velDirty = false;
}

function spread_preview(v) {
    pendingControls.spread = Math.max(0, Math.min(VOICE_GROUPING_PROFILES.length - 1, Math.round(v)));
    pendingControls.spreadDirty = pendingControls.spread !== currentSpread;
}

function voice_grouping_preview(v) { spread_preview(v); }

function vel_preview(v) {
    pendingControls.vel = Math.max(0, Math.min(127, Math.round(v)));
    pendingControls.velDirty = pendingControls.vel !== currentVel;
}

// Valide ensemble les contrôles modifiés lorsque le bouton de souris est relâché.
function controls_release() {
    var rebuild = false;
    if (pendingControls.spreadDirty) {
        var requestedSpread = pendingControls.spread;
        pendingControls.spreadDirty = false;
        spread.call(this, requestedSpread);
        messnamed('pad_spread', currentSpread);
        rebuild = false;
    }
    if (pendingControls.velDirty) {
        currentVel = pendingControls.vel;
        pendingControls.velDirty = false;
        messnamed('pad_vel', currentVel);
    }
    if (rebuild) buildPad();
}

function start() {
    isEnabled = true;
    // Le bouton local arme le Pad ; seul le transport global l'autorise a jouer.
    isRunning = globalTransportRunning;
    messnamed('mod_input', 'part_active', 'pad', 1);
    if (globalTransportRunning) {
        buildPad(true);
    }
}

function stop() {
    isEnabled = false;
    isRunning = false;
    messnamed('mod_input', 'part_active', 'pad', 0);
    allnotesoff();
}

function on(v) {
    if (v) start();
    else stop();
}

// ── Synchro horloge externe (MIDI Start/Stop) ───────────────────────────────
// Appelé sur Stop MIDI : coupe le son sans changer l'état du bouton on/off
// (isEnabled), pour pouvoir redémarrer instantanément sur le prochain Start.
function transportstop() {
    globalTransportRunning = false;
    isRunning = false;
    quantTick = 0;
    allnotesoff();
}

// Appelé sur Start MIDI : ne (re)démarre que si le module est activé
// (isEnabled, via son bouton on/off local).
function transportstart() {
    globalTransportRunning = true;
    quantTick = 0;
    if (!isEnabled) return;
    isRunning = true;
    buildPad(true);
}

function allnotesoff() {
    cancelStrumTasks();
    if (activeNotes.length > 0) {
        for (var i = 0; i < activeNotes.length; i++) {
            releaseNote(activeNotes[i], channelForVoice(i));
        }
        activeNotes = [];
    }
    activeGroupedNotes = [];
}
