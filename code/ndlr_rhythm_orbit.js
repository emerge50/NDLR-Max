// ndlr_rhythm_orbit.js — Roue de rythme circulaire pour [jsui]
// ─────────────────────────────────────────────────────────────────
// Affiche jusqu'a MAX_STEPS pas disposes en cercle. Chaque pas est un noeud
// colore (NOTE / REST / TIE) dont la spoke indique la velocite (longueur)
// et le ratchet (segmentation en N sous-traits).
//
// ── INLETS ───────────────────────────────────────────────────────
// Inlet 0 — etat du rythme (depuis motif_builder.js) :
//   rhythm s1 ... sN          Liste complete : 0=REST, 1=NOTE, 2=TIE
//   rhythm_step index state   Mise a jour d'un seul pas (1-based)
//   rhythm_len 1..32          Nombre de pas affiches
//   rhythm_mode 0|1           0=normal, 1=euclidien (Bjorklund local)
//   euclid_pulses 1..32       Nombre de frappes en mode euclidien
//   euclid_rotate 0..31       Decalage de rotation (mode euclidien seulement)
//   rhythm_ratchet v1..vN     Ratchet de tous les pas (1-4 coups par pas)
//   rhythm_step_ratchet i v   Ratchet d'un seul pas
//   rhythm_rate 0..20         Index de division : 0=1nd … 7=4n … 20=128n
//   rhythm_ratchet_vel_mode v Mode de velocite ratchet : 0== 1=croissant 2=decroissant
//
// Inlet 1 — velocites :
//   rhythm_vel v1 ... vN      Velocites de tous les pas (0-127)
//   rhythm_step_vel index v   Velocite d'un seul pas
//   list v1..vN               Alias de rhythm_vel
//
// Inlet 2 — navigation (lecture + selection) :
//   beat index                Tete de lecture (1-based, 0=arretee)
//   selected index            Pas selectionne (1-based)
//
// ── OUTLETS ──────────────────────────────────────────────────────
// Outlet 0 — edition (compatible motif_builder.js) :
//   rhythm_step index state
//   rhythm_step_vel index value
//   rhythm_step_ratchet index value
//   rhythm_rate index
//   rhythm_ratchet_vel_mode value
//   rhythm_len / rhythm_mode / euclid_pulses / euclid_rotate
//
// Outlet 1 — retour interface : "selected index state velocity"
//
// ── INTERACTIONS SOURIS ──────────────────────────────────────────
// Clic sur un noeud          : selectionne ce pas
// Glisser vers le centre     : regle la velocite du pas selectionne
// Shift + clic               : cycle etat NOTE -> REST -> TIE -> NOTE
// Option/Alt + clic noeud    : cycle ratchet 1 -> 2 -> 3 -> 4 -> 1
// Centre : clic/Shift+clic   : division suivante/precedente
// Centre : glisser vertical  : parcourir rapidement les divisions
// Centre : molette           : division suivante/precedente
// Option/Alt + clic centre   : cycle mode velocite ratchet = / ↗ / ↘

autowatch = 1;
inlets = 3;
outlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var MAX_STEPS = 32;
// Même état initial que RHYTHM_PRESETS[1] dans motif_builder.js. Le dumpstate
// différé du motif sélectionné prend ensuite le relais comme source de vérité.
var states = [1,1,1,1,1,1,1,1];
var velocities = [100,100,100,100,100,100,100,100];
while (states.length < MAX_STEPS) states.push(1);
while (velocities.length < MAX_STEPS) velocities.push(100);
// NOTE ROTATE : la roue est un simple AFFICHEUR pour le mode normal — c'est
// motif_builder.js (le moteur, seule source de verite pour le pattern joue)
// qui calcule la rotation et repousse "rhythm"/"rhythm_vel" deja tournes vers
// la roue. La roue ne doit PAS retourner une seconde fois ce contenu (cf. bug
// "tous les nodes ne suivent pas" : double rotation roue+moteur). En mode
// euclidien, la roue garde son propre recalcul local (refreshEuclid) : c'est
// un calcul pur/deterministe (Bjorklund), donc rejouer le meme calcul que le
// moteur en parallele est sans danger (resultat identique, idempotent).
var rotateAmt = 0; // utilise uniquement par refreshEuclid() (mode euclidien)
var rhythmLength = 8;
var rhythmMode = 0;
var euclidPulses = 4;
var selectedStep = 0;
var playhead = -1;
var dragStep = -1;
var centerDrag = false;
var centerDragY = 0;
var centerDragIdx = 7;
var centerDragChanged = false;
var centerClickReverse = false;

var ratchets = [];
while (ratchets.length < MAX_STEPS) ratchets.push(1);

// Division musicale (identique a motif_builder.js)
var rhythmRateIdx = 7;   // défaut : 4n (noire)
var RATE_LABELS = [
    '1nd','1n','1nt','2nd','2n','2nt','4nd','4n','4nt','8nd','8n','8nt',
    '16nd','16n','16nt','32nd','32n','32nt','64nd','64n','128n'
];

// Mode de velocite ratchet : 0=egale  1=croissante (↗)  2=decroissante (↘)
var ratchetVelMode = 0;
var RATCHET_VEL_LABELS = ['=', '↗', '↘'];  // = ↗ ↘

var C = {
    bg:[0.015,0.022,0.023,0],
    ring:[0.12,0.23,0.24,1],
    spoke:[0.00,0.50,0.88,0.85],
    note:[0.00,0.65,1.00,1],
    tie:[0.00,0.90,0.38,1],
    rest:[1.00,0.05,0.08,1],
    select:[0.96,1.00,0.00,1],
    play:[0.95,1.00,0.98,0.25]
};

function clamp(v, lo, hi) { return Math.max(lo, Math.min(hi, v)); }
function rgba(c) { mgraphics.set_source_rgba(c[0],c[1],c[2],c[3]); }

function drawLine(x1,y1,x2,y2,c,w) {
    rgba(c); mgraphics.set_line_width(w || 1);
    mgraphics.move_to(x1,y1); mgraphics.line_to(x2,y2); mgraphics.stroke();
}

function drawCircle(x,y,r,c,stroke) {
    rgba(c); mgraphics.ellipse(x-r,y-r,r*2,r*2);
    if (stroke) { mgraphics.set_line_width(stroke); mgraphics.stroke(); }
    else mgraphics.fill();
}

function geom() {
    var w = box.rect[2]-box.rect[0];
    var h = box.rect[3]-box.rect[1];
    return {w:w,h:h,cx:w*0.5,cy:h*0.5,r:Math.max(15,Math.min(w,h)*0.43)};
}

function anchor(index,g) {
    var a = -Math.PI*0.5 + index/rhythmLength*Math.PI*2;
    return {x:g.cx+Math.cos(a)*g.r,y:g.cy+Math.sin(a)*g.r,a:a};
}

function innerEnd(index,g) {
    var p = anchor(index,g);
    var span = g.r*0.70;
    var len = velocities[index]/127*span;
    return {x:p.x-Math.cos(p.a)*len,y:p.y-Math.sin(p.a)*len};
}

function colorFor(index) {
    if (index === selectedStep) return C.select;
    if (states[index] === 0) return C.rest;
    if (states[index] === 2) return C.tie;
    return C.note;
}

function paint() {
    var g=geom(), i, p, e, prev;
    rgba(C.bg); mgraphics.rectangle(0,0,g.w,g.h); mgraphics.fill();
    drawCircle(g.cx,g.cy,g.r,C.ring,1);

    for (i=0;i<rhythmLength;i++) {
        p=anchor(i,g);

        if (states[i]===1) {
            // Spoke segmente : N tranches de 80% remplies + 20% de gap par ratchet
            e=innerEnd(i,g);
            var n=ratchets[i]||1;
            var dx=e.x-p.x, dy=e.y-p.y;
            var lw=i===selectedStep?3:2;
            var col=i===selectedStep?C.select:C.spoke;
            if (n<=1) {
                drawLine(p.x,p.y,e.x,e.y,col,lw);
            } else {
                var seg=1.0/n, fill=seg*0.80, j;
                for (j=0;j<n;j++) {
                    var t0=j*seg, t1=t0+fill;
                    drawLine(p.x+dx*t0,p.y+dy*t0,p.x+dx*t1,p.y+dy*t1,col,lw);
                }
            }
        } else if (states[i]===2) {
            // Le TIE relie ce beat au precedent, comme dans le manuel NDLR.
            prev=anchor((i-1+rhythmLength)%rhythmLength,g);
            drawLine(prev.x,prev.y,p.x,p.y,i===selectedStep?C.select:C.tie,i===selectedStep?3:2);
        }

        if (playhead===i) drawCircle(p.x,p.y,10,C.play,0);
        drawCircle(p.x,p.y,i===selectedStep?7:5.5,colorFor(i),0);
        if (i===selectedStep) drawCircle(p.x,p.y,2,[1,1,1,1],0);
    }

    // Centre : cercle cliquable, division (haut) + mode vel ratchet (bas)
    drawCircle(g.cx,g.cy,22,C.tie,1);
    mgraphics.select_font_face('Arial');
    rgba(C.tie);
    // Division : ligne du haut
    var rLabel = RATE_LABELS[rhythmRateIdx] || '4n';
    mgraphics.set_font_size(13);
    var te = mgraphics.text_measure(rLabel);
    mgraphics.move_to(g.cx - (te[0]||0)*0.5, g.cy);
    mgraphics.show_text(rLabel);
    // Mode vel ratchet : ligne du bas (plus petit)
    var vLabel = RATCHET_VEL_LABELS[ratchetVelMode] || '=';
    mgraphics.set_font_size(11);
    var ve = mgraphics.text_measure(vLabel);
    mgraphics.move_to(g.cx - (ve[0]||0)*0.5, g.cy + 13);
    mgraphics.show_text(vLabel);
}

function nearest(x,y) {
    var g=geom(), best=-1, dBest=1e9, i, p, dx, dy, d;
    for (i=0;i<rhythmLength;i++) {
        p=anchor(i,g); dx=x-p.x; dy=y-p.y; d=dx*dx+dy*dy;
        if (d<dBest) { dBest=d; best=i; }
    }
    return dBest<625?best:-1;
}

function emitSelection(i) {
    outlet(1,"selected",i+1,states[i],velocities[i]);
}

function emitState(i) {
    outlet(0,"rhythm_step",i+1,states[i]);
    if (states[i]===1) outlet(0,"rhythm_step_vel",i+1,velocities[i]);
    emitSelection(i);
}

function velocityFromPointer(x,y,index) {
    var g=geom(), p=anchor(index,g);
    var vx=g.cx-p.x, vy=g.cy-p.y;
    var mag=Math.sqrt(vx*vx+vy*vy);
    if (mag<=0) return velocities[index];
    vx/=mag; vy/=mag;
    // Projection du pointeur sur l'axe EXTERIEUR -> CENTRE.
    // Cette projection corrige le sens des branches de la moitie inferieure.
    var projection=(x-p.x)*vx+(y-p.y)*vy;
    return clamp(Math.round(projection/(g.r*0.70)*127),1,127);
}

// Edition par clic : la roue met a jour son affichage IMMEDIATEMENT (pas
// d'attente d'aller-retour) et envoie l'edition au moteur via l'index AFFICHE
// (rhythm_step/rhythm_step_vel). C'est motif_builder.js, seul a connaitre la
// rotation courante de facon autoritaire, qui traduit cet index affiche vers
// le bon pas de base avant d'ecrire dans son pattern non tourne.
function onclick(x,y,but,cmd,shift) {
    var optionKey=arguments[6]||0;
    var g=geom();
    var dcx=x-g.cx, dcy=y-g.cy;
    // Clic au centre (rayon < 22px)
    if (dcx*dcx+dcy*dcy<484) {
        if (optionKey) {
            // Option+clic centre → cycle mode velocite ratchet = / ↗ / ↘
            ratchetVelMode = (ratchetVelMode + 1) % 3;
            outlet(0, 'rhythm_ratchet_vel_mode', ratchetVelMode);
        } else {
            // Attendre le relachement pour distinguer clic et glisser.
            dragStep = -1;
            centerDrag = true;
            centerDragY = y;
            centerDragIdx = rhythmRateIdx;
            centerDragChanged = false;
            centerClickReverse = !!shift;
        }
        mgraphics.redraw();
        return;
    }
    var i=nearest(x,y);
    if (i<0) return;
    selectedStep=i; dragStep=i;
    if (optionKey && states[i]===1) {
        // Option/Alt+clic sur NOTE → cycle ratchet 1→2→3→4→1
        ratchets[i]=(ratchets[i]%4)+1;
        outlet(0,'rhythm_step_ratchet',i+1,ratchets[i]);
        emitSelection(i);
    } else if (shift) {
        states[i]=(states[i]+1)%3;
        emitState(i);
    } else {
        emitSelection(i);
    }
    mgraphics.redraw();
}

function ondrag(x,y,but) {
    if (centerDrag) {
        if (but) {
            // 8 px par cran : assez rapide pour couvrir les 21 divisions,
            // tout en restant controlable sur un mouvement court.
            var steps=Math.round((centerDragY-y)/8);
            var next=clamp(centerDragIdx+steps,0,RATE_LABELS.length-1);
            if (next!==rhythmRateIdx) {
                rhythmRateIdx=next;
                centerDragChanged=true;
                outlet(0,'rhythm_rate',rhythmRateIdx);
                mgraphics.redraw();
            }
        } else {
            if (!centerDragChanged) {
                var direction=centerClickReverse?-1:1;
                rhythmRateIdx=(rhythmRateIdx+direction+RATE_LABELS.length)%RATE_LABELS.length;
                outlet(0,'rhythm_rate',rhythmRateIdx);
                mgraphics.redraw();
            }
            centerDrag=false;
        }
        return;
    }
    if (!but || dragStep<0 || states[dragStep]!==1) return;
    var v=velocityFromPointer(x,y,dragStep);
    if (v!==velocities[dragStep]) {
        velocities[dragStep]=v;
        outlet(0,"rhythm_step_vel",dragStep+1,v);
        emitSelection(dragStep);
        mgraphics.redraw();
    }
}

function onmousewheel(x,y,delta) {
    var g=geom(), dcx=x-g.cx, dcy=y-g.cy;
    if (dcx*dcx+dcy*dcy>=484 || delta===0) return;
    var direction=delta>0?1:-1;
    rhythmRateIdx=clamp(rhythmRateIdx+direction,0,RATE_LABELS.length-1);
    outlet(0,'rhythm_rate',rhythmRateIdx);
    mgraphics.redraw();
}

function onidleout() { dragStep=-1; centerDrag=false; }

function rhythm() {
    var a=arrayfromargs(arguments),i;
    for (i=0;i<Math.min(MAX_STEPS,a.length);i++) states[i]=clamp(Math.round(a[i]),0,2);
    mgraphics.redraw();
}

function rhythm_step(index,state) {
    var i=Math.round(index)-1;
    if (i<0 || i>=MAX_STEPS) return;
    states[i]=clamp(Math.round(state),0,2);
    mgraphics.redraw();
}

function rhythm_vel() {
    var a=arrayfromargs(arguments),i;
    for (i=0;i<Math.min(MAX_STEPS,a.length);i++) velocities[i]=clamp(Math.round(a[i]),0,127);
    mgraphics.redraw();
}

function rhythm_step_vel(index,value) {
    var i=Math.round(index)-1;
    if (i<0 || i>=MAX_STEPS) return;
    velocities[i]=clamp(Math.round(value),0,127); mgraphics.redraw();
}

function list() {
    if (inlet===0) rhythm.apply(this,arguments);
    else if (inlet===1) rhythm_vel.apply(this,arguments);
}

function rhythm_len(v) {
    rhythmLength=clamp(Math.round(v),4,MAX_STEPS);
    selectedStep=clamp(selectedStep,0,rhythmLength-1);
    // Le moteur repart du premier pas à chaque changement de Length. Effacer
    // systématiquement l'ancienne position évite un dernier dessin à l'ancien
    // index, suivi d'un saut visuel en arrière au prochain tick.
    playhead=-1;
    euclidPulses=clamp(euclidPulses,1,rhythmLength);
    rotateAmt=clamp(rotateAmt,0,rhythmLength-1);
    if (rhythmMode===1) refreshEuclid();
    mgraphics.redraw();
}

function rhythm_mode(v) {
    var next=v?1:0;
    if (next===rhythmMode) return;
    rhythmMode=next;
    if (next===1) refreshEuclid();
    // Mode normal : pas de recalcul local — motif_builder.js repousse le
    // pattern (deja correctement tourne) via "rhythm"/"rhythm_vel" juste apres.
    mgraphics.redraw();
}

function euclid_pulses(v) {
    euclidPulses=clamp(Math.round(v),1,rhythmLength);
    refreshEuclid();
    mgraphics.redraw();
}

// Rotate : en euclidien, decale localement le motif de Bjorklund affiche
// (refreshEuclid, calcul pur/idempotent). En mode normal, ne fait RIEN ici :
// c'est motif_builder.js qui calcule la rotation et repousse "rhythm"/
// "rhythm_vel" deja tournes (cf. note plus haut — eviter la double rotation).
function euclid_rotate(v) {
    rotateAmt=clamp(Math.round(v),0,rhythmLength-1);
    if (rhythmMode===1) refreshEuclid();
    mgraphics.redraw();
}

function bjorklund(steps,pulses) {
    pulses=clamp(Math.round(pulses),0,steps);
    var a=[],i;
    if (pulses===0) { for(i=0;i<steps;i++) a.push(0); return a; }
    if (pulses===steps) { for(i=0;i<steps;i++) a.push(1); return a; }
    var counts=[],remainders=[pulses],divisor=steps-pulses,level=0,pattern=[];
    while (true) {
        counts.push(Math.floor(divisor/remainders[level]));
        remainders.push(divisor%remainders[level]);
        divisor=remainders[level]; level++;
        if (remainders[level]<=1) break;
    }
    counts.push(divisor);
    function build(lvl) {
        var j;
        if (lvl===-1) pattern.push(0);
        else if (lvl===-2) pattern.push(1);
        else {
            for(j=0;j<counts[lvl];j++) build(lvl-1);
            if (remainders[lvl]!==0) build(lvl-2);
        }
    }
    build(level);
    var first=pattern.indexOf(1);
    if (first>0) pattern=pattern.slice(first).concat(pattern.slice(0,first));
    return pattern;
}

function refreshEuclid() {
    if (rhythmMode!==1) return;
    var pat=bjorklund(rhythmLength,euclidPulses);
    var n=((rotateAmt%rhythmLength)+rhythmLength)%rhythmLength;
    // Les indices de la roue avancent dans le sens horaire : une rotation
    // positive doit donc deplacer chaque beat vers un index superieur.
    var split=(rhythmLength-n)%rhythmLength;
    pat=pat.slice(split).concat(pat.slice(0,split));
    for (var i=0;i<MAX_STEPS;i++) states[i]=(i<rhythmLength)?pat[i]:0;
}

function rhythm_ratchet() {
    var a=arrayfromargs(arguments),i;
    for (i=0;i<Math.min(MAX_STEPS,a.length);i++) ratchets[i]=clamp(Math.round(a[i]),1,4);
    mgraphics.redraw();
}

function rhythm_step_ratchet(index,value) {
    var i=Math.round(index)-1;
    if (i<0||i>=MAX_STEPS) return;
    ratchets[i]=clamp(Math.round(value),1,4);
    mgraphics.redraw();
}

function rhythm_rate(v) {
    rhythmRateIdx = clamp(Math.round(v), 0, RATE_LABELS.length - 1);
    mgraphics.redraw();
}

function rhythm_ratchet_vel_mode(v) {
    ratchetVelMode = clamp(Math.round(v), 0, 2);
    mgraphics.redraw();
}

function beat(v) {
    v=Math.round(v); playhead=v<=0?-1:(v-1)%rhythmLength; mgraphics.redraw();
}

function selected(v) {
    selectedStep=clamp(Math.round(v)-1,0,rhythmLength-1);
    emitSelection(selectedStep); mgraphics.redraw();
}

function anything() {
    // Autorise les memes selecteurs prefixes utilises dans ndlr_main.
    var name=messagename.replace(/^m[12]_/,"");
    var a=arrayfromargs(arguments);
    if (name==="rhythm") rhythm.apply(this,a);
    else if (name==="rhythm_step") rhythm_step.apply(this,a);
    else if (name==="rhythm_vel") rhythm_vel.apply(this,a);
    else if (name==="rhythm_step_vel") rhythm_step_vel.apply(this,a);
    else if (name==="rhythm_len") rhythm_len.apply(this,a);
    else if (name==="rhythm_mode") rhythm_mode.apply(this,a);
    else if (name==="euclid_pulses") euclid_pulses.apply(this,a);
    else if (name==="euclid_rotate") euclid_rotate.apply(this,a);
    else if (name==="rhythm_ratchet") rhythm_ratchet.apply(this,a);
    else if (name==="rhythm_step_ratchet") rhythm_step_ratchet.apply(this,a);
    else if (name==="rhythm_rate") rhythm_rate.apply(this,a);
    else if (name==="rhythm_ratchet_vel_mode") rhythm_ratchet_vel_mode.apply(this,a);
}

function onresize() { mgraphics.redraw(); }

function getinletassist(index) {
    if (index===0) return "Etats: rhythm, rhythm_step, rhythm_len, mode euclidien";
    if (index===1) return "Velocites: rhythm_vel, rhythm_step_vel";
    return "Navigation: beat, selected";
}

function getoutletassist(index) {
    return index===0?"Edition compatible motif_builder.js":"selected index state velocity";
}
