/*
ndlr_perlin_jsui.js

Visualisation jsui (Max/MSP) du "Perlin Noise Pattern Generator" du NDLR.
Illustration pedagogique non officielle, basee sur le manuel utilisateur
(chapitre "Perlin Noise Pattern Generator", p.52-54) ET sur le comportement
reel du materiel, pas sur une "course" automatique a travers le bruit :

  - Le champ de bruit et la position X/Y dans ce champ sont STATIQUES tant
    que personne ne les deplace. Comme sur le NDLR, X/Y/Zoom/SPC/RUFF/PER
    sont des encodeurs : on les tourne (ou on les module via une LFO/mod
    matrix), et le "chemin" (path) ne bouge pas par lui-meme.
  - A partir de la position courante, on obtient un pattern de N valeurs
    fixes (comme un Pattern CHORD/SCALE/CHROMATIC normal), juste calcule
    en echantillonnant le bruit a N points autour de X plutot que saisi
    a la main.
  - Ce pattern est ensuite LU pas a pas par l'horloge du Motif, exactement
    comme n'importe quel autre Pattern : chaque Motif a sa propre longueur
    (patternlen1/2, comme "Length") et sa propre division d'horloge
    (clkdiv1/2, comme "Clock Division", voir table ci-dessous). Rien de
    specifique au Perlin dans ce mecanisme de lecture.
  - L'horloge n'est PAS generee localement (pas de Task/timer interne) :
    elle suit le tick global du sequenceur ("beat", recu a 96 ppqn depuis
    l'exterieur — 96 ticks par noire), divise ensuite par clkdiv1/clkdiv2
    pour chaque Motif via la table de divisions musicales ci-dessous.
    L'avancement pas-a-pas d'un Motif ne progresse que si :
      1) le Start local de ce module (running) est actif, ET
      2) le transport global (startstop) est actif, ET
      3) ce Motif precis est active (motif1/motif2).
    Il s'arrete dès que l'une de ces trois conditions repasse a 0/faux.
    Ceci n'est visualise que sur les profils du jsui (marqueur blanc) ; il
    n'est plus emis valeur par valeur sur les outlets (voir "Sorties").

  Table des divisions d'horloge (clkdiv1/clkdiv2, index 1-21), en nombre de
  ticks "beat" (96 ppqn) par pas :
    1  1nd   576      8  4n     96      15 16nt    16
    2  1n    384      9  4nt    64      16 32nd    18
    3  1nt   256      10 8nd    72      17 32n     12
    4  2nd   288      11 8n     48      18 32nt     8
    5  2n    192      12 8nt    32      19 64nd     9
    6  2nt   128      13 16nd   36      20 64n      6
    7  4nd   144      14 16n    24      21 128n     3

L'algorithme de bruit lui-meme (Perlin/fBm) est une implementation
illustrative ; l'algorithme exact du firmware NDLR n'est pas documente
publiquement.

Installation:
1. Sauvegarder ce fichier sous "ndlr_perlin_jsui.js" dans le meme dossier que
   votre patch Max (ou un dossier du search path).
2. Dans Max, creer un objet :  jsui @filename ndlr_perlin_jsui.js
3. Redimensionner l'objet jsui assez grand (ex: 600 x 380).
4. Cliquer/glisser dans le jsui deplace le chemin (X/Y), comme si vous
   tourniez les encodeurs X/Y a la main.

Messages acceptes dans l'inlet :
  setx <1-1000>          Position X dans le champ de bruit (encodeur X)
  sety <1-1000>          Position Y dans le champ de bruit (encodeur Y)
  zoom <1-100>            Zoom avant/arriere dans le champ de bruit
  spc  <0-100>            Spacing : separation entre les chemins Motif1/Motif2
  ruff <1-100>            Ruffness : amplifie les differences entre pas
  per  <1-100>            Persistence : melange plus ou moins d'octaves fines
  seed <0-999>            Graine du champ de bruit (change tout le terrain)
  patternlen1 <1-16>      Longueur de pattern du Motif 1 (Length, independante)
  patternlen2 <1-16>      Longueur de pattern du Motif 2 (Length, independante)
  clkdiv1 <1-21>          Division d'horloge du Motif 1 (index table ci-dessus)
  clkdiv2 <1-21>          Division d'horloge du Motif 2 (index table ci-dessus)
  motif1 <0/1>            Active/desactive le Motif 1 (sortie + avancement)
  motif2 <0/1>            Active/desactive le Motif 2 (sortie + avancement)
  running <0/1>           Start/Stop LOCAL de ce module Perlin Noise (ne suffit
                          pas seul : il faut aussi startstop=1 ET motifX=1)
  startstop <0/1>         Etat du transport GLOBAL (Live/Max). A 0, l'avancement
                          s'arrete meme si running=1 ; il ne redemarre que si
                          running=1 ET startstop repasse a 1 (et motifX=1).
  beat                    Tick d'horloge globale (96 ppqn) ; un pas d'avancement
                          n'est effectue que tous les N ticks (table clkdiv1/2),
                          et seulement si running ET startstop ET motifX sont
                          tous actifs pour ce Motif.
  pattern_type <0-2>      Type de pattern : 0=CHORD (1-20)  1=SCALE (1-40)  2=CHROMATIC (1-60)
                          Recalibre la sortie Perlin et synchronise le Pattern Editor.
  reset                   Remet les compteurs de pas a 0 (relecture depuis le debut)
  rescells <10-80>        Resolution de la grille (purement cosmetique)
  brightness <0-100>      Niveau/luminosite applique aux valeurs du bruit
  bang                    Force le recalcul + renvoi du pattern courant + redessin

Sorties :
  outlet 0 : liste des valeurs de pattern (0-20) du Motif 1, longueur = patternlen1
  outlet 1 : liste des valeurs de pattern (0-20) du Motif 2, longueur = patternlen2
  outlet 2 : position X courante (feedback, message "set X"), renvoyee apres
             un clic/drag souris dans le jsui OU apres un message externe
             setx (ex. Mod Matrix via messnamed), pour resynchroniser le
             number box X du patch sans le faire reemettre (boucle cassee
             par "set").
  outlet 3 : position Y courante (feedback "set Y"), meme principe pour le
             number box Y (souris ET message externe sety).
  outlet 4 : commandes vers le Pattern Editor du Motif 1 ("pattlen N",
             "pattern_set v1..vN", "pattern_custom_save 39"), a cabler sur
             [s motif1_editor]. Emis UNIQUEMENT quand le Motif 1 est
             reellement actif : running=1 ET startstop=1 ET motif1=1.
  outlet 5 : idem pour le Motif 2, vers [s motif2_editor], slot 40 (running=1
             ET startstop=1 ET motif2=1).
  outlet 6 : valeur Zoom courante (feedback "set Z"), renvoyee a chaque
             changement (souris ou message externe zoom), pour resynchroniser
             le number box Zoom du patch.
  outlet 7 : idem pour Spacing (message spc), number box Spacing.
  outlet 8 : idem pour Ruff (message ruff), number box Ruff.
  outlet 9 : idem pour Persistence (message per), number box Persistence.
  Les outlets 0/1 envoient une liste a chaque fois que le pattern change
  (X/Y/Zoom/SPC/RUFF/PER/Seed/Length) ou qu'un Motif est (re)active : elle
  remplace le pattern courant en aval. L'avancement pas-a-pas (lecture), lie
  au tick "beat" global divise par clkdiv1/clkdiv2 de chaque Motif, est
  uniquement visualise sur les profils du jsui.

  NOTE 3 : les outlets 4/5 remplacent EGALEMENT le pattern actif du Motif
  correspondant dans le Pattern Editor (via pattlen + pattern_set, qui
  pilotent directement le pattern courant joue par motif_builder.js), ET
  l'enregistrent immediatement dans le slot utilisateur 39 (Motif 1) / 40
  (Motif 2) — a chaque changement de pattern. Ceci NE SE DECLENCHE QUE si
  Perlin est reellement actif (running ET startstop ET motifX tous a 1) :
  sur Stop (running=0), modifier X/Y/Zoom/etc. ne touche jamais au Pattern
  Editor ni a la librairie sur disque, meme si le toggle motif1/motif2 reste
  sur ON. Comme pattern_custom_save() ecrit le fichier JSON de la librairie
  sur disque (synchrone) a chaque appel, deplacer X/Y en glissant la souris
  PENDANT que Perlin tourne peut declencher de nombreuses ecritures
  rapprochees ; c'est un choix delibere (simplicite > debounce), a
  reconsiderer si ca pose probleme en pratique.

  EXCEPTION a la regle ci-dessus : appuyer sur "Start" (running 0->1), ou
  activer un toggle motif1/motif2 alors que running est deja a 1, declenche
  TOUJOURS un push immediat (pattern_custom_save sur le slot 39/40) MEME SI
  le transport global (startstop) n'est pas encore actif. Le but est que les
  menus du Pattern Editor affichent "Perlin M1"/"Perlin M2" des l'instant ou
  Perlin Noise est localement active, sans attendre le demarrage du
  transport. L'avancement CONTINU des patterns (le recalcul a chaque
  changement de parametre, via refreshAndEmit/beat) reste lui strictement
  gere par playing ET transportOn — seul ce push d'activation initiale
  ignore deliberement transportOn (cf. pushToEditor(motifNum, force)).

  NOTE 1 : enabled1/enabled2 (motif1/motif2) valent 1 par defaut dans ce
  script. Pour que l'etat visuel des toggles Max corresponde bien a cet etat
  par defaut (au lieu d'afficher "OFF" alors que le moteur considere le
  Motif actif), le patch envoie un loadbang -> 1 -> chaque toggle au
  chargement.

  NOTE 2 : les valeurs par defaut de ce script (X=1, Y=1, Zoom=1, Spacing=0,
  Ruff=1, Persistance=1, Seed=0, Resolution=10) sont alignees sur celles des
  number box du patch, afin que l'image affichee au chargement corresponde
  exactement aux controles. Le patch force en plus chaque number box a
  rejouer sa valeur courante au chargement (loadbang -> bang -> number box),
  pour rester synchronise meme si ces valeurs sont changees dans le patch.
*/

inlets = 1;
outlets = 10; // 0=pattern Motif1, 1=pattern Motif2, 2=feedback X, 3=feedback Y,
// 4=commandes Pattern Editor Motif1, 5=commandes Pattern Editor Motif2,
// 6=feedback Zoom, 7=feedback Spacing, 8=feedback Ruff, 9=feedback Persistence
// (feedback : resynchronise les number box du patch quand X/Y/Zoom/SPC/RUFF/PER
// changent par CLIC SOURIS *ou* par message externe, ex. Mod Matrix via messnamed) :
// sans ca, moduler ces parametres depuis le Mod Matrix ne bougeait jamais
// les number box du patch, donnant l'impression a tort que "rien n'evolue".
autowatch = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var playing = 0;       // Start/Stop local de ce module (message "running")
var transportOn = 0;   // Etat du transport global (message "startstop")
// Defaults alignes sur les number box du patch (X=1, Y=1, Zoom=1, Spacing=0,
// Ruff=1, Persistance=1, Seed=0, Resolution=10) pour que l'image affichee au
// chargement corresponde exactement a ce que montrent les controles.
var xpos = 1;
var ypos = 1;
var zoomp = 1;
var spcp = 0;
var ruffp = 1;
var perp = 1;
var seedval = 0;
var brightnessp = 100; // niveau du bruit et luminosite associee
var patlen1 = 8;
var patlen2 = 8;
var rhythmRateIdx1 = 7;  // index dans RHYTHM_DIVISION_TICKS (7 = 4n, une noire)
var rhythmRateIdx2 = 7;
var beatCounter = 0;
var stepIdx1 = 0;
var stepIdx2 = 0;
var cols = 10;
var rows = Math.round(10 * 0.55);
var enabled1 = 1;
var enabled2 = 1;
var pattern1 = [];
var pattern2 = [];
var lastPushedLen1 = 0; // derniere longueur envoyee a motif_builder.js (Motif 1)
var lastPushedLen2 = 0; // idem Motif 2 — evite de renvoyer "pattlen" sans necessite

// Type de pattern par Motif : 0=CHORD (1-20)  1=SCALE (1-40)  2=CHROMATIC (1-60)
// M1 et M2 sont independants : M1 peut etre SCALE pendant que M2 est CHORD.
var patternType1 = 0;
var patternType2 = 0;
var PATT_MAX = [20, 40, 60];
var lastPushedType1 = -1; // force l'envoi de pattern_type a la premiere push
var lastPushedType2 = -1;
// (motif_builder.js reset la position de lecture a chaque pattlen)

var STEP_SPAN = 32; // largeur de reference (en "unites de pas") pour l'echantillonnage du pattern, independante de la resolution d'affichage (cols/rows)

// ---- PALETTE DE COULEURS ------------------------------------------------
// Modifier ces valeurs pour changer l'apparence du jsui.
// Format : [rouge, vert, bleu] ou [rouge, vert, bleu, alpha], valeurs 0.0-1.0
var C_BG = [0.094, 0.094, 0.094];   // fond general
var C_NOISE_TINT = [1.0, 1.0, 1.0];   // teinte du champ de bruit (multipliee par la valeur b)
var C_M1 = [0.449, 0.966, 0.667];   // courbe + ligne M1
var C_M2 = [0.935, 0.519, 0.319];   // courbe + ligne M2
var C_MARKER = [1.0, 1.0, 1.0];    // blanc — marqueur de pas courant
var C_LABEL = [1.0, 1.0, 1.0];    // blanc — texte des labels
var C_SEPARATOR = [1.0, 1.0, 1.0];    // blanc — ligne de separation M1/M2
// -------------------------------------------------------------------------

// Table de divisions (identique a motif_builder.js) : index 0-20
var RHYTHM_DIVISION_TICKS = [
    576, 384, 256, 288, 192, 128, 144, 96, 64, 72, 48, 32,
    36, 24, 16, 18, 12, 8, 9, 6, 3
];
var RHYTHM_RATE_LABELS = [
    "1nd", "1n", "1nt", "2nd", "2n", "2nt", "4nd", "4n", "4nt",
    "8nd", "8n", "8nt", "16nd", "16n", "16nt", "32nd", "32n",
    "32nt", "64nd", "64n", "128n"
];

function clamp(v, lo, hi) {
    return Math.max(lo, Math.min(hi, v));
}

function ticksPerStep1() {
    return RHYTHM_DIVISION_TICKS[rhythmRateIdx1];
}
function ticksPerStep2() {
    return RHYTHM_DIVISION_TICKS[rhythmRateIdx2];
}

/* ---------------- bruit de Perlin 2D simplifie (deterministe, graine reglable) ---------------- */

var perm = [];

function buildPerm(seedVal) {
    var p = [];
    var i;
    for (i = 0; i < 256; i++) p[i] = i;
    var seed = (seedVal * 7919 + 13) % 233280;
    if (seed <= 0) seed = 1;
    function rnd() {
        seed = (seed * 9301 + 49297) % 233280;
        return seed / 233280;
    }
    for (i = 255; i > 0; i--) {
        var j = Math.floor(rnd() * (i + 1));
        var t = p[i];
        p[i] = p[j];
        p[j] = t;
    }
    var pp = [];
    for (i = 0; i < 512; i++) pp[i] = p[i & 255];
    perm = pp;
}
buildPerm(seedval);

function fade(t) {
    return t * t * t * (t * (t * 6 - 15) + 10);
}

function lerp(t, a, b) {
    return a + t * (b - a);
}

function grad(hash, x, y) {
    var h = hash & 7;
    var u = h < 4 ? x : y;
    var v = h < 4 ? y : x;
    return ((h & 1) ? -u : u) + ((h & 2) ? -2 * v : 2 * v);
}

function perlin2(x, y) {
    var X = Math.floor(x) & 255;
    var Y = Math.floor(y) & 255;
    var xf = x - Math.floor(x);
    var yf = y - Math.floor(y);
    var u = fade(xf);
    var v = fade(yf);
    var aa = perm[X + perm[Y]];
    var ab = perm[X + perm[Y + 1]];
    var ba = perm[X + 1 + perm[Y]];
    var bb = perm[X + 1 + perm[Y + 1]];
    var res = lerp(
        v,
        lerp(u, grad(aa, xf, yf), grad(ba, xf - 1, yf)),
        lerp(u, grad(ab, xf, yf - 1), grad(bb, xf - 1, yf - 1))
    );
    return res;
}

function fbm(x, y, octaves, pers) {
    var total = 0;
    var amp = 1;
    var freq = 1;
    var maxamp = 0;
    var i;
    for (i = 0; i < octaves; i++) {
        total += perlin2(x * freq, y * freq) * amp;
        maxamp += amp;
        amp *= pers;
        freq *= 2;
    }
    return total / maxamp;
}

/* ---------------- mapping parametres NDLR -> bruit ---------------- */

function noiseScale() {
    return 0.03 + (zoomp / 100) * 0.45;
}

function persistenceVal() {
    return 0.2 + (perp / 100) * 0.55;
}

function ruffAmt() {
    return 1 + (ruffp / 100) * 3.5;
}

function originX() {
    return xpos * 0.005;
}

function originY() {
    return ypos * 0.005;
}

function spcRows() {
    return Math.round((spcp / 100) * rows * 0.45);
}

function sampleValue(nx, ny) {
    var raw = fbm(nx, ny, 4, persistenceVal());
    var amped = clamp(raw * ruffAmt(), -1, 1);
    return (amped + 1) / 2;
}

// Applique le niveau global aussi bien aux donnees qu'au rendu, afin que
// l'image reste une representation fidele des valeurs envoyees aux Motifs.
function leveledSampleValue(nx, ny) {
    return clamp(sampleValue(nx, ny) * (brightnessp / 100), 0, 1);
}

// Espacement entre pas de pattern dans l'espace de bruit, base sur STEP_SPAN
// (constant) plutot que sur la resolution d'affichage (cols) : changer la
// qualite du rendu (rescells) ne doit jamais changer les valeurs sonores.
function stepSpacingFor(patlen) {
    return noiseScale() * (STEP_SPAN / patlen);
}

// Valeur (1-PATT_MAX[pType]) d'un pas donne du pattern STATIQUE courant.
// pType : 0=CHORD, 1=SCALE, 2=CHROMATIC — independant par Motif.
function motifStepValue(patlen, rowOffset, stepIdx, pType) {
    var scale = noiseScale();
    var stepSpacing = stepSpacingFor(patlen);
    var centerRow = rows / 2;
    var nx = originX() + stepIdx * stepSpacing;
    var ny = originY() + (centerRow + rowOffset) * scale;
    return Math.max(1, Math.round(leveledSampleValue(nx, ny) * PATT_MAX[pType]));
}

// Construit le pattern complet (tableau de patlen valeurs) pour un Motif.
// pType : 0=CHORD, 1=SCALE, 2=CHROMATIC
function buildPattern(patlen, rowOffset, pType) {
    var arr = [];
    var i;
    for (i = 0; i < patlen; i++) arr.push(motifStepValue(patlen, rowOffset, i, pType));
    return arr;
}

function recomputePatterns() {
    pattern1 = buildPattern(patlen1, 0, patternType1);
    pattern2 = buildPattern(patlen2, spcRows(), patternType2);
}

// Envoie un tableau de valeurs comme liste Max sur l'outlet indique.
function emitPattern(idx, arr) {
    outlet.apply(this, [idx].concat(arr));
}

// Renvoie la position X/Y courante sur les outlets 2/3, pour resynchroniser
// les number box du patch (X, Y) quand on deplace le chemin a la souris
// dans le jsui OU quand X/Y changent par message externe (setx/sety, ex.
// Mod Matrix via messnamed) — sinon ces controles restent figes sur leur
// ancienne valeur et donnent l'impression que rien ne se passe.
//
// IMPORTANT : on envoie "set <valeur>" et non la valeur nue. Les number box
// du patch sont cablees en boucle (number box -> prepend setx/sety -> jsui,
// ET jsui -> number box pour le feedback) : un message nu sur un number box
// le fait IMMEDIATEMENT reemettre cette meme valeur en sortie (comportement
// standard d'un "number" Max), ce qui rebouclerait dans prepend setx/sety ->
// jsui -> emitXY() -> ... a l'infini (stack overflow). "set" met seulement
// a jour l'affichage du number box SANS le faire emettre : la boucle est
// cassee, l'affichage reste neanmoins synchronise.
function emitXY() {
    outlet(2, "set", xpos);
    outlet(3, "set", ypos);
}

// Idem pour Zoom/Spacing/Ruff/Persistence (outlets 6-9) : resynchronise les
// number box correspondantes a chaque changement, qu'il vienne de la souris
// (il n'y en a pas ici) ou d'un message externe (Mod Matrix, etc.). "set"
// pour la meme raison que ci-dessus (cassage de boucle number box <-> jsui).
function emitZoom() { outlet(6, "set", zoomp); }
function emitSpc() { outlet(7, "set", spcp); }
function emitRuff() { outlet(8, "set", ruffp); }
function emitPer() { outlet(9, "set", perp); }

// Pousse le pattern courant d'un Motif vers son Pattern Editor (via
// motif_builder.js, atteint par [s motif1_editor]/[s motif2_editor] cables
// sur les outlets 4/5) : remplace le pattern actif (pattlen + pattern_set)
// ET le sauvegarde dans le slot utilisateur 39 (Motif 1) / 40 (Motif 2).
// "pattlen" n'est renvoye que s'il a change, car motif_builder.js reset la
// position de lecture a chaque reception de pattlen (meme valeur incluse).
//
// Ne fait RIEN si Perlin n'est pas reellement actif (running=0 et/ou
// startstop=0) : sur Stop, modifier X/Y/Zoom/etc. ne doit pas toucher au
// Pattern Editor ni a la librairie sur disque, meme si motif1/motif2 reste
// active (ce toggle ne veut dire "actif" QUE quand running+startstop le sont).
function pushToEditor(motifNum, force) {
    // playing (Start local de Perlin) est toujours requis. transportOn
    // (transport global) l'est aussi, SAUF si force=true — utilise
    // uniquement par running()/motif1()/motif2() pour resynchroniser
    // immediatement le menu du Pattern Editor sur "Perlin M1/M2" au moment
    // ou Perlin (re)devient localement actif, sans attendre le transport.
    if (!playing) return;
    if (!force && !transportOn) return;
    var outIdx = (motifNum === 1) ? 4 : 5;
    var len = (motifNum === 1) ? patlen1 : patlen2;
    var arr = (motifNum === 1) ? pattern1 : pattern2;
    var slot = (motifNum === 1) ? 39 : 40;
    var lastLen = (motifNum === 1) ? lastPushedLen1 : lastPushedLen2;

    // Si le type a change : envoyer pattern_max puis pattern_type (qui cale le
    // Pattern Editor sur la bonne plage), et forcer un renvoi de pattlen.
    var lastType = (motifNum === 1) ? lastPushedType1 : lastPushedType2;
    var curType = (motifNum === 1) ? patternType1 : patternType2;
    if (curType !== lastType) {
        outlet(outIdx, "pattern_max", PATT_MAX[curType]);
        outlet(outIdx, "pattern_type", curType);
        if (motifNum === 1) { lastPushedType1 = curType; lastPushedLen1 = -1; }
        else { lastPushedType2 = curType; lastPushedLen2 = -1; }
        lastLen = -1; // force pattlen ci-dessous
    }
    if (len !== lastLen) {
        outlet(outIdx, "pattlen", len);
        if (motifNum === 1) lastPushedLen1 = len; else lastPushedLen2 = len;
    }
    outlet.apply(this, [outIdx, "pattern_set"].concat(arr));
    outlet(outIdx, "pattern_custom_save", slot);
}

// Recalcule les deux patterns et renvoie (sous forme de liste) ceux des
// Motifs actifs, pour remplacer le pattern courant en aval. Pousse aussi
// vers le Pattern Editor (cf. pushToEditor) pour chaque Motif actif.
function refreshAndEmit() {
    recomputePatterns();
    if (enabled1) {
        emitPattern(0, pattern1);
        pushToEditor(1);
    }
    if (enabled2) {
        emitPattern(1, pattern2);
        pushToEditor(2);
    }
    mgraphics.redraw();
}

recomputePatterns();

/* ---------------- horloge externe (96 ppqn, "beat") ---------------- */
// Pas de Task/timer interne : l'avancement ne progresse qu'a la reception
// d'un message "beat" (un tick = un appel), et seulement si running=1,
// startstop=1, ET le Motif concerne est actif (motif1/motif2).
// La vitesse est pilotee par rhythm_rate1/2 (meme systeme que motif_builder.js).

function beat() {
    if (!playing || !transportOn) return;
    beatCounter++;
    if (enabled1 && beatCounter % ticksPerStep1() === 0) {
        stepIdx1 = (stepIdx1 + 1) % patlen1;
    }
    if (enabled2 && beatCounter % ticksPerStep2() === 0) {
        stepIdx2 = (stepIdx2 + 1) % patlen2;
    }
    mgraphics.redraw();
}

function loadbang() {
    recomputePatterns();
    mgraphics.redraw();
}

/* ---------------- messages depuis l'inlet ---------------- */

function setx(v) {
    xpos = clamp(v, 1, 1000);
    refreshAndEmit();
    emitXY();
}

function sety(v) {
    ypos = clamp(v, 1, 1000);
    refreshAndEmit();
    emitXY();
}

function zoom(v) {
    zoomp = clamp(v, 1, 100);
    refreshAndEmit();
    emitZoom();
}

function spc(v) {
    spcp = clamp(v, 0, 100);
    refreshAndEmit();
    emitSpc();
}

function ruff(v) {
    ruffp = clamp(v, 1, 100);
    refreshAndEmit();
    emitRuff();
}

function per(v) {
    perp = clamp(v, 1, 100);
    refreshAndEmit();
    emitPer();
}

function seed(v) {
    seedval = clamp(Math.round(v), 0, 999);
    buildPerm(seedval);
    refreshAndEmit();
}

function patternlen1(v) {
    patlen1 = clamp(Math.round(v), 1, 16);
    stepIdx1 = stepIdx1 % patlen1;
    refreshAndEmit();
}

function patternlen2(v) {
    patlen2 = clamp(Math.round(v), 1, 16);
    stepIdx2 = stepIdx2 % patlen2;
    refreshAndEmit();
}

function rhythm_rate1(v) {
    rhythmRateIdx1 = clamp(Math.round(v), 0, RHYTHM_DIVISION_TICKS.length - 1);
    mgraphics.redraw();
}

function rhythm_rate2(v) {
    rhythmRateIdx2 = clamp(Math.round(v), 0, RHYTHM_DIVISION_TICKS.length - 1);
    mgraphics.redraw();
}

// Aliases legacy — au cas ou clkdiv1/2 soient encore cables dans le patch
function clkdiv1(v) { /* no-op : remplace par rhythm_rate1 */ }
function clkdiv2(v) { /* no-op : remplace par rhythm_rate2 */ }

function motif1(v) {
    enabled1 = v ? 1 : 0;
    if (enabled1) {
        emitPattern(0, pattern1);
        // force=true : si Perlin tourne deja localement (playing=1), le menu
        // du Pattern Editor doit basculer sur "Perlin M1" des l'activation
        // du toggle, meme sans transport global actif.
        pushToEditor(1, true);
    }
    mgraphics.redraw();
}

function motif2(v) {
    enabled2 = v ? 1 : 0;
    if (enabled2) {
        emitPattern(1, pattern2);
        pushToEditor(2, true);
    }
    mgraphics.redraw();
}

// pattern_type1 / pattern_type2 [0-2] : 0=CHORD (1-20)  1=SCALE (1-40)  2=CHROMATIC (1-60)
// Chaque Motif a son propre type, independant.
// Cablez : live.tab M1 -> [prepend pattern_type1] -> jsui inlet
//          live.tab M2 -> [prepend pattern_type2] -> jsui inlet
function pattern_type1(v) {
    patternType1 = clamp(Math.round(v), 0, 2);
    refreshAndEmit();
}
function pattern_type2(v) {
    patternType2 = clamp(Math.round(v), 0, 2);
    refreshAndEmit();
}

function rescells(v) {
    cols = clamp(Math.round(v), 10, 80);
    rows = Math.round(cols * 0.55);
    mgraphics.redraw();
}

// Niveau global : recalcule les valeurs M1/M2, les renvoie et met a jour les
// Pattern Editors selon les memes regles que X/Y/Zoom/Ruff/Persistence.
function brightness(v) {
    brightnessp = clamp(v, 0, 100);
    refreshAndEmit();
}

// Start/Stop LOCAL de ce module. Ne fait pas avancer la lecture a lui seul :
// il faut aussi que le transport global (startstop) soit actif ET que le
// Motif concerne soit actif (motif1/motif2).
function running(v) {
    playing = v ? 1 : 0;
    if (playing) {
        // Start presse : resynchronise tout de suite le Pattern Editor sur
        // "Perlin M1"/"Perlin M2" pour chaque Motif active, sans attendre
        // que le transport global soit lui aussi demarre (force=true).
        if (enabled1) pushToEditor(1, true);
        if (enabled2) pushToEditor(2, true);
    }
    mgraphics.redraw();
}

// Etat du transport GLOBAL (Live/Max). A 0, l'avancement s'arrete meme si
// running=1 ; il ne reprend que si running=1 ET startstop repasse a 1 (et
// le Motif concerne actif).
function startstop(v) {
    transportOn = v ? 1 : 0;
    mgraphics.redraw();
}

function reset() {
    beatCounter = 0;
    stepIdx1 = 0;
    stepIdx2 = 0;
    mgraphics.redraw();
}

function bang() {
    refreshAndEmit();
}

// Etat complet du champ pour la restauration de session. X/Y sont inclus :
// restaurer seulement les curseurs externes ne suffit pas lorsque le chemin a
// ete deplace directement a la souris dans l'image.
function getvalueof() {
    return [
        xpos, ypos, zoomp, spcp, ruffp, perp, seedval, brightnessp,
        patlen1, patlen2, rhythmRateIdx1, rhythmRateIdx2,
        enabled1, enabled2, patternType1, patternType2, cols
    ];
}

function setvalueof() {
    var a = arrayfromargs(arguments);
    if (a.length < 17) return;
    xpos = clamp(Number(a[0]), 1, 1000);
    ypos = clamp(Number(a[1]), 1, 1000);
    zoomp = clamp(Number(a[2]), 1, 100);
    spcp = clamp(Number(a[3]), 0, 100);
    ruffp = clamp(Number(a[4]), 1, 100);
    perp = clamp(Number(a[5]), 1, 100);
    seedval = clamp(Math.round(Number(a[6])), 0, 999);
    brightnessp = clamp(Number(a[7]), 0, 100);
    patlen1 = clamp(Math.round(Number(a[8])), 1, 16);
    patlen2 = clamp(Math.round(Number(a[9])), 1, 16);
    rhythmRateIdx1 = clamp(Math.round(Number(a[10])), 0, RHYTHM_DIVISION_TICKS.length - 1);
    rhythmRateIdx2 = clamp(Math.round(Number(a[11])), 0, RHYTHM_DIVISION_TICKS.length - 1);
    enabled1 = a[12] ? 1 : 0;
    enabled2 = a[13] ? 1 : 0;
    patternType1 = clamp(Math.round(Number(a[14])), 0, 2);
    patternType2 = clamp(Math.round(Number(a[15])), 0, 2);
    cols = clamp(Math.round(Number(a[16])), 10, 80);
    rows = Math.round(cols * 0.55);
    buildPerm(seedval);
    recomputePatterns();
    mgraphics.redraw();
}

function anything() {
    post("ndlr_perlin_jsui: message inconnu - " + messagename + "\n");
}

/* ---------------- interaction souris : deplace le chemin (X/Y), comme un encodeur ---------------- */

function onclick(x, y) {
    var width = box.rect[2] - box.rect[0];
    var height = box.rect[3] - box.rect[1];
    var fieldH = height * 0.65;
    xpos = clamp((x / width) * 1000, 1, 1000);
    ypos = clamp((y / fieldH) * 1000, 1, 1000);
    refreshAndEmit();
    emitXY();
}

function ondrag(x, y) {
    onclick(x, y);
}

/* ---------------- dessin ---------------- */

// Dessine le profil (courbe) d'un Motif sous forme d'aire + ligne + points,
// avec un marqueur blanc indiquant le pas courant (avancement lie a la
// longueur de pattern de ce Motif). Le profil est attenue si le Motif est
// desactive.
function drawProfile(patternArr, stepIdx, yTop, rowH, color, enabled, label, pType) {
    var width = box.rect[2] - box.rect[0];
    var patlen = patternArr.length;
    if (patlen < 1) return;
    var slot = width / patlen;
    var pad = 6;
    var usableH = rowH - pad * 2;
    var baseAlpha = enabled ? 1 : 0.3;
    var i;

    function px(k) { return k * slot + slot / 2; }
    function py(v) { return yTop + pad + (1 - v / PATT_MAX[pType]) * usableH; }

    mgraphics.set_source_rgba(color.r, color.g, color.b, 0.18 * baseAlpha);
    mgraphics.move_to(0, yTop + rowH - pad);
    for (i = 0; i < patlen; i++) mgraphics.line_to(px(i), py(patternArr[i]));
    mgraphics.line_to(width, yTop + rowH - pad);
    mgraphics.close_path();
    mgraphics.fill();

    mgraphics.set_line_width(2);
    mgraphics.set_source_rgba(color.r, color.g, color.b, 0.9 * baseAlpha);
    for (i = 0; i < patlen; i++) {
        if (i === 0) mgraphics.move_to(px(i), py(patternArr[i]));
        else mgraphics.line_to(px(i), py(patternArr[i]));
    }
    mgraphics.stroke();

    for (i = 0; i < patlen; i++) {
        mgraphics.set_source_rgba(color.r, color.g, color.b, 0.9 * baseAlpha);
        mgraphics.arc(px(i), py(patternArr[i]), 3, 0, Math.PI * 2);
        mgraphics.fill();
    }

    if (enabled) {
        var cx = px(stepIdx);
        mgraphics.set_line_width(1.5);
        mgraphics.set_source_rgba(C_MARKER[0], C_MARKER[1], C_MARKER[2], 0.85);
        mgraphics.move_to(cx, yTop + 2);
        mgraphics.line_to(cx, yTop + rowH - 2);
        mgraphics.stroke();

        mgraphics.set_source_rgba(C_MARKER[0], C_MARKER[1], C_MARKER[2], 0.95);
        mgraphics.arc(cx, py(patternArr[stepIdx]), 4.5, 0, Math.PI * 2);
        mgraphics.fill();
    }

    mgraphics.set_source_rgba(C_LABEL[0], C_LABEL[1], C_LABEL[2], 0.6 * baseAlpha);
    mgraphics.move_to(6, yTop + 12);
    mgraphics.select_font_face("Arial");
    mgraphics.set_font_size(10);
    mgraphics.show_text(label + (enabled ? "" : " OFF"));
}

function paint() {
    var width = box.rect[2] - box.rect[0];
    var height = box.rect[3] - box.rect[1];
    var fieldH = height * 0.65;
    var barsH = height - fieldH;
    var cellW = width / cols;
    var cellH = fieldH / rows;
    var scale = noiseScale();
    var ox = originX();
    var oy = originY();
    var centerRow = rows / 2;
    var offRows = spcRows();

    mgraphics.set_source_rgba(C_BG[0], C_BG[1], C_BG[2], 1);
    mgraphics.rectangle(0, 0, width, height);
    mgraphics.fill();

    var i, j;
    for (j = 0; j < rows; j++) {
        for (i = 0; i < cols; i++) {
            var nx = ox + i * scale;
            var ny = oy + j * scale;
            var b = leveledSampleValue(nx, ny);
            mgraphics.set_source_rgb(b * C_NOISE_TINT[0], b * C_NOISE_TINT[1], b * C_NOISE_TINT[2]);
            mgraphics.rectangle(i * cellW, j * cellH, cellW, cellH);
            mgraphics.fill();
        }
    }

    mgraphics.set_line_width(2);
    mgraphics.set_source_rgba(C_M1[0], C_M1[1], C_M1[2], 0.9);
    mgraphics.move_to(0, centerRow * cellH + cellH / 2);
    mgraphics.line_to(width, centerRow * cellH + cellH / 2);
    mgraphics.stroke();

    mgraphics.set_source_rgba(C_M2[0], C_M2[1], C_M2[2], 0.9);
    // A Spacing=100, l'arrondi de offRows peut placer le centre de M2 sur
    // la bordure basse (voire au-dela avec certaines resolutions). Le rendu
    // est borne au centre de la derniere cellule, sans toucher a la position
    // d'echantillonnage utilisee pour generer le pattern musical.
    var m2Y = clamp((centerRow + offRows) * cellH + cellH / 2,
                    cellH / 2, fieldH - cellH / 2);
    mgraphics.move_to(0, m2Y);
    mgraphics.line_to(width, m2Y);
    mgraphics.stroke();

    var rowH = barsH / 2;
    var label1 = "M1 (" + patlen1 + ") " + RHYTHM_RATE_LABELS[rhythmRateIdx1];
    var label2 = "M2 (" + patlen2 + ") " + RHYTHM_RATE_LABELS[rhythmRateIdx2];
    drawProfile(pattern1, stepIdx1, fieldH, rowH, { r: C_M1[0], g: C_M1[1], b: C_M1[2] }, enabled1, label1, patternType1);
    drawProfile(pattern2, stepIdx2, fieldH + rowH, rowH, { r: C_M2[0], g: C_M2[1], b: C_M2[2] }, enabled2, label2, patternType2);

    mgraphics.set_source_rgba(C_SEPARATOR[0], C_SEPARATOR[1], C_SEPARATOR[2], 0.15);
    mgraphics.set_line_width(1);
    mgraphics.move_to(0, fieldH + rowH);
    mgraphics.line_to(width, fieldH + rowH);
    mgraphics.stroke();
}
