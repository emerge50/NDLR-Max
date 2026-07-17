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
      59,
      114,
      640,
      440
    ],
    "openinpresentation": 1,
    "boxes": [
      {
        "box": {
          "id": "obj-88",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            339,
            148,
            51,
            22
          ],
          "text": "r m_key",
          "varname": "obj-121"
        }
      },
      {
        "box": {
          "fontface": 1,
          "fontname": "Hiragino Maru Gothic ProN",
          "fontsize": 22,
          "id": "obj-lbl-pad",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            12.5,
            7,
            341,
            28
          ],
          "presentation": 1,
          "presentation_rect": [
            5,
            5,
            203,
            28
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_play"
            }
          },
          "text": "INTERVAL MODE",
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
          "bgcolor": [
            0.094525624565048,
            0.094525586030663,
            0.09452559599708,
            1
          ],
          "checkedcolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ],
          "id": "enable",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            108,
            141,
            24,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            8,
            34,
            22,
            22
          ],
          "saved_attribute_attributes": {
            "bgcolor": {
              "expression": "themecolor.live_lcd_bg"
            },
            "checkedcolor": {
              "expression": "themecolor.live_play"
            },
            "uncheckedcolor": {
              "expression": "themecolor.live_alert"
            }
          },
          "uncheckedcolor": [
            1,
            0.490196078431373,
            0.262745098039216,
            1
          ],
          "varname": "interval_enable"
        }
      },
      {
        "box": {
          "id": "enable-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            130,
            143,
            50,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            34,
            35,
            52,
            20
          ],
          "text": "Enable"
        }
      },
      {
        "box": {
          "id": "enable-p",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            108,
            179,
            94,
            22
          ],
          "text": "prepend enable"
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
          "id": "channel",
          "maxclass": "number",
          "maximum": 16,
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
            484,
            373,
            42,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            213,
            8,
            33,
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
          "varname": "interval_channel"
        }
      },
      {
        "box": {
          "id": "channel-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            527,
            374,
            60,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            255,
            9,
            65,
            20
          ],
          "text": "MIDI Ch"
        }
      },
      {
        "box": {
          "id": "channel-init",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            484,
            335,
            85,
            22
          ],
          "text": "loadmess 16"
        }
      },
      {
        "box": {
          "id": "channel-p",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            206,
            179,
            101,
            22
          ],
          "text": "prepend channel"
        }
      },
      {
        "box": {
          "bgcolor": [
            0.15,
            0.15,
            0.15,
            0
          ],
          "blinkcolor": [
            1,
            0.490196078431373,
            0.262745098039216,
            1
          ],
          "id": "reset",
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
            24,
            149,
            24,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            92,
            34,
            22,
            22
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
          "id": "reset-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            54,
            149,
            65,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            118,
            35,
            62,
            20
          ],
          "text": "Reset"
        }
      },
      {
        "box": {
          "id": "reset-msg",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            24,
            179,
            50,
            22
          ],
          "text": "reset"
        }
      },
      {
        "box": {
          "id": "raw-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            250,
            30,
            102,
            22
          ],
          "text": "r ndlr_raw_midi"
        }
      },
      {
        "box": {
          "id": "key-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            397,
            148,
            40,
            22
          ],
          "text": "r key"
        }
      },
      {
        "box": {
          "id": "key-p",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            397,
            179,
            76,
            22
          ],
          "text": "prepend key"
        }
      },
      {
        "box": {
          "id": "mode-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            480,
            148,
            48,
            22
          ],
          "text": "r mode"
        }
      },
      {
        "box": {
          "id": "mode-p",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            480,
            179,
            86,
            22
          ],
          "text": "prepend mode"
        }
      },
      {
        "box": {
          "id": "chord-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            575,
            148,
            48,
            22
          ],
          "text": "r chord"
        }
      },
      {
        "box": {
          "id": "chord-p",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            575,
            179,
            90,
            22
          ],
          "text": "prepend chord"
        }
      },
      {
        "box": {
          "id": "panic-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            674,
            148,
            78,
            22
          ],
          "text": "r allnotesoff"
        }
      },
      {
        "box": {
          "id": "panic-p",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            674,
            179,
            112,
            22
          ],
          "text": "prepend allnotesoff"
        }
      },
      {
        "box": {
          "id": "engine",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            349,
            469,
            143,
            22
          ],
          "saved_object_attributes": {
            "filename": "interval_engine.js",
            "parameter_enable": 0
          },
          "text": "js interval_engine.js"
        }
      },
      {
        "box": {
          "id": "unpack",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "int",
            "int"
          ],
          "patching_rect": [
            349,
            509,
            85,
            22
          ],
          "text": "unpack i i i"
        }
      },
      {
        "box": {
          "id": "noteout",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 0,
          "patching_rect": [
            349,
            595,
            49,
            22
          ],
          "text": "noteout"
        }
      },
      {
        "box": {
          "id": "port-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            258,
            509,
            89,
            22
          ],
          "text": "r midi_port_out"
        }
      },
      {
        "box": {
          "id": "int-channel-send",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            484,
            405,
            146,
            22
          ],
          "text": "s ndlr_transpose_channel"
        }
      },
      {
        "box": {
          "id": "int-channel-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            315,
            113,
            145,
            22
          ],
          "text": "r ndlr_transpose_channel"
        }
      },
      {
        "box": {
          "id": "int-channel-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            315,
            179,
            76,
            22
          ],
          "text": "prepend set"
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
            12.5,
            339,
            91,
            71
          ],
          "presentation": 1,
          "presentation_rect": [
            0,
            0,
            325,
            60
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
          "patching_rect": [
            520,
            148,
            40,
            22
          ],
          "numinlets": 0,
          "numoutlets": 4,
          "outlettype": [
            "int",
            "int",
            "int",
            "int"
          ],
          "text": "key"
        }
      },
      {
        "box": {
          "id": "module-help-sel",
          "maxclass": "newobj",
          "patching_rect": [
            575,
            148,
            55,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            ""
          ],
          "text": "sel 63"
        }
      },
      {
        "box": {
          "id": "module-help-load",
          "maxclass": "message",
          "patching_rect": [
            645,
            148,
            150,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "load b_help_interval_mode.maxpat"
        }
      },
      {
        "box": {
          "id": "module-help-pcontrol",
          "maxclass": "newobj",
          "patching_rect": [
            810,
            148,
            60,
            22
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "text": "pcontrol"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "int-channel-send",
            0
          ],
          "source": [
            "channel",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "channel",
            0
          ],
          "source": [
            "channel-init",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "engine",
            0
          ],
          "source": [
            "channel-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "engine",
            0
          ],
          "source": [
            "chord-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "chord-p",
            0
          ],
          "source": [
            "chord-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "enable-p",
            0
          ],
          "source": [
            "enable",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "engine",
            0
          ],
          "source": [
            "enable-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "unpack",
            0
          ],
          "source": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "channel-p",
            0
          ],
          "order": 1,
          "source": [
            "int-channel-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "int-channel-set",
            0
          ],
          "order": 0,
          "source": [
            "int-channel-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "channel",
            0
          ],
          "source": [
            "int-channel-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "engine",
            0
          ],
          "source": [
            "key-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "key-p",
            0
          ],
          "source": [
            "key-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "engine",
            0
          ],
          "source": [
            "mode-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mode-p",
            0
          ],
          "source": [
            "mode-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "key-p",
            0
          ],
          "source": [
            "obj-88",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "engine",
            0
          ],
          "source": [
            "panic-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "panic-p",
            0
          ],
          "source": [
            "panic-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "noteout",
            0
          ],
          "source": [
            "port-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "engine",
            0
          ],
          "source": [
            "raw-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "reset-msg",
            0
          ],
          "source": [
            "reset",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "engine",
            0
          ],
          "source": [
            "reset-msg",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "noteout",
            2
          ],
          "source": [
            "unpack",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "noteout",
            1
          ],
          "source": [
            "unpack",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "noteout",
            0
          ],
          "source": [
            "unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "module-help-key",
            0
          ],
          "destination": [
            "module-help-sel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "module-help-sel",
            0
          ],
          "destination": [
            "module-help-load",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "module-help-load",
            0
          ],
          "destination": [
            "module-help-pcontrol",
            0
          ]
        }
      }
    ]
  }
}