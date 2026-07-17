// standalone_window.js
// Verrouille la fenêtre principale sur le presentation_rect de "panel_fond".

autowatch = 1;
inlets = 1;
outlets = 0;

var retryCount = 0;
var MAX_RETRIES = 10;

function configureWindow() {
    var panel = this.patcher.getnamed("panel_fond");
    var wind = this.patcher.wind;

    if (!panel || !wind) {
        retryCount++;
        if (retryCount < MAX_RETRIES) setupTask.schedule(100);
        return;
    }

    var rect = panel.getattr("presentation_rect");
    if (!rect || rect.length < 4) return;

    var width = Math.max(1, Math.round(Number(rect[2])));
    var height = Math.max(1, Math.round(Number(rect[3])));

    wind.size = [width, height];
    wind.hasgrow = false;
    wind.haszoom = false;
    wind.hasclose = true;
    wind.scrollto(0, 0);

    this.patcher.message("enablehscroll", 0);
    this.patcher.message("enablevscroll", 0);
    this.patcher.message("toolbarvisible", 0);
    this.patcher.message("statusbarvisible", 0);
}

var setupTask = new Task(configureWindow, this);

function loadbang() {
    retryCount = 0;
    setupTask.schedule(100);
}

function bang() {
    retryCount = 0;
    configureWindow.call(this);
}

function notifydeleted() {
    setupTask.cancel();
}
