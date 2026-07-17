{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 1,
      "revision": 4,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [220.0, 220.0, 460.0, 330.0],
    "openinpresentation": 1,
    "bglocked": 0,
    "boxes": [
      {
        "box": {
          "id": "panel_fond",
          "maxclass": "panel",
          "patching_rect": [0.0, 0.0, 460.0, 330.0],
          "presentation": 1,
          "presentation_rect": [0.0, 0.0, 460.0, 330.0],
          "bgcolor": [0.07, 0.07, 0.07, 1.0],
          "bordercolor": [0.0, 0.980392156862745, 0.63921568627451, 1.0],
          "border": 2
        }
      },
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "text": "INTERVAL MODE",
          "fontsize": 28.0,
          "textcolor": [0.0, 0.980392156862745, 0.63921568627451, 1.0],
          "patching_rect": [24.0, 20.0, 390.0, 36.0],
          "presentation": 1,
          "presentation_rect": [24.0, 20.0, 390.0, 36.0]
        }
      },
      {
        "box": {
          "id": "body",
          "maxclass": "comment",
          "text": "Shortcut: ?\n\nBlack keys: special functions\nC#4 (61): repeat the current note\nF#4 (66): random interval, -5 to +5, never 0\nBb3 (58): follow chord mode\nBb4 (70): low octave\nC#5 (73): high octave\nC#2 / Eb2 (37 / 39): adjust the low wrap terminal\nF#2 / G#2 (42 / 44): adjust the high wrap terminal\nD4 (62): home note, root when follow chord is active",
          "fontsize": 14.0,
          "linecount": 11,
          "textcolor": [0.86, 0.86, 0.86, 1.0],
          "patching_rect": [24.0, 72.0, 412.0, 225.0],
          "presentation": 1,
          "presentation_rect": [24.0, 72.0, 412.0, 225.0]
        }
      },
      {
        "box": {
          "id": "window_setup",
          "maxclass": "js",
          "filename": "standalone_window.js",
          "patching_rect": [24.0, 300.0, 150.0, 22.0]
        }
      }
    ],
    "lines": []
  }
}
