autowatch = 1;
inlets = 1;
outlets = 1;

include("scaler_scale_data.js");

var enabled = false, midiChannel = 16;
var keyIndex = 0, modeIndex = 0;
var scaleClasses = [0,2,4,5,7,9,11];
var currentNote = 62, activeNote = -1, activeTrigger = -1;
var lowNote = 36, highNote = 84, octaveOffset = 0, followChord = false;
var chordRoot = 60;
var status = 0, data = [];
var KEY_MIDI = [0,7,2,9,4,11,6,1,8,3,10,5];

function rebuildScale() {
 var root = KEY_MIDI[Math.max(0,Math.min(11,keyIndex))], ints = scalerScaleIntervals(modeIndex);
 scaleClasses=[]; for(var i=0;i<ints.length;i++) scaleClasses.push((root+ints[i])%12);
}
function scaleNotes() {
 var a=[]; for(var n=0;n<=127;n++) if(scaleClasses.indexOf(n%12)>=0)a.push(n); return a;
}
function nearestIndex(a,n) { var bi=0,bd=999; for(var i=0;i<a.length;i++){var d=Math.abs(a[i]-n);if(d<bd){bd=d;bi=i;}} return bi; }
function wrap(n) { while(n>highNote)n-=(highNote-lowNote+1); while(n<lowNote)n+=(highNote-lowNote+1); return Math.max(0,Math.min(127,n)); }
function stopNote() { if(activeNote>=0){outlet(0,activeNote,0,midiChannel);activeNote=-1;} }
function play(note,vel,trigger) { stopNote(); activeNote=Math.max(0,Math.min(127,note)); activeTrigger=trigger; outlet(0,activeNote,vel,midiChannel); }
function stepBy(degrees,vel,trigger) {
 var notes=scaleNotes(), idx=nearestIndex(notes,currentNote), ni=Math.max(0,Math.min(notes.length-1,idx+degrees));
 currentNote=wrap(notes[ni]+octaveOffset); play(currentNote,vel,trigger);
}
function whiteInterval(note) {
 var map={48:-8,50:-7,52:-6,53:-5,55:-4,57:-3,59:-2,60:-1,62:0,64:1,65:2,67:3,69:4,71:5,72:6,74:7};
 return map[note] === undefined ? null : map[note];
}
function noteOn(note,vel) {
 var interval=whiteInterval(note);
 if(interval!==null){ if(interval===0){currentNote=followChord?chordRoot:62; play(currentNote,vel,note);} else stepBy(interval,vel,note); return; }
 if(note===61){play(currentNote,vel,note);return;}                 // C#3 repeat
 if(note===66){var r=Math.floor(Math.random()*11)-5;if(r===0)r=1;stepBy(r,vel,note);return;} // F#3 random
 if(note===58){followChord=!followChord;if(followChord)currentNote=chordRoot;return;}        // Bb2 follow chord
 if(note===70){octaveOffset-=12;return;}                         // Bb3 octave down
 if(note===73){octaveOffset+=12;return;}                         // C#4 octave up
 if(note===37){lowNote=Math.max(0,lowNote-1);return;}             // C#2 low down
 if(note===39){lowNote=Math.min(highNote-1,lowNote+1);return;}    // Eb2 low up
 if(note===42){highNote=Math.max(lowNote+1,highNote-1);return;}   // F#2 high down
 if(note===44){highNote=Math.min(127,highNote+1);return;}         // G#2 high up
}
function noteOff(note){if(note===activeTrigger){stopNote();activeTrigger=-1;}}
function enable(v){enabled=v?true:false;if(!enabled)stopNote();}
function channel(v){stopNote();midiChannel=Math.max(1,Math.min(16,Math.round(v)));}
function key(v){keyIndex=Math.max(0,Math.min(11,Math.round(v)));rebuildScale();}
function mode(v){modeIndex=Math.max(0,Math.min(SCALER_SCALE_COUNT-1,Math.round(v)));rebuildScale();}
function scale_index(v){mode(v);}
function chord(){var a=arrayfromargs(arguments);if(a.length){chordRoot=Number(a[0]);if(followChord)currentNote=chordRoot;}}
function allnotesoff(){stopNote();}
function reset(){stopNote();currentNote=followChord?chordRoot:62;octaveOffset=0;}
function msg_int(byte){
 byte=Math.max(0,Math.min(255,Math.round(byte)));
 if(byte>=0x80){if(byte>=0xF8)return;status=byte;data=[];return;}
 if(!status)return;data.push(byte);var type=status&0xF0,ch=(status&15)+1,needed=(type===0xC0||type===0xD0)?1:2;
 if(data.length<needed)return;
 if(enabled&&ch===midiChannel&&(type===0x80||type===0x90)){var note=data[0],vel=type===0x80?0:data[1];if(vel>0)noteOn(note,vel);else noteOff(note);}
 data=[];
}
function loadbang(){rebuildScale();}
