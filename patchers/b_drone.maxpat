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
      364,
      287,
      420,
      515
    ],
    "openinpresentation": 1,
    "boxes": [
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            747,
            72,
            58,
            22
          ],
          "text": "loadbang"
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
            0.01
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
          "fontsize": 12,
          "gradient": 1,
          "id": "obj-3",
          "ignoreclick": 1,
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            887,
            91,
            50,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            171,
            37,
            52,
            22
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "Velocity",
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
            0.01
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
          "fontsize": 10,
          "gradient": 1,
          "id": "obj-24",
          "ignoreclick": 1,
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            846,
            191,
            27,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            296,
            61,
            29,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "64",
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
          "border": 0,
          "filename": "slider_1-127.js",
          "id": "obj-13",
          "varname": "drone_velocity_slider",
          "maxclass": "jsui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            747,
            108,
            113,
            30
          ],
          "presentation": 1,
          "presentation_rect": [
            165,
            60,
            142,
            22
          ]
        }
      },
      {
        "box": {
          "id": "mod-drone-velocity-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            747,
            42,
            126,
            22
          ],
          "text": "r m_drone_velocity_ui"
        }
      },
      {
        "box": {
          "id": "mod-drone-velocity-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            747,
            72,
            95,
            22
          ],
          "text": "prepend modset"
        }
      },
      {
        "box": {
          "id": "mod-drone-position-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            151,
            230,
            75,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "mod-drone-position-ui-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            151,
            200,
            128,
            22
          ],
          "text": "r m_drone_position_ui"
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            63,
            388,
            50,
            22
          ],
          "text": "2"
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            473,
            172,
            50,
            22
          ],
          "text": "16"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            331,
            46,
            58,
            22
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-92",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            446,
            230,
            104,
            22
          ],
          "text": "r m_drone_trigger"
        }
      },
      {
        "box": {
          "id": "obj-93",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            177.5,
            230,
            93,
            22
          ],
          "text": "r m_drone_type"
        }
      },
      {
        "box": {
          "id": "obj-94",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            31.5,
            230,
            111,
            22
          ],
          "text": "r m_drone_position"
        }
      },
      {
        "box": {
          "id": "obj-53",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            461,
            205,
            89,
            22
          ],
          "text": "s drone_trigger"
        }
      },
      {
        "box": {
          "id": "obj-54",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            178,
            205,
            78,
            22
          ],
          "text": "s drone_type"
        }
      },
      {
        "box": {
          "id": "obj-55",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            32,
            205,
            97,
            22
          ],
          "text": "s drone_position"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            747,
            161,
            71,
            22
          ],
          "text": "s drone_vel"
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            295,
            221,
            46,
            22
          ],
          "text": "r chord"
        }
      },
      {
        "box": {
          "id": "obj-rscale-drone",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200,
            221,
            50,
            22
          ],
          "text": "r scale"
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            433,
            341,
            70,
            22
          ],
          "text": "r allnotesoff"
        }
      },
      {
        "box": {
          "id": "obj-prepend-panic",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            433,
            373,
            130,
            22
          ],
          "text": "prepend allnotesoff"
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            331,
            373,
            89,
            22
          ],
          "text": "prepend tempo"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            331,
            303,
            49,
            22
          ],
          "text": "r tempo"
        }
      },
      {
        "box": {
          "id": "obj-rbeat-drone",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            556.5,
            230,
            50,
            22
          ],
          "text": "r beat"
        }
      },
      {
        "box": {
          "id": "obj-prepend-beat-drone",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            555,
            303,
            100,
            22
          ],
          "text": "prepend beat"
        }
      },
      {
        "box": {
          "id": "obj-rtransreset-drone",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            772,
            231,
            110,
            22
          ],
          "text": "r transport_reset"
        }
      },
      {
        "box": {
          "id": "obj-msg-resetphase-drone",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            772,
            256,
            90,
            22
          ],
          "text": "transportstart"
        }
      },
      {
        "box": {
          "id": "obj-rtransstop-drone",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            880,
            231,
            100,
            22
          ],
          "text": "r transport_stop"
        }
      },
      {
        "box": {
          "id": "obj-msg-transportstop-drone",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            880,
            256,
            90,
            22
          ],
          "text": "transportstop"
        }
      },
      {
        "box": {
          "id": "drone-pad-quant-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            990,
            256,
            108,
            22
          ],
          "text": "r pad_quant_value"
        }
      },
      {
        "box": {
          "id": "drone-pad-quant-p",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            990,
            286,
            113,
            22
          ],
          "text": "prepend pad_quant"
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            163,
            176,
            29.5,
            22
          ],
          "text": "+ 1"
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
          "id": "obj-16",
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
            196,
            141,
            275,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            42,
            89,
            276,
            22
          ],
          "rounded": 5,
          "saved_attribute_attributes": {
            "htabcolor": {
              "expression": "themecolor.live_play"
            },
            "valueof": {
              "parameter_enum": [
                "Root",
                "Root+Oct.",
                "Root+5",
                "Root+5+Oct."
              ],
              "parameter_initial": [
                1
              ],
              "parameter_initial_enable": 1,
              "parameter_longname": "live.tab[2]",
              "parameter_mmax": 3,
              "parameter_modmode": 0,
              "parameter_shortname": "live.tab[2]",
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
            "Root",
            "Root+Oct.",
            "Root+5",
            "Root+5+Oct."
          ],
          "varname": "drone_type_tab"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            15,
            176,
            29.5,
            22
          ],
          "text": "+ 1"
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
            15,
            140,
            160,
            21
          ],
          "presentation": 1,
          "presentation_rect": [
            9,
            59,
            157,
            22
          ],
          "rounded": 5,
          "saved_attribute_attributes": {
            "htabcolor": {
              "expression": "themecolor.live_play"
            },
            "valueof": {
              "parameter_enum": [
                "C1-B2",
                "C2-B3",
                "C3-B4",
                "C4-B5"
              ],
              "parameter_initial": [
                1
              ],
              "parameter_initial_enable": 1,
              "parameter_longname": "live.tab[1]",
              "parameter_mmax": 3,
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
            "C1-B2",
            "C2-B3",
            "C3-B4",
            "C4-B5"
          ],
          "varname": "drone_position_tab"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 18,
          "htabcolor": [
            0,
            0.980392156862745,
            0.63921568627451,
            1
          ],
          "id": "obj-5",
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
            756,
            372,
            85,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            104,
            11,
            126,
            24
          ],
          "rounded": 5,
          "saved_attribute_attributes": {
            "htabcolor": {
              "expression": "themecolor.live_play"
            },
            "valueof": {
              "parameter_enum": [
                "stop",
                "start"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_initial_enable": 1,
              "parameter_longname": "live.tab",
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_shortname": "live.tab",
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
            "stop",
            "start"
          ],
          "varname": "drone_run"
        }
      },
      {
        "box": {
          "id": "mc_lbl_drn",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            109,
            366,
            122,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            258,
            13,
            63.5,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "Midi Chan",
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
            0.14901960784313725,
            0.14901960784313725,
            0.14901960784313725,
            0
          ],
          "htricolor": [
            1,
            0.490196078431373,
            0.262745098039216,
            1
          ],
          "id": "mc_num_drn",
          "varname": "drone_midi_channel",
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
            114,
            388,
            36,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            232,
            12,
            36,
            22
          ],
          "saved_attribute_attributes": {
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
          "id": "mc_s_drn",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            114,
            423,
            97,
            22
          ],
          "text": "s drone_channel"
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
            9.5,
            9,
            93,
            28
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_play"
            }
          },
          "text": "DRONE",
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
          "id": "obj-6",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            72,
            107,
            57,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            9.5,
            38,
            54,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "Position",
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
          "id": "obj-10",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            254.5,
            108,
            48,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            90,
            36.5,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "Type",
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
          "id": "obj-15",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            525,
            143,
            179,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            10,
            116,
            53,
            20
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "Trigger",
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
          "bgfillcolor_angle": 270,
          "bgfillcolor_autogradient": 0,
          "bgfillcolor_color": [
            0.094525624565048,
            0.094525586030663,
            0.09452559599708,
            1
          ],
          "bgfillcolor_color1": [
            0.10980392156862745,
            0.10980392156862745,
            0.10980392156862745,
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
          "id": "obj-25",
          "items": [
            "Root - Sustain",
            ",",
            "Root - Beat 1",
            ",",
            "Root - Beats 1 & 2",
            ",",
            "Root - Beats 1 & 3",
            ",",
            "Root - Beats 2 & 4",
            ",",
            "Root - Every beat",
            ",",
            "Root - Every 3 beats",
            ",",
            "Root - Every 5 beats",
            ",",
            "Chord - Sustain",
            ",",
            "Chord - Beat 1",
            ",",
            "Chord - Beats 1 & 2",
            ",",
            "Chord - Beats 1 & 3",
            ",",
            "Chord - Beats 2 & 4",
            ",",
            "Chord - Every beat",
            ",",
            "Chord - Every 3 beats",
            ",",
            "Chord - Every 5 beats",
            ",",
            "Chord - Beat 1 + offbeats 2, 3, 4",
            ",",
            "Chord - Offbeats 2, 3 + beat 4",
            ",",
            "Chord - Beats 1, 3, 4 + offbeat 2"
          ],
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            473,
            142,
            50,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            66,
            115,
            252,
            22
          ],
          "saved_attribute_attributes": {
            "bgfillcolor": {
              "expression": "themecolor.live_lcd_bg"
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
          "varname": "drone_trigger_menu"
        }
      },
      {
        "box": {
          "id": "obj-29",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            15,
            255,
            100,
            22
          ],
          "text": "prepend position"
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            163,
            254,
            100,
            22
          ],
          "text": "prepend type"
        }
      },
      {
        "box": {
          "id": "obj-31",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            421,
            255,
            100,
            22
          ],
          "text": "prepend trigger"
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            295,
            255,
            100,
            22
          ],
          "text": "prepend chord"
        }
      },
      {
        "box": {
          "id": "obj-38",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
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
              626,
              139,
              611,
              827
            ],
            "boxes": [
              {
                "box": {
                  "id": "obj-17",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 0,
                  "patching_rect": [
                    50.5,
                    253,
                    49,
                    22
                  ],
                  "text": "noteout"
                }
              },
              {
                "box": {
                  "id": "obj-14",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 0,
                  "patching_rect": [
                    186.5,
                    253,
                    49,
                    22
                  ],
                  "text": "noteout"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-1",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    50,
                    30,
                    30,
                    30
                  ],
                  "varname": "obj-1"
                }
              },
              {
                "box": {
                  "id": "obj-2",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    50,
                    80,
                    160,
                    22
                  ],
                  "saved_object_attributes": {
                    "filename": "drone_builder.js",
                    "parameter_enable": 0
                  },
                  "text": "js drone_builder.js",
                  "varname": "obj-2"
                }
              },
              {
                "box": {
                  "id": "d_rchan",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    245,
                    82,
                    110,
                    22
                  ],
                  "text": "r drone_channel"
                }
              },
              {
                "box": {
                  "id": "d_rport",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    265,
                    114,
                    89,
                    22
                  ],
                  "text": "r midi_port_out"
                }
              },
              {
                "box": {
                  "id": "unpack-on",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "int",
                    "int"
                  ],
                  "patching_rect": [
                    50,
                    130,
                    67,
                    22
                  ],
                  "text": "unpack 0 0"
                }
              },
              {
                "box": {
                  "id": "unpack-off",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "int",
                    "int"
                  ],
                  "patching_rect": [
                    186,
                    130,
                    67,
                    22
                  ],
                  "text": "unpack 0 0"
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "destination": [
                    "obj-14",
                    2
                  ],
                  "order": 0,
                  "source": [
                    "d_rchan",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-17",
                    2
                  ],
                  "order": 1,
                  "source": [
                    "d_rchan",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-14",
                    0
                  ],
                  "order": 0,
                  "source": [
                    "d_rport",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-17",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "d_rport",
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
                    "obj-1",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "unpack-off",
                    0
                  ],
                  "source": [
                    "obj-2",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "unpack-on",
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
                    "obj-14",
                    1
                  ],
                  "source": [
                    "unpack-off",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-14",
                    0
                  ],
                  "source": [
                    "unpack-off",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-17",
                    1
                  ],
                  "source": [
                    "unpack-on",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-17",
                    0
                  ],
                  "source": [
                    "unpack-on",
                    0
                  ]
                }
              }
            ]
          },
          "patching_rect": [
            221,
            433,
            100,
            22
          ],
          "text": "patcher p_drone"
        }
      },
      {
        "box": {
          "id": "mm-drone-on-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            555,
            230,
            83,
            22
          ],
          "text": "r m_drone_on"
        }
      },
      {
        "box": {
          "id": "mm-drone-on-prepend",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            555,
            260,
            75,
            22
          ],
          "text": "prepend on"
        }
      },
      {
        "box": {
          "id": "obj-drone-vel-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            227.5,
            295,
            75,
            22
          ],
          "text": "r drone_vel"
        }
      },
      {
        "box": {
          "id": "obj-drone-vel-prepend",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            227.5,
            365,
            71,
            22
          ],
          "text": "prepend vel"
        }
      },
      {
        "box": {
          "id": "obj-keyvel-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            571,
            345,
            75,
            22
          ],
          "text": "r key_vel"
        }
      },
      {
        "box": {
          "id": "obj-keyvel-prepend",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            571,
            373,
            71,
            22
          ],
          "text": "prepend vel"
        }
      },
      {
        "box": {
          "id": "drone-velocity-mouse-poll",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            400,
            420,
            35,
            22
          ],
          "text": "poll"
        }
      },
      {
        "box": {
          "id": "drone-velocity-mousestate",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 10,
          "outlettype": [
            "int",
            "int",
            "int",
            "int",
            "int",
            "int",
            "int",
            "float",
            "float",
            "list"
          ],
          "patching_rect": [
            440,
            420,
            72,
            22
          ],
          "text": "mousestate"
        }
      },
      {
        "box": {
          "id": "drone-velocity-mouse-change",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "int",
            "int"
          ],
          "patching_rect": [
            520,
            420,
            48,
            22
          ],
          "text": "change"
        }
      },
      {
        "box": {
          "id": "drone-velocity-mouse-up",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            ""
          ],
          "patching_rect": [
            575,
            420,
            36,
            22
          ],
          "text": "sel 0"
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
          "fontsize": 9,
          "gradient": 1,
          "id": "drone-trigger-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            525,
            170,
            184,
            19
          ],
          "saved_attribute_attributes": {
            "textcolor": {
              "expression": "themecolor.live_lcd_title"
            }
          },
          "text": "\"Chord - Beat 1 + offbeats 2, 3, 4\"",
          "textcolor": [
            0.768399306904929,
            0.768399117237748,
            0.7683991666346,
            1
          ],
          "varname": "drone_trigger_display"
        }
      },
      {
        "box": {
          "id": "drone-trigger-feedback-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            560,
            230,
            75,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "drone-trigger-label-r",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            650,
            230,
            125,
            22
          ],
          "text": "r drone_trigger_label"
        }
      },
      {
        "box": {
          "id": "drone-trigger-label-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            650,
            260,
            75,
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
            478,
            19,
            91,
            71
          ],
          "presentation": 1,
          "presentation_rect": [
            0,
            0,
            325,
            142
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
          "id": "drone-trigger-menu-plus",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            421,
            174,
            40,
            22
          ],
          "text": "+ 1"
        }
      },
      {
        "box": {
          "id": "drone-trigger-feedback-index",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            560,
            255,
            40,
            22
          ],
          "text": "- 1"
        }
      },
      {
        "box": {
          "id": "mm-drone-on-ui-r",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            40,
            105,
            22
          ],
          "text": "r m_drone_on_ui"
        }
      },
      {
        "box": {
          "id": "mm-drone-on-ui-set",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            70,
            75,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "mm-drone-type-ui-r",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            95,
            119,
            22
          ],
          "text": "r m_drone_type_ui"
        }
      },
      {
        "box": {
          "id": "mm-drone-type-ui-index",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            125,
            32,
            22
          ],
          "text": "- 1"
        }
      },
      {
        "box": {
          "id": "mm-drone-type-ui-set",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            155,
            75,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "mm-drone-trigger-ui-r",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            190,
            140,
            22
          ],
          "text": "r m_drone_trigger_ui"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "drone-pad-quant-p",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "drone-pad-quant-p",
            0
          ],
          "source": [
            "drone-pad-quant-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "drone-trigger-feedback-set",
            0
          ],
          "source": [
            "drone-trigger-feedback-index",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-25",
            0
          ],
          "source": [
            "drone-trigger-feedback-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "drone-trigger-label-set",
            0
          ],
          "source": [
            "drone-trigger-label-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "drone-trigger-display",
            0
          ],
          "source": [
            "drone-trigger-label-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-31",
            0
          ],
          "order": 1,
          "source": [
            "drone-trigger-menu-plus",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-53",
            0
          ],
          "order": 0,
          "source": [
            "drone-trigger-menu-plus",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "drone-velocity-mouse-up",
            0
          ],
          "source": [
            "drone-velocity-mouse-change",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "drone-velocity-mousestate",
            0
          ],
          "source": [
            "drone-velocity-mouse-poll",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "drone-velocity-mouse-change",
            0
          ],
          "source": [
            "drone-velocity-mousestate",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mc_s_drn",
            0
          ],
          "order": 0,
          "source": [
            "mc_num_drn",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-26",
            1
          ],
          "order": 1,
          "source": [
            "mc_num_drn",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "mm-drone-on-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mm-drone-on-prepend",
            0
          ],
          "source": [
            "mm-drone-on-r",
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
            "mod-drone-position-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mod-drone-position-set",
            0
          ],
          "source": [
            "mod-drone-position-ui-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mod-drone-velocity-set",
            0
          ],
          "order": 1,
          "source": [
            "mod-drone-velocity-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-24",
            1
          ],
          "order": 0,
          "source": [
            "mod-drone-velocity-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-13",
            0
          ],
          "source": [
            "mod-drone-velocity-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-37",
            0
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
            "obj-12",
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
            "obj-29",
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
            "obj-55",
            0
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
            "obj-24",
            1
          ],
          "order": 0,
          "source": [
            "obj-13",
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
          "order": 1,
          "source": [
            "obj-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-prepend-panic",
            0
          ],
          "source": [
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-17",
            0
          ],
          "source": [
            "obj-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-30",
            0
          ],
          "order": 1,
          "source": [
            "obj-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-54",
            0
          ],
          "order": 0,
          "source": [
            "obj-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-34",
            0
          ],
          "source": [
            "obj-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "drone-velocity-mouse-poll",
            0
          ],
          "order": 1,
          "source": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-23",
            0
          ],
          "order": 0,
          "source": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-26",
            0
          ],
          "order": 2,
          "source": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-25",
            0
          ],
          "source": [
            "obj-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "drone-trigger-menu-plus",
            0
          ],
          "order": 1,
          "source": [
            "obj-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-23",
            1
          ],
          "order": 0,
          "source": [
            "obj-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mc_num_drn",
            0
          ],
          "source": [
            "obj-26",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-29",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-31",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-34",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-37",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-5",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-13",
            0
          ],
          "source": [
            "obj-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "drone-trigger-feedback-index",
            0
          ],
          "order": 0,
          "source": [
            "obj-92",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-31",
            0
          ],
          "order": 1,
          "source": [
            "obj-92",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-30",
            0
          ],
          "source": [
            "obj-93",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mod-drone-position-set",
            0
          ],
          "order": 0,
          "source": [
            "obj-94",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-29",
            0
          ],
          "order": 1,
          "source": [
            "obj-94",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-drone-vel-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-drone-vel-prepend",
            0
          ],
          "source": [
            "obj-drone-vel-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-keyvel-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-keyvel-prepend",
            0
          ],
          "source": [
            "obj-keyvel-r",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-msg-resetphase-drone",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-msg-transportstop-drone",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-prepend-beat-drone",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-prepend-panic",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-prepend-beat-drone",
            0
          ],
          "source": [
            "obj-rbeat-drone",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "source": [
            "obj-rscale-drone",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-msg-resetphase-drone",
            0
          ],
          "source": [
            "obj-rtransreset-drone",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-msg-transportstop-drone",
            0
          ],
          "source": [
            "obj-rtransstop-drone",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mm-drone-on-ui-r",
            0
          ],
          "destination": [
            "mm-drone-on-ui-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mm-drone-on-ui-set",
            0
          ],
          "destination": [
            "obj-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mm-drone-type-ui-r",
            0
          ],
          "destination": [
            "mm-drone-type-ui-index",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mm-drone-type-ui-index",
            0
          ],
          "destination": [
            "mm-drone-type-ui-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mm-drone-type-ui-set",
            0
          ],
          "destination": [
            "obj-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mm-drone-trigger-ui-r",
            0
          ],
          "destination": [
            "drone-trigger-feedback-index",
            0
          ]
        }
      }
    ]
  }
}
