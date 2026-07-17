autowatch = 1;

var SHAPE_NAMES = ['sine', 'triangle', 'ramp', 'saw', 'square', 'pulse', 'random'];

var PATT_NAMES = [
    'Montée-descente', 'Sauts de tierces', 'Pivot sur racine', 'Zigzag montant',
    'Bourdon aigu', 'Cascade', 'Impairs-pairs', 'Alberti',
    "Escalier d'accord", 'Basse + accord', 'Echo doublé', 'Miroir',
    'Clave', 'Rythmique', 'Pentatonique feel', 'Paires alternées',
    'Spirale', 'Marches liées', 'Sauts de quarte', 'Rotatif',
    'User 21', 'User 22', 'User 23', 'User 24', 'User 25', 'User 26',
    'User 27', 'User 28', 'User 29', 'User 30', 'User 31', 'User 32',
    'User 33', 'User 34', 'User 35', 'User 36', 'User 37', 'User 38',
    'Perlin M1', 'Perlin M2'
];

var LFO_SYNC_DIVISIONS = [
    '128 bars', '64 bars', '32 bars', '16 bars', '8 bars', '4 bars',
    '2 bars', '1 bar', '1/2 bar', '1/4 bar', '1/8 bar', '1/16 bar'
];

function loadbang() {
    // Les menus sont sauvegardés avec le bpatcher. On évite de les reconstruire
    // automatiquement pour ne pas écraser une sélection mémorisée par Max.
}

function populate() {
    var i, j, menu;
    if (!this.patcher || !this.patcher.getnamed) return;
    for (i = 1; i <= 8; i++) {
        menu = this.patcher.getnamed('mm_l' + i + 's');
        if (menu) {
            menu.message('clear');
            for (j = 0; j < SHAPE_NAMES.length; j++) menu.message('append', SHAPE_NAMES[j]);
            for (j = 0; j < PATT_NAMES.length; j++) menu.message('append', PATT_NAMES[j]);
        }
        menu = this.patcher.getnamed('mm_l' + i + 'd');
        if (menu) {
            menu.message('clear');
            for (j = 0; j < LFO_SYNC_DIVISIONS.length; j++) menu.message('append', LFO_SYNC_DIVISIONS[j]);
        }
    }
}

function rateui(idx, beatSync, menuIndex) {
    idx = Math.max(1, Math.min(8, Math.round(idx)));
    beatSync = beatSync ? 1 : 0;
    menuIndex = Math.max(0, Math.min(LFO_SYNC_DIVISIONS.length - 1, Math.round(menuIndex)));

    var rateNumber = this.patcher.getnamed('mm_l' + idx + 'r');
    var divMenu = this.patcher.getnamed('mm_l' + idx + 'd');
    if (rateNumber) rateNumber.message('hidden', beatSync ? 1 : 0);
    if (divMenu) {
        divMenu.message('hidden', beatSync ? 0 : 1);
        divMenu.message('set', menuIndex);
    }
}
