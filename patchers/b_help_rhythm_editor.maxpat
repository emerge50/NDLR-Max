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
    "rect": [200.0, 200.0, 430.0, 310.0],
    "openinpresentation": 1,
    "bglocked": 0,
    "boxes": [
      {
        "box": {
          "id": "panel_fond",
          "maxclass": "panel",
          "patching_rect": [0.0, 0.0, 430.0, 310.0],
          "presentation": 1,
          "presentation_rect": [0.0, 0.0, 430.0, 310.0],
          "bgcolor": [0.07, 0.07, 0.07, 1.0],
          "bordercolor": [0.0, 0.980392156862745, 0.63921568627451, 1.0],
          "border": 2
        }
      },
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "text": "RHYTHM EDITOR",
          "fontsize": 28.0,
          "textcolor": [0.0, 0.980392156862745, 0.63921568627451, 1.0],
          "patching_rect": [24.0, 20.0, 360.0, 36.0],
          "presentation": 1,
          "presentation_rect": [24.0, 20.0, 360.0, 36.0]
        }
      },
      {
        "box": {
          "id": "body",
          "maxclass": "comment",
          "text": "Shortcut: ?\n\nClick on a node: select the step\nDrag to the center: adjust the selected step velocity\nShift + click: NOTE -> REST -> TIE -> NOTE\nOption + node click: ratchet 1 -> 2 -> 3 -> 4 -> 1\n\nCenter click / Shift+click: next / previous division\nCenter vertical drag or wheel: browse divisions\nOption + click center: velocity ratchet = / up / down",
          "fontsize": 14.0,
          "linecount": 10,
          "textcolor": [0.86, 0.86, 0.86, 1.0],
          "patching_rect": [24.0, 72.0, 382.0, 205.0],
          "presentation": 1,
          "presentation_rect": [24.0, 72.0, 382.0, 205.0]
        }
      },
      {
        "box": {
          "id": "window_setup",
          "maxclass": "js",
          "filename": "standalone_window.js",
          "patching_rect": [24.0, 280.0, 150.0, 22.0]
        }
      }
    ],
    "lines": []
  }
}
