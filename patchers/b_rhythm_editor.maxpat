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
    "rect": [
      110,
      389,
      707,
      509
    ],
    "openinpresentation": 1,
    "boxes": [
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            895,
            817,
            72,
            22
          ],
          "text": "s ndlr_rate1"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1077,
            817,
            72,
            22
          ],
          "text": "s ndlr_rate2"
        }
      },
      {
        "box": {
          "id": "init-pulses",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            246,
            51,
            32,
            22
          ],
          "text": "4"
        }
      },
      {
        "box": {
          "id": "init-rotate",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            281,
            51,
            32,
            22
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "init-slot",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            316,
            51,
            32,
            22
          ],
          "text": "21"
        }
      },
      {
        "box": {
          "id": "motif-auto-select-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            549,
            31,
            138,
            22
          ],
          "text": "r rhythm_editor_select"
        }
      },
      {
        "box": {
          "id": "motif-tab-state-select",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "bang",
            ""
          ],
          "patching_rect": [
            760,
            315,
            55,
            22
          ],
          "text": "sel 0 1"
        }
      },
      {
        "box": {
          "id": "motif1-state-request-direct",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            760,
            350,
            70,
            22
          ],
          "text": "dumpstate"
        }
      },
      {
        "box": {
          "id": "motif2-state-request-direct",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            835,
            350,
            70,
            22
          ],
          "text": "dumpstate"
        }
      },
      {
        "box": {
          "id": "motif1-state-send-direct",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            760,
            385,
            88,
            22
          ],
          "text": "s motif1_editor"
        }
      },
      {
        "box": {
          "id": "motif2-state-send-direct",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            855,
            385,
            88,
            22
          ],
          "text": "s motif2_editor"
        }
      },
      {
        "box": {
          "id": "motif-tab-sync-trigger",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "int"
          ],
          "patching_rect": [
            490,
            148,
            42,
            22
          ],
          "text": "t i i"
        }
      },
      {
        "box": {
          "id": "motif-index-plus-one",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            549,
            148,
            32,
            22
          ],
          "text": "+ 1"
        }
      },
      {
        "box": {
          "id": "editor-gate",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            947,
            765,
            48,
            22
          ],
          "text": "gate 2"
        }
      },
      {
        "box": {
          "id": "editor-send-m1",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            794,
            817,
            88,
            22
          ],
          "text": "s motif1_editor"
        }
      },
      {
        "box": {
          "id": "editor-send-m2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            976,
            817,
            88,
            22
          ],
          "text": "s motif2_editor"
        }
      },
      {
        "box": {
          "id": "feedback-m1",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            760.5,
            160,
            144,
            22
          ],
          "text": "r motif1_editor_feedback"
        }
      },
      {
        "box": {
          "id": "feedback-m2",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            920,
            160,
            144,
            22
          ],
          "text": "r motif2_editor_feedback"
        }
      },
      {
        "box": {
          "id": "feedback-switch",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            743.5,
            221,
            68,
            22
          ],
          "text": "switch 2 1"
        }
      },
      {
        "box": {
          "id": "feedback-route",
          "maxclass": "newobj",
          "numinlets": 11,
          "numoutlets": 11,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            500,
            500,
            694,
            22
          ],
          "text": "route rhythm_len rhythm_mode euclid_pulses euclid_rotate rhythm_slot pattern_slot variation clkdiv pattlen rhythm_slots_used"
        }
      },
      {
        "box": {
          "border": 0,
          "filename": "rhythm_slot_marker.js",
          "id": "slot-used-marker",
          "maxclass": "jsui",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            1110,
            565,
            18,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            229,
            190,
            14,
            22
          ],
          "varname": "rhythm_slot_used_marker"
        }
      },
      {
        "box": {
          "id": "length-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500,
            530,
            75,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "mode-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            567.5,
            563,
            75,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "pulses-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            635,
            530,
            75,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "rotate-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            740,
            530,
            75,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "rhythm-slot-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            820,
            530,
            75,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "prep-mode",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            99,
            212,
            129,
            22
          ],
          "text": "prepend rhythm_mode"
        }
      },
      {
        "box": {
          "id": "pulses-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            230,
            116,
            54,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            187,
            133,
            54,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "Beats",
          "textcolor": [
            0.768399306904929,
            0.768399117237748,
            0.7683991666346,
            1
          ]
        }
      },
      {
        "box": {
          "bgcolor": [
            0.094525624565048,
            0.094525586030663,
            0.09452559599708,
            1
          ],
          "htricolor": [
            1,
            0.490196078431373,
            0.262745098039216,
            1
          ],
          "id": "pulses-number",
          "maxclass": "number",
          "maximum": 32,
          "minimum": 1,
          "mousefilter": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            288,
            116,
            46,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            241,
            132,
            34,
            22
          ],
          "saved_attribute_attributes": {
            "bgcolor": {
              "expression": "themecolor.live_lcd_bg"
            },
            "htricolor": {
              "expression": "themecolor.live_alert"
            },
            "textcolor": {
              "expression": "themecolor.live_play"
            }
          },
          "textcolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ],
          "varname": "euclid_pulses_ui"
        }
      },
      {
        "box": {
          "id": "prep-pulses",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            167,
            600,
            129,
            22
          ],
          "text": "prepend euclid_pulses"
        }
      },
      {
        "box": {
          "id": "pulses-clip",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            167,
            540,
            68,
            22
          ],
          "text": "clip 1 32"
        }
      },
      {
        "box": {
          "id": "length-guard-trigger",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "int"
          ],
          "patching_rect": [
            185,
            489,
            50,
            22
          ],
          "text": "t b i"
        }
      },
      {
        "box": {
          "id": "rotate-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            230,
            142,
            54,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            187,
            162,
            54,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "Rotate",
          "textcolor": [
            0.768399306904929,
            0.768399117237748,
            0.7683991666346,
            1
          ]
        }
      },
      {
        "box": {
          "bgcolor": [
            0.094525624565048,
            0.094525586030663,
            0.09452559599708,
            1
          ],
          "htricolor": [
            1,
            0.490196078431373,
            0.262745098039216,
            1
          ],
          "id": "rotate-number",
          "maxclass": "number",
          "maximum": 31,
          "minimum": 0,
          "mousefilter": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            288,
            142,
            46,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            241,
            161,
            34,
            22
          ],
          "saved_attribute_attributes": {
            "bgcolor": {
              "expression": "themecolor.live_lcd_bg"
            },
            "htricolor": {
              "expression": "themecolor.live_alert"
            },
            "textcolor": {
              "expression": "themecolor.live_play"
            }
          },
          "textcolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ],
          "varname": "euclid_rotate_ui"
        }
      },
      {
        "box": {
          "id": "prep-rotate",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            302,
            600,
            126,
            22
          ],
          "text": "prepend euclid_rotate"
        }
      },
      {
        "box": {
          "id": "slot-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            230,
            170,
            42,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            187,
            190,
            36,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "User",
          "textcolor": [
            0.768399306904929,
            0.768399117237748,
            0.7683991666346,
            1
          ]
        }
      },
      {
        "box": {
          "bgcolor": [
            0.094525624565048,
            0.094525586030663,
            0.09452559599708,
            1
          ],
          "htricolor": [
            1,
            0.490196078431373,
            0.262745098039216,
            1
          ],
          "id": "slot-number",
          "maxclass": "number",
          "maximum": 40,
          "minimum": 21,
          "mousefilter": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            272,
            168,
            44,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            238,
            189,
            34,
            22
          ],
          "saved_attribute_attributes": {
            "bgcolor": {
              "expression": "themecolor.live_lcd_bg"
            },
            "htricolor": {
              "expression": "themecolor.live_alert"
            },
            "textcolor": {
              "expression": "themecolor.live_play"
            }
          },
          "textcolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ],
          "varname": "rhythm_slot_ui"
        }
      },
      {
        "box": {
          "bgcolor": [
            0.15,
            0.15,
            0.15,
            0.01
          ],
          "blinkcolor": [
            1,
            0.490196078431373,
            0.262745098039216,
            1
          ],
          "hint": "Save rhythm (slots 21-40)",
          "id": "save-button",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "outlinecolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ],
          "parameter_enable": 0,
          "patching_rect": [
            316,
            168,
            20,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            222,
            219,
            20,
            20
          ],
          "saved_attribute_attributes": {
            "blinkcolor": {
              "expression": "themecolor.live_alert"
            },
            "outlinecolor": {
              "expression": "themecolor.live_play"
            }
          }
        }
      },
      {
        "box": {
          "bgcolor": [
            0.15,
            0.15,
            0.15,
            0.01
          ],
          "blinkcolor": [
            1,
            0.490196078431373,
            0.262745098039216,
            1
          ],
          "hint": "Load rhythm (slots 1-40)",
          "id": "load-button",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "outlinecolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ],
          "parameter_enable": 0,
          "patching_rect": [
            338,
            168,
            20,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            276,
            219,
            20,
            20
          ],
          "saved_attribute_attributes": {
            "blinkcolor": {
              "expression": "themecolor.live_alert"
            },
            "outlinecolor": {
              "expression": "themecolor.live_play"
            }
          }
        }
      },
      {
        "box": {
          "fontsize": 12,
          "id": "save-label",
          "linecount": 2,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            316,
            188,
            23,
            33
          ],
          "presentation": 1,
          "presentation_rect": [
            187,
            219,
            41,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "Save",
          "textcolor": [
            0.768399306904929,
            0.768399117237748,
            0.7683991666346,
            1
          ],
          "textjustification": 1
        }
      },
      {
        "box": {
          "fontsize": 12,
          "id": "load-label",
          "linecount": 2,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            338,
            188,
            24,
            33
          ],
          "presentation": 1,
          "presentation_rect": [
            242,
            219,
            40,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "Load",
          "textcolor": [
            0.768399306904929,
            0.768399117237748,
            0.7683991666346,
            1
          ],
          "textjustification": 1
        }
      },
      {
        "box": {
          "id": "pack-save",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            794,
            666,
            167,
            22
          ],
          "text": "pack rhythm_pattern_save 21"
        }
      },
      {
        "box": {
          "id": "pack-load",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            976,
            666,
            164,
            22
          ],
          "text": "pack rhythm_pattern_load 21"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            42,
            600,
            115,
            22
          ],
          "text": "prepend rhythm_len"
        }
      },
      {
        "box": {
          "border": 0,
          "filename": "ndlr_rhythm_orbit.js",
          "id": "obj-1",
          "maxclass": "jsui",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            115,
            724,
            161,
            169
          ],
          "presentation": 1,
          "presentation_rect": [
            2,
            39,
            189,
            202
          ]
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            245,
            16,
            58,
            22
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "int"
          ],
          "patching_rect": [
            164,
            407,
            29.5,
            22
          ],
          "text": "t b i"
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            26.5,
            495,
            81,
            22
          ],
          "text": "sprintf %i / %i"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            164,
            376,
            112,
            22
          ],
          "text": "r pattern_steps_M1"
        }
      },
      {
        "box": {
          "id": "pattern-steps-m2-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            285,
            376,
            112,
            22
          ],
          "text": "r pattern_steps_M2"
        }
      },
      {
        "box": {
          "id": "pattern-steps-switch",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            218,
            407,
            68,
            22
          ],
          "text": "switch 2 1"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            113,
            377,
            60,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            187,
            104,
            54,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "Length",
          "textcolor": [
            0.768399306904929,
            0.768399117237748,
            0.7683991666346,
            1
          ]
        }
      },
      {
        "box": {
          "bgcolor": [
            0.094525624565048,
            0.094525586030663,
            0.09452559599708,
            1
          ],
          "htricolor": [
            1,
            0.490196078431373,
            0.262745098039216,
            1
          ],
          "id": "obj-6",
          "maxclass": "number",
          "maximum": 32,
          "minimum": 4,
          "mousefilter": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            127,
            489,
            50,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            241,
            103,
            40,
            22
          ],
          "saved_attribute_attributes": {
            "bgcolor": {
              "expression": "themecolor.live_lcd_bg"
            },
            "htricolor": {
              "expression": "themecolor.live_alert"
            },
            "textcolor": {
              "expression": "themecolor.live_play"
            }
          },
          "textcolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 10,
          "htabcolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ],
          "id": "obj-2",
          "maxclass": "tab",
          "multiline": 0,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "parameter_enable": 1,
          "patching_rect": [
            99,
            119,
            143,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            187,
            43,
            106,
            22
          ],
          "rounded": 5,
          "saved_attribute_attributes": {
            "htabcolor": {
              "expression": "themecolor.live_play"
            },
            "valueof": {
              "parameter_enum": [
                "Normal",
                "Euclidean"
              ],
              "parameter_initial": [
                1
              ],
              "parameter_longname": "live.tab[14]",
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_shortname": "live.tab[1]",
              "parameter_type": 2,
              "parameter_unitstyle": 9
            }
          },
          "spacing_x": 1,
          "spacing_y": 0,
          "tabcolor": [
            0.094525624565048,
            0.094525586030663,
            0.09452559599708,
            1
          ],
          "tabs": [
            "Normal",
            "Euclidean"
          ],
          "varname": "live.tab[1]"
        }
      },
      {
        "box": {
          "bgcolor": [
            0.208680531953877,
            0.20868047419733,
            0.208680489290039,
            1
          ],
          "bgcolor2": [
            0.208680531953877,
            0.20868047419733,
            0.208680489290039,
            1
          ],
          "bgfillcolor_angle": 270,
          "bgfillcolor_autogradient": 0,
          "bgfillcolor_color": [
            0.208680531953877,
            0.20868047419733,
            0.208680489290039,
            0
          ],
          "bgfillcolor_color1": [
            0.208680531953877,
            0.20868047419733,
            0.208680489290039,
            1
          ],
          "bgfillcolor_color2": [
            0.208680531953877,
            0.20868047419733,
            0.208680489290039,
            1
          ],
          "bgfillcolor_proportion": 0.5,
          "bgfillcolor_type": "color",
          "gradient": 1,
          "id": "obj-14",
          "ignoreclick": 1,
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            28.75,
            530,
            50,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            244,
            12,
            47,
            22
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "8 / 16",
          "textcolor": [
            0.768399306904929,
            0.768399117237748,
            0.7683991666346,
            1
          ],
          "textjustification": 2
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 10,
          "htabcolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ],
          "id": "obj-11",
          "maxclass": "tab",
          "multiline": 0,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "parameter_enable": 1,
          "patching_rect": [
            549,
            94,
            106,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            187,
            74,
            106,
            22
          ],
          "rounded": 5,
          "saved_attribute_attributes": {
            "htabcolor": {
              "expression": "themecolor.live_play"
            },
            "valueof": {
              "parameter_enum": [
                "Motif 1",
                "Motif 2"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "live.tab[13]",
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_shortname": "live.tab[1]",
              "parameter_type": 2,
              "parameter_unitstyle": 9
            }
          },
          "spacing_x": 1,
          "spacing_y": 0,
          "tabcolor": [
            0.094525624565048,
            0.094525586030663,
            0.09452559599708,
            1
          ],
          "tabs": [
            "Motif 1",
            "Motif 2"
          ],
          "varname": "live.tab"
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            204,
            442,
            90,
            22
          ],
          "text": "s rhythm_steps"
        }
      },
      {
        "box": {
          "fontname": "Hiragino Maru Gothic ProN",
          "fontsize": 22,
          "id": "obj-4",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            24,
            13,
            260,
            28
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            9,
            203,
            28
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_play"
            }
          },
          "text": "RHYTHM EDITOR",
          "textcolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ]
        }
      },
      {
        "box": {
          "angle": 270,
          "bgcolor": [
            0.094525624565048,
            0.094525586030663,
            0.09452559599708,
            1
          ],
          "border": 2,
          "bordercolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ],
          "id": "obj-120",
          "maxclass": "panel",
          "mode": 0,
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            774,
            16,
            91,
            71
          ],
          "presentation": 1,
          "presentation_rect": [
            0,
            0,
            301,
            245
          ],
          "proportion": 0.5,
          "rounded": 10,
          "saved_attribute_attributes": {
            "bgfillcolor": {
              "expression": "themecolor.live_lcd_bg"
            },
            "bordercolor": {
              "expression": "themecolor.live_play"
            }
          }
        }
      },
      {
        "box": {
          "id": "module-help-key",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 4,
          "outlettype": [
            "int",
            "int",
            "int",
            "int"
          ],
          "patching_rect": [
            1230,
            35,
            40,
            22
          ],
          "text": "key"
        }
      },
      {
        "box": {
          "id": "module-help-sel",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            ""
          ],
          "patching_rect": [
            1285,
            35,
            55,
            22
          ],
          "text": "sel 63"
        }
      },
      {
        "box": {
          "id": "module-help-load",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1355,
            35,
            193,
            22
          ],
          "text": "load b_help_rhythm_editor.maxpat"
        }
      },
      {
        "box": {
          "id": "module-help-pcontrol",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1520,
            35,
            60,
            22
          ],
          "text": "pcontrol"
        }
      },
      {
        "box": {
          "id": "clkdiv-feedback-index",
          "maxclass": "newobj",
          "patching_rect": [
            950,
            530,
            32,
            22
          ],
          "text": "- 1"
        }
      },
      {
        "box": {
          "id": "clkdiv-feedback-prep-rate",
          "maxclass": "newobj",
          "patching_rect": [
            950,
            560,
            130,
            22
          ],
          "text": "prepend rhythm_rate"
        }
      },
      {
        "box": {
          "id": "mm-m1-clkdiv-ui-r",
          "maxclass": "newobj",
          "patching_rect": [
            1220,
            500,
            140,
            22
          ],
          "text": "r m_motif1_clkdiv_ui"
        }
      },
      {
        "box": {
          "id": "mm-m2-clkdiv-ui-r",
          "maxclass": "newobj",
          "patching_rect": [
            1220,
            530,
            140,
            22
          ],
          "text": "r m_motif2_clkdiv_ui"
        }
      },
      {
        "box": {
          "id": "mm-clkdiv-ui-switch",
          "maxclass": "newobj",
          "patching_rect": [
            1220,
            575,
            68,
            22
          ],
          "text": "switch 2 1"
        }
      },
      {
        "box": {
          "id": "mm-clkdiv-ui-index",
          "maxclass": "newobj",
          "patching_rect": [
            1220,
            610,
            32,
            22
          ],
          "text": "- 1"
        }
      },
      {
        "box": {
          "id": "mm-clkdiv-ui-prep-rate",
          "maxclass": "newobj",
          "patching_rect": [
            1220,
            640,
            130,
            22
          ],
          "text": "prepend rhythm_rate"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "editor-send-m1",
            0
          ],
          "order": 1,
          "source": [
            "editor-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "editor-send-m2",
            0
          ],
          "order": 1,
          "source": [
            "editor-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-15",
            0
          ],
          "order": 0,
          "source": [
            "editor-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-7",
            0
          ],
          "order": 0,
          "source": [
            "editor-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "feedback-switch",
            1
          ],
          "source": [
            "feedback-m1",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "feedback-switch",
            2
          ],
          "source": [
            "feedback-m2",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "length-set",
            0
          ],
          "order": 0,
          "source": [
            "feedback-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mode-set",
            0
          ],
          "source": [
            "feedback-route",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
            0
          ],
          "source": [
            "feedback-route",
            8
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-5",
            0
          ],
          "order": 1,
          "source": [
            "feedback-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pulses-set",
            0
          ],
          "source": [
            "feedback-route",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "rhythm-slot-set",
            0
          ],
          "source": [
            "feedback-route",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "rotate-set",
            0
          ],
          "source": [
            "feedback-route",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "slot-used-marker",
            0
          ],
          "source": [
            "feedback-route",
            9
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "feedback-route",
            0
          ],
          "order": 0,
          "source": [
            "feedback-switch",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-1",
            0
          ],
          "order": 1,
          "source": [
            "feedback-switch",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pulses-number",
            0
          ],
          "source": [
            "init-pulses",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "rotate-number",
            0
          ],
          "source": [
            "init-rotate",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "slot-number",
            0
          ],
          "source": [
            "init-slot",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pulses-clip",
            2
          ],
          "source": [
            "length-guard-trigger",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pulses-number",
            0
          ],
          "source": [
            "length-guard-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-6",
            0
          ],
          "source": [
            "length-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pack-load",
            0
          ],
          "source": [
            "load-button",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            0
          ],
          "source": [
            "mode-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "module-help-sel",
            0
          ],
          "source": [
            "module-help-key",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "module-help-pcontrol",
            0
          ],
          "source": [
            "module-help-load",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "module-help-load",
            0
          ],
          "source": [
            "module-help-sel",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-11",
            0
          ],
          "source": [
            "motif-auto-select-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "editor-gate",
            0
          ],
          "order": 0,
          "source": [
            "motif-index-plus-one",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "feedback-switch",
            0
          ],
          "order": 1,
          "source": [
            "motif-index-plus-one",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pattern-steps-switch",
            0
          ],
          "order": 2,
          "source": [
            "motif-index-plus-one",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "motif1-state-request-direct",
            0
          ],
          "source": [
            "motif-tab-state-select",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "motif2-state-request-direct",
            0
          ],
          "source": [
            "motif-tab-state-select",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "motif-index-plus-one",
            0
          ],
          "source": [
            "motif-tab-sync-trigger",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "motif-tab-state-select",
            0
          ],
          "source": [
            "motif-tab-sync-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "motif1-state-send-direct",
            0
          ],
          "source": [
            "motif1-state-request-direct",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "motif2-state-send-direct",
            0
          ],
          "source": [
            "motif2-state-request-direct",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "editor-gate",
            1
          ],
          "source": [
            "obj-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-5",
            1
          ],
          "source": [
            "obj-10",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-5",
            0
          ],
          "source": [
            "obj-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "motif-tab-sync-trigger",
            0
          ],
          "source": [
            "obj-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "editor-gate",
            1
          ],
          "order": 0,
          "source": [
            "obj-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-1",
            0
          ],
          "order": 1,
          "source": [
            "obj-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "prep-mode",
            0
          ],
          "source": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pattern-steps-switch",
            1
          ],
          "source": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-14",
            1
          ],
          "source": [
            "obj-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "length-guard-trigger",
            0
          ],
          "order": 1,
          "source": [
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "order": 2,
          "source": [
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-33",
            0
          ],
          "order": 0,
          "source": [
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-5",
            0
          ],
          "order": 3,
          "source": [
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "init-pulses",
            0
          ],
          "order": 2,
          "source": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "init-rotate",
            0
          ],
          "order": 1,
          "source": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "init-slot",
            0
          ],
          "order": 0,
          "source": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "editor-gate",
            1
          ],
          "source": [
            "pack-load",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "editor-gate",
            1
          ],
          "source": [
            "pack-save",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pattern-steps-switch",
            2
          ],
          "source": [
            "pattern-steps-m2-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
            0
          ],
          "source": [
            "pattern-steps-switch",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "editor-gate",
            1
          ],
          "source": [
            "prep-mode",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "editor-gate",
            1
          ],
          "source": [
            "prep-pulses",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "editor-gate",
            1
          ],
          "source": [
            "prep-rotate",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "prep-pulses",
            0
          ],
          "order": 1,
          "source": [
            "pulses-clip",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pulses-set",
            0
          ],
          "order": 0,
          "source": [
            "pulses-clip",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pulses-clip",
            0
          ],
          "source": [
            "pulses-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pulses-number",
            0
          ],
          "source": [
            "pulses-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "slot-number",
            0
          ],
          "source": [
            "rhythm-slot-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "prep-rotate",
            0
          ],
          "source": [
            "rotate-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "rotate-number",
            0
          ],
          "source": [
            "rotate-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pack-save",
            0
          ],
          "source": [
            "save-button",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pack-load",
            1
          ],
          "order": 0,
          "source": [
            "slot-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "pack-save",
            1
          ],
          "order": 2,
          "source": [
            "slot-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "slot-used-marker",
            1
          ],
          "order": 1,
          "source": [
            "slot-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "feedback-route",
            7
          ],
          "destination": [
            "clkdiv-feedback-index",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "clkdiv-feedback-index",
            0
          ],
          "destination": [
            "clkdiv-feedback-prep-rate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "clkdiv-feedback-prep-rate",
            0
          ],
          "destination": [
            "obj-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mm-m1-clkdiv-ui-r",
            0
          ],
          "destination": [
            "mm-clkdiv-ui-switch",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mm-m2-clkdiv-ui-r",
            0
          ],
          "destination": [
            "mm-clkdiv-ui-switch",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "motif-index-plus-one",
            0
          ],
          "destination": [
            "mm-clkdiv-ui-switch",
            0
          ],
          "order": 3
        }
      },
      {
        "patchline": {
          "source": [
            "mm-clkdiv-ui-switch",
            0
          ],
          "destination": [
            "mm-clkdiv-ui-index",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mm-clkdiv-ui-index",
            0
          ],
          "destination": [
            "mm-clkdiv-ui-prep-rate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mm-clkdiv-ui-prep-rate",
            0
          ],
          "destination": [
            "obj-1",
            0
          ]
        }
      }
    ]
  }
}