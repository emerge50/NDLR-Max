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
        "rect": [ 76.0, 212.0, 1189.0, 792.0 ],
        "openinpresentation": 1,
        "statusbarvisible": 0,
        "toolbarvisible": 0,
        "enablehscroll": 0,
        "enablevscroll": 0,
        "boxes": [
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 163.0, 19.0, 82.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 17.0, 77.0, 20.0 ],
                    "text": "MIDI CC in"
                }
            },
            {
                "box": {
                    "id": "key-midi-channel-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 70.0, 257.0, 82.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 64.44444444444444, 77.0, 20.0 ],
                    "text": "Key MIDI Ch"
                }
            },
            {
                "box": {
                    "id": "degree-midi-channel-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 162.0, 257.0, 97.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 111.88888888888889, 103.0, 20.0 ],
                    "text": "Degree MIDI Ch"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "id": "obj-lbl-mode",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 309.5, 47.0, 82.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 159.33333333333334, 56.0, 20.0 ],
                    "text": "SCALES",
                    "varname": "obj-40"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-type",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 76.5, 44.5, 80.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 206.7777777777778, 51.0, 20.0 ],
                    "text": "COLOR",
                    "varname": "obj-38"
                }
            },
            {
                "box": {
                    "filename": "reload_button_jsui.js",
                    "id": "obj-136",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 358.5, 86.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 16.0, 43.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "filename": "reload_button_jsui.js",
                    "id": "obj-109",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 522.0, 85.5, 20.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 16.0, 83.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-152",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 653.5, 323.0, 78.0, 22.0 ],
                    "text": "sprintf %s %i"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "elementcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "id": "obj-140",
                    "items": [ 1, ",", 2, ",", 3, ",", 4, ",", 5, ",", 6, ",", 7, ",", 8, ",", 9, ",", 10, ",", 11, ",", 12, ",", 13, ",", 14, ",", 15, ",", 16 ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 76.0, 323.0, 39.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 80.0, 99.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "elementcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "obj-47[2]"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "elementcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "id": "obj-139",
                    "items": [ 1, ",", 2, ",", 3, ",", 4, ",", 5, ",", 6, ",", 7, ",", 8, ",", 9, ",", 10, ",", 11, ",", 12, ",", 13, ",", 14, ",", 15, ",", 16 ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 159.0, 323.0, 39.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 128.0, 99.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "elementcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "obj-47[1]"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-133",
                    "linecount": 8,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 768.0, 1286.0, 312.0, 105.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "RHYTHM EDITOR - Shortcut\nClick on a node — select the step\nDrag to the center — adjust the velocity of the selected step\nShift + click — state cycle NOTE -> REST -> TIE -> NOTE\nOption + node click — ratchet cycle 1 -> 2 -> 3 -> 4 -> 1\nCenter: click / Shift+click — next / previous division\nCenter: vertical drag or wheel — browse divisions\nOption + click center — cycle velocity ratchet: = ↗ ↘",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-134",
                    "linecount": 9,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1582.0, 650.0, 378.0, 117.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "INTERVAL MODE - Black keys — special functions\nC#4 (61) — repeats the current note\nF#4 (66) — random interval (−5 to +5, never 0)\nBb3 (58) — follow chord mode Bb4 (70) — low octave\nC#5 (73) — high octave\nC#2/Eb2 (37/39) — adjusts the low terminal of the wrap\nF#2/G#2 (42/44) — adjusts the high terminal of the wrap\nD4 (62) is the note \"home\" — it puts the position on D4 or on the root of the chord if \"follow chord\" is active.",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "data": {
                        "version": 1,
                        "motif": 2,
                        "patterns": {
                            "21": {
                                "values": [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 ],
                                "length": 16,
                                "type": 0
                            },
                            "40": {
                                "values": [ 1, 1, 3, 5, 4, 2, 3, 4, 4, 4, 3, 3, 3, 4, 4, 4 ],
                                "length": 16,
                                "type": 0
                            }
                        },
                        "rhythms": {
                            "21": {
                                "states": [ 1, 2, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 14,
                                "mode": 0,
                                "pulses": 4,
                                "rotate": 0
                            },
                            "22": {
                                "states": [ 1, 2, 2, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 2, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 14,
                                "mode": 0,
                                "pulses": 4,
                                "rotate": 0
                            },
                            "23": {
                                "states": [ 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 1, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 8,
                                "mode": 0,
                                "pulses": 8,
                                "rotate": 0
                            },
                            "24": {
                                "states": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 8,
                                "mode": 0,
                                "pulses": 8,
                                "rotate": 0
                            },
                            "25": {
                                "states": [ 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 2, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 74, 40, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 18,
                                "mode": 1,
                                "pulses": 13,
                                "rotate": 3
                            }
                        }
                    },
                    "id": "obj-137",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 20.5, 882.0, 191.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 1,
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict ndlr_motif2_library @embed 1"
                }
            },
            {
                "box": {
                    "data": {
                        "version": 1,
                        "rhythms": {
                            "21": {
                                "states": [ 1, 2, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 14,
                                "mode": 0,
                                "pulses": 4,
                                "rotate": 0
                            },
                            "22": {
                                "states": [ 1, 2, 2, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 2, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 14,
                                "mode": 0,
                                "pulses": 4,
                                "rotate": 0
                            },
                            "23": {
                                "states": [ 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 1, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 8,
                                "mode": 0,
                                "pulses": 8,
                                "rotate": 0
                            },
                            "24": {
                                "states": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 8,
                                "mode": 0,
                                "pulses": 8,
                                "rotate": 0
                            },
                            "25": {
                                "states": [ 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 2, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 74, 40, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 18,
                                "mode": 1,
                                "pulses": 13,
                                "rotate": 3
                            },
                            "26": {
                                "states": [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 127, 100, 66, 100, 100, 53, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 127, 100, 66, 100, 100, 53, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 6,
                                "mode": 0,
                                "pulses": 4,
                                "rotate": 0
                            }
                        }
                    },
                    "id": "obj-135",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 21.5, 911.0, 239.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 1,
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict ndlr_shared_rhythm_library @embed 1"
                }
            },
            {
                "box": {
                    "data": {
                        "version": 1,
                        "motif": 1,
                        "patterns": {
                            "21": {
                                "values": [ 17, 30, 2, 19, 3, 6, 4, 17, 4, 6, 3, 7, 2, 8, 1, 5 ],
                                "length": 2,
                                "type": 1
                            },
                            "22": {
                                "values": [ 1, 3, 2, 4, 3, 5, 4, 17, 4, 6, 3, 7, 2, 8, 1, 5 ],
                                "length": 6,
                                "type": 0
                            },
                            "23": {
                                "values": [ 1, 2, 1, 2, 1, 2, 3, 4, 4, 6, 3, 7, 2, 8, 1, 5 ],
                                "length": 8,
                                "type": 0
                            },
                            "39": {
                                "values": [ 6, 5, 4, 3, 3, 3, 5, 4, 4, 4, 2, 1, 1, 2, 5, 6 ],
                                "length": 16,
                                "type": 0
                            },
                            "40": {
                                "values": [ 19, 20, 20, 20, 20, 18, 20, 20, 7, 6, 5, 4, 3, 2, 1, 2 ],
                                "length": 8,
                                "type": 0
                            }
                        },
                        "rhythms": {
                            "21": {
                                "states": [ 1, 2, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 14,
                                "mode": 0,
                                "pulses": 4,
                                "rotate": 0
                            },
                            "22": {
                                "states": [ 1, 2, 2, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 2, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 14,
                                "mode": 0,
                                "pulses": 4,
                                "rotate": 0
                            },
                            "23": {
                                "states": [ 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 1, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 8,
                                "mode": 0,
                                "pulses": 8,
                                "rotate": 0
                            },
                            "24": {
                                "states": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 8,
                                "mode": 0,
                                "pulses": 8,
                                "rotate": 0
                            },
                            "25": {
                                "states": [ 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "normal_states": [ 1, 2, 2, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
                                "velocities": [ 100, 74, 40, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "normal_velocities": [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
                                "ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "normal_ratchets": [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
                                "length": 18,
                                "mode": 1,
                                "pulses": 13,
                                "rotate": 3
                            }
                        }
                    },
                    "id": "obj-128",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 20.5, 854.0, 191.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 1,
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict ndlr_motif1_library @embed 1"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-130",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_perlin_noise.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 1246.0, 798.0, 239.0, 516.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.0, 271.0, 237.0, 514.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-131",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_interval_mode.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 1246.0, 650.0, 325.0, 60.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 854.0, 8.0, 325.0, 60.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-129",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_rotator.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 1246.0, 723.0, 221.0, 60.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 246.5, 725.0, 221.0, 60.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-124",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 610.0, 218.0, 91.0, 22.0 ],
                    "text": "s midi_port_out",
                    "varname": "obj-170"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-125",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_transport.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 591.0, 1016.0, 165.0, 87.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 14.0, 128.0, 165.0, 87.0 ],
                    "varname": "obj-179",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 415.25, 218.0, 83.0, 22.0 ],
                    "text": "s midi_port_in",
                    "varname": "obj-168"
                }
            },
            {
                "box": {
                    "id": "obj-123",
                    "linecount": 21,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1124.0, 890.0, 91.0, 301.0 ],
                    "text": "1, 1nd 2880;\n2, 1n 1920;\n3, 1nt 1280;\n4, 2nd 1440;\n5, 2n 960;\n6, 2nt 640;\n7, 4nd 720;\n8, 4n 480;\n9, 4nt 320;\n10, 8nd 360;\n11, 8n 240;\n12, 8nt 160;\n13, 16nd 180;\n14, 16n 120;\n15, 16nt 80;\n16, 32nd 90;\n17, 32n 60;\n18, 32nt 40;\n19, 64nd 45;\n20, 64n 30;\n21, 128n 15;\n",
                    "varname": "obj-167"
                }
            },
            {
                "box": {
                    "id": "obj-141",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 631.0, 248.0, 70.0, 22.0 ],
                    "text": "loadmess 1",
                    "varname": "obj-166"
                }
            },
            {
                "box": {
                    "id": "obj-132",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 424.75, 353.0, 50.0, 22.0 ],
                    "text": "0",
                    "varname": "obj-164"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 424.75, 323.0, 29.5, 22.0 ],
                    "text": "sel",
                    "varname": "obj-163"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-126",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_rhythm_editor.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 768.0, 1033.0, 302.0, 246.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 879.0, 271.0, 301.0, 246.0 ],
                    "varname": "obj-172",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-35",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_pattern_editor.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 902.0, 640.0, 325.0, 199.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 855.0, 70.0, 325.0, 199.0 ],
                    "varname": "obj-171",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "elementcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "id": "obj-145",
                    "items": [ "0-Bank Select", ",", "1-Modulation Wheel", ",", "2-Breath Controller", ",", "3-Undefined", ",", "4-Foot Controller", ",", "5-Portamento Time", ",", "6-Data Entry MSB", ",", "7-Main Volume", ",", "8-Balance", ",", "9-Undefined", ",", "10-Pan", ",", "11-Expression", ",", "12-Effect Control 1", ",", "13-Effect Control 2", ",", "14-Undefined", ",", "15-Undefined", ",", "16-General Purpose 1", ",", "17-General Purpose 2", ",", "18-General Purpose 3", ",", "19-General Purpose 4", ",", "20-Undefined", ",", "21-Undefined", ",", "22-Undefined", ",", "23-Undefined", ",", "24-Undefined", ",", "25-Undefined", ",", "26-Undefined", ",", "27-Undefined", ",", "28-Undefined", ",", "29-Undefined", ",", "30-Undefined", ",", "31-Undefined", ",", "32-LSB Controller for 0-31", ",", "33-LSB Controller for 0-31", ",", "34-LSB Controller for 0-31", ",", "35-LSB Controller for 0-31", ",", "36-LSB Controller for 0-31", ",", "37-LSB Controller for 0-31", ",", "38-LSB Controller for 0-31", ",", "39-LSB Controller for 0-31", ",", "40-LSB Controller for 0-31", ",", "41-LSB Controller for 0-31", ",", "42-LSB Controller for 0-31", ",", "43-LSB Controller for 0-31", ",", "44-LSB Controller for 0-31", ",", "45-LSB Controller for 0-31", ",", "46-LSB Controller for 0-31", ",", "47-LSB Controller for 0-31", ",", "48-LSB Controller for 0-31", ",", "49-LSB Controller for 0-31", ",", "50-LSB Controller for 0-31", ",", "51-LSB Controller for 0-31", ",", "52-LSB Controller for 0-31", ",", "53-LSB Controller for 0-31", ",", "54-LSB Controller for 0-31", ",", "55-LSB Controller for 0-31", ",", "56-LSB Controller for 0-31", ",", "57-LSB Controller for 0-31", ",", "58-LSB Controller for 0-31", ",", "59-LSB Controller for 0-31", ",", "60-LSB Controller for 0-31", ",", "61-LSB Controller for 0-31", ",", "62-LSB Controller for 0-31", ",", "63-LSB Controller for 0-31", ",", "64-Damper Pedal on-off", ",", "65-Portamento on-off", ",", "66-Sostenuto Pedal on-off", ",", "67-Soft Pedal on-off", ",", "68-Legato FootSwitch", ",", "69-Hold 2", ",", "70-Sound Controller 1", ",", "71-Sound Controller 2", ",", "72-Sound Controller 3", ",", "73-Sound Controller 4", ",", "74-Sound Controller 5", ",", "75-Sound Controller 6", ",", "76--Sound Controller 7", ",", "77-Sound Controller 8", ",", "78-Sound Controller 9", ",", "79-Sound Controller 10", ",", "80-General Purpose MIDI CC Controller", ",", "81-General Purpose MIDI CC Controller", ",", "82-General Purpose MIDI CC Controller", ",", "83-General Purpose MIDI CC Controller", ",", "84-Portamento", ",", "85-Undefined", ",", "86-Undefined", ",", "87-Undefined", ",", "88-High Resolution Velocity Prefix", ",", "89-Undefined", ",", "90-Undefined", ",", "91-Effect 1 Depth", ",", "92-Effect 2 Depth", ",", "Effect 3 Depth", ",", "Effect 4 Depth", ",", "Effect 5 Depth", ",", "96-(+1) Data Increment", ",", "97-(-1) Data Decrement", ",", "98-Non-Registered Parameter Number LSB (NRPN)", ",", "99-Non-Registered Parameter Number MSB (NRPN)", ",", "100-Registered Parameter Number LSB (RPN)", ",", "101-Registered Parameter Number MSB (RPN)", ",", "102-Undefined", ",", "103-Undefined", ",", "104-Undefined", ",", "105-Undefined", ",", "106-Undefined", ",", "107-Undefined", ",", "108-Undefined", ",", "109-Undefined", ",", "110-Undefined", ",", "111-Undefined", ",", "112-Undefined", ",", "113-Undefined", ",", "114-Undefined", ",", "115-Undefined", ",", "116-Undefined", ",", "117-Undefined", ",", "118-Undefined", ",", "119-Undefined", ",", "120-All Sound Off", ",", "121-Reset All Controllers", ",", "122-Local on-off Switch", ",", "123-All Notes Off", ",", "124-Omni Mode Off", ",", "125-Omni Mode On", ",", "126-Mono Mode", ",", "127-Poly Mode" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 631.0, 280.0, 146.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 32.0, 133.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "elementcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "obj-160"
                }
            },
            {
                "box": {
                    "id": "obj-117",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 424.75, 287.0, 47.0, 22.0 ],
                    "text": "unpack",
                    "varname": "obj-157"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 10.0,
                    "gradient": 1,
                    "id": "obj-112",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 631.0, 347.0, 171.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 293.0, 16.0, 222.0, 20.0 ],
                    "text": "1-Modulation Wheel 0",
                    "textcolor": [ 0.85, 0.85, 0.85, 1.0 ],
                    "textjustification": 1,
                    "varname": "obj-156"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-113",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 522.0, 153.0, 55.0, 23.0 ],
                    "text": "midiinfo",
                    "varname": "obj-154"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-115",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 522.0, 118.5, 62.0, 23.0 ],
                    "text": "loadbang",
                    "varname": "obj-153"
                }
            },
            {
                "box": {
                    "id": "obj-119",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 387.5, 154.5, 86.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 45.0, 94.0, 20.0 ],
                    "text": "MIDI In Port",
                    "varname": "obj-151"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "elementcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "id": "obj-118",
                    "items": [ "Gestionnaire IAC Bus 1", ",", "to Max 1", ",", "to Max 2" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 322.5, 187.5, 195.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 16.0, 63.0, 161.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "elementcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "obj-150"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-114",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 322.5, 153.5, 55.0, 23.0 ],
                    "text": "midiinfo",
                    "varname": "obj-149"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-116",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 358.5, 118.5, 62.0, 23.0 ],
                    "text": "loadbang",
                    "varname": "obj-148"
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "outlettype": [ "", "", "", "int", "int", "", "int", "" ],
                    "patching_rect": [ 403.75, 248.0, 92.5, 22.0 ],
                    "text": "midiparse",
                    "varname": "obj-145"
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 322.5, 248.0, 40.0, 22.0 ],
                    "text": "midiin",
                    "varname": "obj-144"
                }
            },
            {
                "box": {
                    "id": "midi-in-port-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 322.5, 218.0, 80.0, 22.0 ],
                    "text": "prepend port"
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 3572.0, 76.0, 114.0, 22.0 ],
                    "text": "s m_motif2_velocity",
                    "varname": "obj-143"
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 3320.272727272727, 76.0, 119.0, 22.0 ],
                    "text": "s m_motif2_variation",
                    "varname": "obj-142"
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 3446.136363636363, 76.0, 104.0, 22.0 ],
                    "text": "s m_motif2_clkdiv",
                    "varname": "obj-141"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 3194.409090909091, 76.0, 110.0, 22.0 ],
                    "text": "s m_motif2_pattlen",
                    "varname": "obj-140"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 3068.5454545454545, 76.0, 111.0, 22.0 ],
                    "text": "s m_motif2_pattern",
                    "varname": "obj-139"
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2942.6818181818176, 76.0, 115.0, 22.0 ],
                    "text": "s m_motif2_position",
                    "varname": "obj-138"
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2816.8181818181815, 76.0, 114.0, 22.0 ],
                    "text": "s m_motif1_velocity",
                    "varname": "obj-137"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2565.090909090909, 76.0, 119.0, 22.0 ],
                    "text": "s m_motif1_variation",
                    "varname": "obj-136"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2690.9545454545455, 76.0, 104.0, 22.0 ],
                    "text": "s m_motif1_clkdiv",
                    "varname": "obj-135"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2439.227272727272, 76.0, 110.0, 22.0 ],
                    "text": "s m_motif1_pattlen",
                    "varname": "obj-134"
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2313.363636363636, 76.0, 111.0, 22.0 ],
                    "text": "s m_motif1_pattern",
                    "varname": "obj-133"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2187.5, 76.0, 115.0, 22.0 ],
                    "text": "s m_motif1_position",
                    "varname": "obj-132"
                }
            },
            {
                "box": {
                    "id": "obj-92",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2061.6363636363635, 76.0, 106.0, 22.0 ],
                    "text": "s m_drone_trigger",
                    "varname": "obj-131"
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1935.7727272727273, 76.0, 95.0, 22.0 ],
                    "text": "s m_drone_type",
                    "varname": "obj-130"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1809.9090909090908, 76.0, 113.0, 22.0 ],
                    "text": "s m_drone_position",
                    "varname": "obj-129"
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1684.0454545454545, 76.0, 91.0, 22.0 ],
                    "text": "s m_pad_strum",
                    "varname": "obj-128"
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1558.181818181818, 76.0, 98.0, 22.0 ],
                    "text": "s m_pad_spread",
                    "varname": "obj-127"
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1306.4545454545455, 76.0, 103.0, 22.0 ],
                    "text": "s m_pad_register",
                    "varname": "obj-126"
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1432.3181818181818, 76.0, 92.0, 22.0 ],
                    "text": "s pad_inversion",
                    "varname": "obj-125"
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 66.0, 946.0, 55.0, 22.0 ],
                    "text": "r m_type",
                    "varname": "obj-124"
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 214.0, 946.0, 70.0, 22.0 ],
                    "text": "r m_degree",
                    "varname": "obj-123"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 319.0, 945.0, 63.0, 22.0 ],
                    "text": "r m_mode",
                    "varname": "obj-122"
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 406.0, 1061.0, 51.0, 22.0 ],
                    "text": "r m_key",
                    "varname": "obj-121"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1772.0, 460.0, 95.0, 22.0 ],
                    "text": "r motif2_velocity",
                    "varname": "obj-120"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1582.0, 460.0, 101.0, 22.0 ],
                    "text": "r motif2_variation",
                    "varname": "obj-119"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1404.0, 460.0, 85.0, 22.0 ],
                    "text": "r motif2_clkdiv",
                    "varname": "obj-118"
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1224.0, 460.0, 91.0, 22.0 ],
                    "text": "r motif2_pattlen",
                    "varname": "obj-117"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1039.0, 460.0, 93.0, 22.0 ],
                    "text": "r motif2_pattern",
                    "varname": "obj-116"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1772.0, 515.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-115"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1582.0, 515.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-114"
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1404.0, 515.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-113"
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1225.0, 515.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-112"
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1039.0, 515.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-111"
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 855.0, 460.0, 97.0, 22.0 ],
                    "text": "r motif2_position",
                    "varname": "obj-110"
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 855.0, 515.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-109"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 855.0, 487.0, 182.0, 22.0 ],
                    "text": "prepend setbase motif2_position",
                    "varname": "obj-108"
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1039.0, 487.0, 178.0, 22.0 ],
                    "text": "prepend setbase motif2_pattern",
                    "varname": "obj-107"
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1225.0, 487.0, 177.0, 22.0 ],
                    "text": "prepend setbase motif2_pattlen",
                    "varname": "obj-106"
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1582.0, 487.0, 186.0, 22.0 ],
                    "text": "prepend setbase motif2_variation",
                    "varname": "obj-105"
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1404.0, 487.0, 171.0, 22.0 ],
                    "text": "prepend setbase motif2_clkdiv",
                    "varname": "obj-104"
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1772.0, 487.0, 181.0, 22.0 ],
                    "text": "prepend setbase motif2_velocity",
                    "varname": "obj-103"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1772.0, 376.0, 95.0, 22.0 ],
                    "text": "r motif1_velocity",
                    "varname": "obj-102"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1582.0, 376.0, 101.0, 22.0 ],
                    "text": "r motif1_variation",
                    "varname": "obj-101"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1404.0, 376.0, 85.0, 22.0 ],
                    "text": "r motif1_clkdiv",
                    "varname": "obj-100"
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1224.0, 376.0, 91.0, 22.0 ],
                    "text": "r motif1_pattlen",
                    "varname": "obj-99"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1039.0, 376.0, 93.0, 22.0 ],
                    "text": "r motif1_pattern",
                    "varname": "obj-98"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1772.0, 431.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-97"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1582.0, 431.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-96"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1404.0, 431.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-95"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1225.0, 431.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-94"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1039.0, 431.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-93"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 855.0, 376.0, 97.0, 22.0 ],
                    "text": "r motif1_position",
                    "varname": "obj-92"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1205.5, 287.0, 87.0, 22.0 ],
                    "text": "r drone_trigger",
                    "varname": "obj-91"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1039.0, 287.0, 76.0, 22.0 ],
                    "text": "r drone_type",
                    "varname": "obj-90"
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 854.0, 287.0, 95.0, 22.0 ],
                    "text": "r drone_position",
                    "varname": "obj-89"
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 855.0, 431.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-88"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1205.0, 342.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-87"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1039.0, 342.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-86"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 854.0, 342.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-85"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1358.5, 203.0, 73.0, 22.0 ],
                    "text": "r pad_strum",
                    "varname": "obj-84"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1191.5, 203.0, 79.0, 22.0 ],
                    "text": "r pad_spread",
                    "varname": "obj-83"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1358.5, 257.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-82"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1191.5, 257.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-81"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 853.5, 203.0, 84.0, 22.0 ],
                    "text": "r pad_register",
                    "varname": "obj-79"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 853.5, 257.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-77"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1285.5, 173.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-76"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1140.5, 173.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-75"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1001.5, 173.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-74"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 853.5, 173.0, 80.0, 22.0 ],
                    "text": "s mod_base",
                    "varname": "obj-73"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1285.5, 120.0, 39.0, 22.0 ],
                    "text": "r type",
                    "varname": "obj-72"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1001.5, 120.0, 46.0, 22.0 ],
                    "text": "r mode",
                    "varname": "obj-71"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 853.5, 120.0, 53.0, 22.0 ],
                    "text": "r degree",
                    "varname": "obj-70"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.590909090909, 76.0, 57.0, 22.0 ],
                    "text": "s m_type",
                    "varname": "obj-69"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1054.7272727272727, 76.0, 72.0, 22.0 ],
                    "text": "s m_degree",
                    "varname": "obj-68"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 928.8636363636364, 76.0, 65.0, 22.0 ],
                    "text": "s m_mode",
                    "varname": "obj-67"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 803.0, 76.0, 53.0, 22.0 ],
                    "text": "s m_key",
                    "varname": "obj-66"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 169.0, 76.0, 72.0, 22.0 ],
                    "text": "s allnotesoff",
                    "varname": "obj-65"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 240.0, 1189.0, 44.0, 22.0 ],
                    "text": "s roles",
                    "varname": "obj-64"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 131.0, 1189.0, 41.0, 22.0 ],
                    "text": "s pool",
                    "varname": "obj-63"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 23.0, 1153.0, 48.0, 22.0 ],
                    "text": "s chord",
                    "varname": "obj-62"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontname": "Hiragino Maru Gothic ProN",
                    "fontsize": 10.0,
                    "gradient": 1,
                    "id": "obj-8",
                    "ignoreclick": 1,
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 7.0, 1080.0, 257.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 248.0, 339.0, 18.0 ],
                    "text": "\"C-Super-Locrian Diminished-I-Suspended 4ths, 7ths & 9ths\"",
                    "textcolor": [ 0.85, 0.85, 0.85, 1.0 ],
                    "textjustification": 1,
                    "varname": "obj-61"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 292.0, 1011.0, 46.0, 22.0 ],
                    "text": "r mode",
                    "varname": "obj-60"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 151.0, 946.0, 53.0, 22.0 ],
                    "text": "r degree",
                    "varname": "obj-59"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 23.0, 946.0, 39.0, 22.0 ],
                    "text": "r type",
                    "varname": "obj-58"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 126.25, 586.0, 55.0, 22.0 ],
                    "text": "s degree",
                    "varname": "obj-57"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 16.5, 70.5, 41.0, 22.0 ],
                    "text": "s type",
                    "varname": "obj-56"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 266.5, 45.0, 48.0, 22.0 ],
                    "text": "s mode",
                    "varname": "obj-55"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1140.5, 120.0, 35.0, 22.0 ],
                    "text": "r key",
                    "varname": "obj-54"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 151.0, 1011.0, 35.0, 22.0 ],
                    "text": "r key",
                    "varname": "obj-53"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 28.0, 586.0, 37.0, 22.0 ],
                    "text": "s key",
                    "varname": "obj-52"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-3",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_drone.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 772.0, 887.0, 327.0, 144.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 525.0, 126.0, 327.0, 143.0 ],
                    "varname": "obj-59[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-5",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_motif_1.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 446.0, 640.0, 220.0, 222.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 247.0, 271.0, 220.0, 222.0 ],
                    "varname": "obj-58[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-2",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_motif_2.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 674.0, 640.0, 220.0, 222.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 247.0, 498.0, 220.0, 222.0 ],
                    "varname": "obj-57[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "elementcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "id": "obj-47",
                    "items": [ "Major", ",", "Dorian", ",", "Phrygian", ",", "Lydian", ",", "Mixolydian", ",", "Minor", ",", "Locrian", ",", "Harmonic Major", ",", "Dorian b5", ",", "Phrygian b4", ",", "Lydian b3", ",", "Mixolydian b2", ",", "Lydian Augmented #2", ",", "Locrian Diminished", ",", "Harmonic Minor", ",", "Locrian nat. 6", ",", "Ionian Augmented", ",", "Ukrainian Dorian", ",", "Phrygian Dominant", ",", "Lydian #2", ",", "Super-Locrian Diminished", ",", "Melodic Minor (asc)", ",", "Dorian b2", ",", "Lydian Augmented", ",", "Acoustic", ",", "Mixolydian b6", ",", "Half Diminished", ",", "Altered", ",", "Neapolitan Major", ",", "Lydian Augmented #6", ",", "Lydian Augmented Dominant", ",", "Lydian b6 Dominant", ",", "Major Locrian", ",", "Super-Locrian nat. 2", ",", "Super-Locrian bb3", ",", "Neapolitan Minor", ",", "Lydian #6", ",", "Mixolydian Augmented", ",", "Hungarian Gypsy", ",", "Locrian nat. 3", ",", "Ionian #2", ",", "Super-Locrian Diminished bb3", ",", "Double Harmonic Major", ",", "Lydian #2 #6", ",", "Ultraphrygian", ",", "Hungarian Minor", ",", "Oriental", ",", "Ionian Augmented #2", ",", "Locrian Diminished bb3", ",", "Persian", ",", "Persian mode 2", ",", "Persian mode 3", ",", "Persian mode 4", ",", "Persian mode 5", ",", "Persian mode 6", ",", "Persian mode 7", ",", "Major Pentatonic", ",", "Egyptian Pentatonic", ",", "Man Gong Pentatonic", ",", "Ritsusen Pentatonic", ",", "Minor Pentatonic", ",", "Major Blues Hexatonic", ",", "Major Blues Hexatonic mode 2", ",", "Major Blues Hexatonic mode 3", ",", "Major Blues Hexatonic mode 4", ",", "Major Blues Hexatonic mode 5", ",", "Minor Blues Hexatonic", ",", "Hirajoshi", ",", "Iwato", ",", "Kumoi", ",", "Insen", ",", "Ritsu", ",", "In", ",", "Ryo", ",", "Minyo", ",", "Yo", ",", "Whole" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 266.5, 17.0, 92.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 175.0, 99.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "elementcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "scale_menu"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "elementcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "id": "obj-46",
                    "items": [ "Triads", ",", "7ths", ",", "9ths", ",", "11ths", ",", "13ths", ",", "Suspended", ",", "6ths & 7ths", ",", "Minor 7ths & 9ths", ",", "Suspended 4ths, 7ths & 9ths" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 16.5, 43.5, 73.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 183.0, 223.0, 99.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "elementcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "color_menu"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-31",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_pad.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 441.0, 890.0, 325.0, 113.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 525.0, 8.0, 325.0, 113.0 ],
                    "varname": "obj-54[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "Panic_jsui.js",
                    "id": "obj-26",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 169.0, 17.0, 83.0, 34.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 219.0, 163.0, 43.0 ],
                    "varname": "obj-44"
                }
            },
            {
                "box": {
                    "id": "key-midi-channel-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 76.0, 280.0, 70.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "id": "degree-midi-channel-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 159.0, 280.0, 77.0, 22.0 ],
                    "text": "loadmess 14"
                }
            },
            {
                "box": {
                    "id": "harmony-midi-router-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 28.0, 365.0, 101.0, 22.0 ],
                    "text": "r ndlr_raw_midi"
                }
            },
            {
                "box": {
                    "id": "harmony-midi-router",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 28.0, 403.0, 150.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "harmony_midi_router.js",
                        "parameter_enable": 0
                    },
                    "text": "js harmony_midi_router.js"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "key_degree_jsui.js",
                    "id": "obj-13",
                    "maxclass": "jsui",
                    "numinlets": 3,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 28.0, 447.0, 150.0, 124.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 286.0, 34.0, 237.0, 213.50000000000003 ],
                    "varname": "obj-43"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Hiragino Maru Gothic ProN",
                    "fontsize": 22.0,
                    "id": "obj-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 10.0, 196.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 13.0, 146.0, 28.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "text": "NDLR MAX",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "obj-42"
                }
            },
            {
                "box": {
                    "id": "obj-scale-builder",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 151.0, 1042.0, 160.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "scale_builder.js",
                        "parameter_enable": 0
                    },
                    "text": "js scale_builder.js",
                    "varname": "obj-37"
                }
            },
            {
                "box": {
                    "id": "obj-chord-builder",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 23.0, 1108.0, 236.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "chord_builder.js",
                        "parameter_enable": 0
                    },
                    "text": "js chord_builder.js",
                    "varname": "obj-36"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-degree",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 151.0, 980.0, 110.0, 22.0 ],
                    "text": "prepend degree",
                    "varname": "obj-35"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-type",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 23.0, 980.0, 100.0, 22.0 ],
                    "text": "prepend type",
                    "varname": "obj-34"
                }
            },
            {
                "box": {
                    "id": "mm-type-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 23.0, 1010.0, 76.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "obj-41[1]"
                }
            },
            {
                "box": {
                    "id": "mm-degree-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 151.0, 1010.0, 76.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "obj-40[1]"
                }
            },
            {
                "box": {
                    "id": "mm-key-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 406.0, 1097.0, 76.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "obj-39[1]"
                }
            },
            {
                "box": {
                    "id": "mm-mode-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 319.0, 976.0, 76.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "obj-38[1]"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-pool",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 131.0, 1153.0, 100.0, 22.0 ],
                    "text": "prepend pool",
                    "varname": "obj-33"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-roles",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 240.0, 1153.0, 110.0, 22.0 ],
                    "text": "prepend roles",
                    "varname": "obj-32"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "mm0002",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_mod_matrix.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 1497.0, 1085.0, 713.0, 266.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 471.0, 522.0, 718.0, 270.0 ],
                    "varname": "obj-35[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "mm0005",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1140.5, 145.0, 135.0, 22.0 ],
                    "text": "prepend setbase key",
                    "varname": "obj-30"
                }
            },
            {
                "box": {
                    "id": "mm0006",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1001.5, 145.0, 135.0, 22.0 ],
                    "text": "prepend setbase mode",
                    "varname": "obj-29"
                }
            },
            {
                "box": {
                    "id": "mm0007",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 853.5, 145.0, 139.0, 22.0 ],
                    "text": "prepend setbase degree",
                    "varname": "obj-28"
                }
            },
            {
                "box": {
                    "id": "mm0008",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1285.5, 145.0, 161.0, 22.0 ],
                    "text": "prepend setbase chord_type",
                    "varname": "obj-27"
                }
            },
            {
                "box": {
                    "id": "mm0009",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 853.5, 230.0, 169.0, 22.0 ],
                    "text": "prepend setbase pad_register",
                    "varname": "obj-26"
                }
            },
            {
                "box": {
                    "id": "mm0011",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1191.5, 230.0, 165.0, 22.0 ],
                    "text": "prepend setbase pad_spread",
                    "varname": "obj-24"
                }
            },
            {
                "box": {
                    "id": "mm0012",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1358.5, 230.0, 158.0, 22.0 ],
                    "text": "prepend setbase pad_strum",
                    "varname": "obj-23"
                }
            },
            {
                "box": {
                    "id": "mm0013",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 854.0, 314.0, 180.0, 22.0 ],
                    "text": "prepend setbase drone_position",
                    "varname": "obj-22"
                }
            },
            {
                "box": {
                    "id": "mm0014",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1039.0, 314.0, 161.0, 22.0 ],
                    "text": "prepend setbase drone_type",
                    "varname": "obj-21"
                }
            },
            {
                "box": {
                    "id": "mm0015",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1205.0, 314.0, 173.0, 22.0 ],
                    "text": "prepend setbase drone_trigger",
                    "varname": "obj-20"
                }
            },
            {
                "box": {
                    "id": "mm0016",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 855.0, 403.0, 182.0, 22.0 ],
                    "text": "prepend setbase motif1_position",
                    "varname": "obj-19"
                }
            },
            {
                "box": {
                    "id": "mm0017",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1039.0, 403.0, 178.0, 22.0 ],
                    "text": "prepend setbase motif1_pattern",
                    "varname": "obj-18"
                }
            },
            {
                "box": {
                    "id": "mm0018",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1225.0, 403.0, 177.0, 22.0 ],
                    "text": "prepend setbase motif1_pattlen",
                    "varname": "obj-17"
                }
            },
            {
                "box": {
                    "id": "mm0019",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1582.0, 403.0, 186.0, 22.0 ],
                    "text": "prepend setbase motif1_variation",
                    "varname": "obj-16"
                }
            },
            {
                "box": {
                    "id": "mm0020",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1404.0, 403.0, 171.0, 22.0 ],
                    "text": "prepend setbase motif1_clkdiv",
                    "varname": "obj-15"
                }
            },
            {
                "box": {
                    "id": "mm0021",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1772.0, 403.0, 181.0, 22.0 ],
                    "text": "prepend setbase motif1_velocity",
                    "varname": "obj-14"
                }
            },
            {
                "box": {
                    "id": "mm0028",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 803.0, 10.0, 90.0, 22.0 ],
                    "text": "r mod_output",
                    "varname": "obj-13"
                }
            },
            {
                "box": {
                    "id": "mm0029",
                    "maxclass": "newobj",
                    "numinlets": 24,
                    "numoutlets": 24,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 803.0, 41.0, 2913.863636363636, 22.0 ],
                    "text": "route key mode degree chord_type pad_register pad_inversion pad_spread pad_strum drone_position drone_type drone_trigger motif1_position motif1_pattern motif1_pattlen motif1_variation motif1_clkdiv motif1_velocity motif2_position motif2_pattern motif2_pattlen motif2_variation motif2_clkdiv motif2_velocity",
                    "varname": "obj-12"
                }
            },
            {
                "box": {
                    "id": "mm-cc-out-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 658.0, 411.0, 86.0, 22.0 ],
                    "text": "r mod_output",
                    "varname": "obj-15[1]"
                }
            },
            {
                "box": {
                    "id": "mm-cc-out-route",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 658.0, 439.0, 113.0, 22.0 ],
                    "text": "route midi_cc_out"
                }
            },
            {
                "box": {
                    "id": "mm-cc-out-unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 658.0, 467.0, 85.0, 22.0 ],
                    "text": "unpack i i i",
                    "varname": "obj-14[1]"
                }
            },
            {
                "box": {
                    "id": "mm-cc-out",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 658.0, 527.0, 49.0, 22.0 ],
                    "text": "ctlout",
                    "varname": "obj-13[1]"
                }
            },
            {
                "box": {
                    "id": "mm-cc-port-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 736.0, 496.0, 89.0, 22.0 ],
                    "text": "r midi_port_out",
                    "varname": "obj-12[1]"
                }
            },
            {
                "box": {
                    "id": "mc_lbl_port",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 584.0, 155.0, 89.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 85.0, 94.0, 20.0 ],
                    "text": "MIDI Out Port",
                    "varname": "obj-11"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "elementcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "id": "mc_umenu",
                    "items": [ "AU DLS Synth 1", ",", "Gestionnaire IAC Bus 1", ",", "from Max 1", ",", "from Max 2", ",", "DLS-MIDI-Synth Virtual In" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 522.0, 187.0, 195.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 16.0, 105.0, 161.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "elementcolor": {
                            "expression": "themecolor.live_meter_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "obj-9"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "border": 2,
                    "bordercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-4",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 695.0, 13.5, 94.0, 77.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.0, 8.0, 515.0, 261.0 ],
                    "proportion": 0.5,
                    "rounded": 10,
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "bordercolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "varname": "obj-8"
                }
            },
            {
                "box": {
                    "id": "obj-keyvel-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 66.75, 586.0, 60.0, 22.0 ],
                    "text": "s key_vel",
                    "varname": "obj-6"
                }
            },
            {
                "box": {
                    "id": "obj-mm-keyvel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 187.0, 586.0, 97.0, 22.0 ],
                    "text": "prepend key_vel",
                    "varname": "obj-5"
                }
            },
            {
                "box": {
                    "id": "obj-mm-pb-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 646.0, 383.0, 98.0, 22.0 ],
                    "text": "prepend midi_pb",
                    "varname": "obj-4"
                }
            },
            {
                "box": {
                    "id": "obj-mm-at-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 445.75, 383.0, 95.0, 22.0 ],
                    "text": "prepend midi_at",
                    "varname": "obj-3"
                }
            },
            {
                "box": {
                    "id": "obj-mm-cc-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 545.0, 383.0, 97.0, 22.0 ],
                    "text": "prepend midi_cc",
                    "varname": "obj-2"
                }
            },
            {
                "box": {
                    "id": "obj-mm-input-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 545.0, 431.0, 80.0, 22.0 ],
                    "text": "s mod_input",
                    "varname": "obj-1"
                }
            },
            {
                "box": {
                    "id": "obj-scale-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 272.0, 1108.0, 70.0, 22.0 ],
                    "text": "s scale",
                    "varname": "obj-0"
                }
            },
            {
                "box": {
                    "id": "ndlr-raw-midi-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 322.5, 287.0, 101.0, 22.0 ],
                    "text": "s ndlr_raw_midi"
                }
            },
            {
                "box": {
                    "id": "ndlr-standalone-settings",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 276.0, 1439.0, 1529.0, 22.0 ],
                    "saved_object_attributes": {
                        "allwindowsactive": 0,
                        "appicon_mac": "",
                        "appicon_win": "",
                        "audiosupport": 1,
                        "bundleidentifier": "com.patrickpirat.ndlr",
                        "cantclosetoplevelpatchers": 1,
                        "cefsupport": 0,
                        "copysupport": 0,
                        "database": 0,
                        "extensions": 1,
                        "gensupport": 0,
                        "midisupport": 1,
                        "noloadbangdefeating": 1,
                        "overdrive": 1,
                        "preffilename": "NDLR",
                        "searchformissingfiles": 0,
                        "statusvisible": 0,
                        "usesearchpath": 0
                    },
                    "text": "standalone @bundleidentifier com.patrickpirat.ndlr @preffilename NDLR @audiosupport 1 @cefsupport 0 @gensupport 0 @database 0 @copysupport 0 @searchformissingfiles 0 @usesearchpath 0 @cantclosetoplevelpatchers 1 @noloadbangdefeating 1 @overdrive 1 @statusvisible 0"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "ndlr-window-controller",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 276.0, 1471.0, 164.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "standalone_window.js",
                        "parameter_enable": 0
                    },
                    "text": "js standalone_window.js"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "lfo0001",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_lfo.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 1497.0, 818.0, 405.0, 246.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 471.0, 271.0, 405.0, 246.0 ],
                    "varname": "b_lfo",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "border": 2,
                    "bordercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-120",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 411.25, 16.5, 91.0, 71.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 1189.0, 792.0 ],
                    "proportion": 0.5,
                    "rounded": 10,
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "bordercolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "varname": "panel_fond"
                }
            },
            {
                "box": {
                    "id": "mm-m1-gate-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1965.0, 376.0, 120.0, 22.0 ],
                    "text": "r motif1_gate"
                }
            },
            {
                "box": {
                    "id": "mm-m1-gate-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1965.0, 403.0, 190.0, 22.0 ],
                    "text": "prepend setbase motif1_gate"
                }
            },
            {
                "box": {
                    "id": "mm-m1-gate-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1965.0, 431.0, 80.0, 22.0 ],
                    "text": "s mod_base"
                }
            },
            {
                "box": {
                    "id": "mm-m1-accent-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2165.0, 376.0, 120.0, 22.0 ],
                    "text": "r motif1_accent"
                }
            },
            {
                "box": {
                    "id": "mm-m1-accent-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2165.0, 403.0, 190.0, 22.0 ],
                    "text": "prepend setbase motif1_accent"
                }
            },
            {
                "box": {
                    "id": "mm-m1-accent-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2165.0, 431.0, 80.0, 22.0 ],
                    "text": "s mod_base"
                }
            },
            {
                "box": {
                    "id": "mm-m1-rhythm-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2380.0, 376.0, 120.0, 22.0 ],
                    "text": "r motif1_rhythm"
                }
            },
            {
                "box": {
                    "id": "mm-m1-rhythm-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2380.0, 403.0, 190.0, 22.0 ],
                    "text": "prepend setbase motif1_rhythm"
                }
            },
            {
                "box": {
                    "id": "mm-m1-rhythm-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2380.0, 431.0, 80.0, 22.0 ],
                    "text": "s mod_base"
                }
            },
            {
                "box": {
                    "id": "mm-m2-gate-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1965.0, 460.0, 120.0, 22.0 ],
                    "text": "r motif2_gate"
                }
            },
            {
                "box": {
                    "id": "mm-m2-gate-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1965.0, 487.0, 190.0, 22.0 ],
                    "text": "prepend setbase motif2_gate"
                }
            },
            {
                "box": {
                    "id": "mm-m2-gate-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1965.0, 515.0, 80.0, 22.0 ],
                    "text": "s mod_base"
                }
            },
            {
                "box": {
                    "id": "mm-m2-accent-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2165.0, 460.0, 120.0, 22.0 ],
                    "text": "r motif2_accent"
                }
            },
            {
                "box": {
                    "id": "mm-m2-accent-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2165.0, 487.0, 190.0, 22.0 ],
                    "text": "prepend setbase motif2_accent"
                }
            },
            {
                "box": {
                    "id": "mm-m2-accent-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2165.0, 515.0, 80.0, 22.0 ],
                    "text": "s mod_base"
                }
            },
            {
                "box": {
                    "id": "mm-m2-rhythm-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2380.0, 460.0, 120.0, 22.0 ],
                    "text": "r motif2_rhythm"
                }
            },
            {
                "box": {
                    "id": "mm-m2-rhythm-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2380.0, 487.0, 190.0, 22.0 ],
                    "text": "prepend setbase motif2_rhythm"
                }
            },
            {
                "box": {
                    "id": "mm-m2-rhythm-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2380.0, 515.0, 80.0, 22.0 ],
                    "text": "s mod_base"
                }
            },
            {
                "box": {
                    "data": {
                        "version": 1,
                        "patterns": {
                            "21": {
                                "values": [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 ],
                                "length": 16,
                                "type": 1
                            },
                            "22": {
                                "values": [ 1, 12, 24, 4, 16, 28, 4, 17, 4, 6, 3, 7, 2, 8, 1, 5 ],
                                "length": 6,
                                "type": 1
                            },
                            "23": {
                                "values": [ 1, 2, 1, 2, 1, 2, 3, 4, 4, 6, 3, 7, 2, 8, 1, 5 ],
                                "length": 8,
                                "type": 0
                            },
                            "39": {
                                "values": [ 4, 7, 6, 4, 2, 4, 9, 5, 7, 6, 5, 4, 3, 2, 1, 2 ],
                                "length": 8,
                                "type": 0
                            },
                            "40": {
                                "values": [ 4, 7, 6, 4, 2, 4, 9, 5, 7, 6, 5, 4, 3, 2, 1, 2 ],
                                "length": 8,
                                "type": 0
                            }
                        }
                    },
                    "id": "obj-shared-pattern-library",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 21.5, 940.0, 242.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 1,
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict ndlr_shared_pattern_library @embed 1"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-139", 0 ],
                    "source": [ "degree-midi-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 2 ],
                    "source": [ "harmony-midi-router", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 1 ],
                    "source": [ "harmony-midi-router", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "harmony-midi-router", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "harmony-midi-router", 0 ],
                    "source": [ "harmony-midi-router-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-140", 0 ],
                    "source": [ "key-midi-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-124", 0 ],
                    "source": [ "mc_umenu", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-107", 0 ],
                    "source": [ "midi-in-port-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-out-route", 0 ],
                    "source": [ "mm-cc-out-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-out-unpack", 0 ],
                    "source": [ "mm-cc-out-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-out", 2 ],
                    "source": [ "mm-cc-out-unpack", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-out", 1 ],
                    "source": [ "mm-cc-out-unpack", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-out", 0 ],
                    "source": [ "mm-cc-out-unpack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-out", 0 ],
                    "source": [ "mm-cc-port-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 2 ],
                    "source": [ "mm-degree-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "mm-key-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m1-accent-s", 0 ],
                    "source": [ "mm-m1-accent-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m1-accent-p", 0 ],
                    "source": [ "mm-m1-accent-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m1-gate-s", 0 ],
                    "source": [ "mm-m1-gate-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m1-gate-p", 0 ],
                    "source": [ "mm-m1-gate-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m1-rhythm-s", 0 ],
                    "source": [ "mm-m1-rhythm-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m1-rhythm-p", 0 ],
                    "source": [ "mm-m1-rhythm-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-accent-s", 0 ],
                    "source": [ "mm-m2-accent-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-accent-p", 0 ],
                    "source": [ "mm-m2-accent-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-gate-s", 0 ],
                    "source": [ "mm-m2-gate-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-gate-p", 0 ],
                    "source": [ "mm-m2-gate-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-rhythm-s", 0 ],
                    "source": [ "mm-m2-rhythm-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-rhythm-p", 0 ],
                    "source": [ "mm-m2-rhythm-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "mm-mode-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "mm-type-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "source": [ "mm0005", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "mm0006", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "mm0007", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "mm0008", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "source": [ "mm0009", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "mm0011", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "mm0012", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "source": [ "mm0013", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "mm0014", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "mm0015", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "mm0016", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "mm0017", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "mm0018", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "mm0019", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "source": [ "mm0020", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "source": [ "mm0021", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0029", 0 ],
                    "source": [ "mm0028", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "source": [ "mm0029", 11 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-101", 0 ],
                    "source": [ "mm0029", 22 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "mm0029", 20 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "source": [ "mm0029", 21 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "source": [ "mm0029", 19 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "source": [ "mm0029", 18 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "source": [ "mm0029", 17 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "mm0029", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "mm0029", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "mm0029", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "mm0029", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-84", 0 ],
                    "source": [ "mm0029", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "source": [ "mm0029", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-90", 0 ],
                    "source": [ "mm0029", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-91", 0 ],
                    "source": [ "mm0029", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "source": [ "mm0029", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "source": [ "mm0029", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "source": [ "mm0029", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "source": [ "mm0029", 16 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "source": [ "mm0029", 14 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "source": [ "mm0029", 15 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "source": [ "mm0029", 13 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-99", 0 ],
                    "source": [ "mm0029", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scale-builder", 1 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ndlr-raw-midi-send", 0 ],
                    "order": 1,
                    "source": [ "obj-107", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-108", 0 ],
                    "order": 0,
                    "source": [ "obj-107", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 0 ],
                    "source": [ "obj-108", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mm-at-prepend", 0 ],
                    "source": [ "obj-108", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mm-pb-prepend", 0 ],
                    "source": [ "obj-108", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-115", 0 ],
                    "source": [ "obj-109", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mc_umenu", 0 ],
                    "source": [ "obj-113", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-118", 0 ],
                    "source": [ "obj-114", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-113", 0 ],
                    "source": [ "obj-115", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-114", 1 ],
                    "source": [ "obj-116", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-132", 1 ],
                    "source": [ "obj-117", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-117", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "midi-in-port-prepend", 0 ],
                    "order": 1,
                    "source": [ "obj-118", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "order": 0,
                    "source": [ "obj-118", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-13", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-keyvel-s", 0 ],
                    "order": 1,
                    "source": [ "obj-13", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mm-keyvel-prepend", 0 ],
                    "order": 0,
                    "source": [ "obj-13", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-152", 1 ],
                    "order": 0,
                    "source": [ "obj-132", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mm-cc-prepend", 0 ],
                    "order": 1,
                    "source": [ "obj-132", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-116", 0 ],
                    "source": [ "obj-136", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "harmony-midi-router", 2 ],
                    "source": [ "obj-139", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "harmony-midi-router", 1 ],
                    "source": [ "obj-140", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-145", 0 ],
                    "source": [ "obj-141", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-152", 0 ],
                    "source": [ "obj-145", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "source": [ "obj-145", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-112", 1 ],
                    "source": [ "obj-152", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0007", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-132", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0006", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0008", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scale-builder", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0005", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-type", 0 ],
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-degree", 0 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0009", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0011", 0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0012", 0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0016", 0 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0015", 0 ],
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0014", 0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0013", 0 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0017", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0020", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0018", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0021", 0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm0019", 0 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-83", 0 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-81", 0 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-78", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "source": [ "obj-80", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "source": [ "obj-81", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-82", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-83", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-type-ui-set", 0 ],
                    "order": 0,
                    "source": [ "obj-85", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-type", 0 ],
                    "order": 1,
                    "source": [ "obj-85", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-degree-ui-set", 0 ],
                    "order": 0,
                    "source": [ "obj-86", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-degree", 0 ],
                    "order": 1,
                    "source": [ "obj-86", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-mode-ui-set", 0 ],
                    "order": 0,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scale-builder", 1 ],
                    "order": 1,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-key-ui-set", 0 ],
                    "order": 0,
                    "source": [ "obj-88", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scale-builder", 0 ],
                    "order": 1,
                    "source": [ "obj-88", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-chord-builder", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-pool", 0 ],
                    "source": [ "obj-chord-builder", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-roles", 0 ],
                    "source": [ "obj-chord-builder", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mm-input-s", 0 ],
                    "source": [ "obj-mm-at-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mm-input-s", 0 ],
                    "source": [ "obj-mm-cc-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mm-input-s", 0 ],
                    "source": [ "obj-mm-keyvel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mm-input-s", 0 ],
                    "source": [ "obj-mm-pb-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chord-builder", 0 ],
                    "order": 1,
                    "source": [ "obj-prepend-degree", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scale-builder", 0 ],
                    "order": 0,
                    "source": [ "obj-prepend-degree", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-prepend-pool", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-prepend-roles", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chord-builder", 0 ],
                    "order": 1,
                    "source": [ "obj-prepend-type", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scale-builder", 0 ],
                    "order": 0,
                    "source": [ "obj-prepend-type", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 1 ],
                    "source": [ "obj-scale-builder", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chord-builder", 0 ],
                    "order": 1,
                    "source": [ "obj-scale-builder", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scale-s", 0 ],
                    "order": 0,
                    "source": [ "obj-scale-builder", 0 ]
                }
            }
        ],
        "parameters": {
            "lfo0001::obj-5": [ "live.tab[3]", "live.tab", 0 ],
            "obj-125::obj-138": [ "live.tab[16]", "live.tab[10]", 0 ],
            "obj-125::obj-17": [ "live.tab[6]", "live.tab[6]", 0 ],
            "obj-126::obj-11": [ "live.tab[13]", "live.tab[1]", 0 ],
            "obj-126::obj-2": [ "live.tab[14]", "live.tab[1]", 0 ],
            "obj-130::obj-21": [ "m1_pattern_type[3]", "type", 0 ],
            "obj-130::obj-7": [ "live.tab[17]", "live.tab", 0 ],
            "obj-130::tt": [ "m1_pattern_type[2]", "type", 0 ],
            "obj-2::motif2-accent-ui": [ "motif2_accent", "motif2_accent", 0 ],
            "obj-2::motif2-gate-ui": [ "motif2_gate", "motif2_gate", 0 ],
            "obj-2::obj-26": [ "motif2_pattlen", "motif2_pattlen", 0 ],
            "obj-2::obj-6": [ "live.tab[5]", "live.tab", 0 ],
            "obj-2::obj-vha7cc03": [ "motif2_humanize", "motif2_humanize", 0 ],
            "obj-31::obj-2": [ "live.tab[9]", "live.tab", 0 ],
            "obj-31::pad-invert-toggle": [ "Pad Inversion", "Inversion", 0 ],
            "obj-31::pad-quant-menu": [ "Pad Quantization", "Pad Quant", 0 ],
            "obj-35::obj-11": [ "Patt_editor_M1-M2_sel", "Patt_editor_M1-M2_sel", 0 ],
            "obj-35::obj-15::tt": [ "m1_pattern_type", "type", 0 ],
            "obj-35::obj-17::tt": [ "m1_pattern_type[1]", "type", 0 ],
            "obj-3::obj-11": [ "live.tab[1]", "live.tab[1]", 0 ],
            "obj-3::obj-16": [ "live.tab[2]", "live.tab[2]", 0 ],
            "obj-3::obj-5": [ "live.tab", "live.tab", 0 ],
            "obj-5::motif1-accent-ui": [ "motif1_accent", "motif1_accent", 0 ],
            "obj-5::motif1-gate-ui": [ "motif1_gate", "motif1_gate", 0 ],
            "obj-5::obj-26": [ "motif1_pattlen", "motif1_pattlen", 0 ],
            "obj-5::obj-6": [ "live.tab[7]", "live.tab", 0 ],
            "obj-5::obj-vha7cc03": [ "motif1_humanize", "motif1_humanize", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "parameter_overrides": {
                "obj-125::obj-17": {
                    "parameter_invisible": 0,
                    "parameter_longname": "live.tab[6]",
                    "parameter_modmode": 0,
                    "parameter_range": [ "Stop", "Play" ],
                    "parameter_shortname": "live.tab[6]",
                    "parameter_type": 2,
                    "parameter_unitstyle": 9
                },
                "obj-126::obj-11": {
                    "parameter_longname": "live.tab[13]"
                },
                "obj-126::obj-2": {
                    "parameter_invisible": 0,
                    "parameter_longname": "live.tab[14]",
                    "parameter_modmode": 0,
                    "parameter_range": [ "Normal", "Euclidean" ],
                    "parameter_type": 2,
                    "parameter_unitstyle": 9
                },
                "obj-130::obj-21": {
                    "parameter_longname": "m1_pattern_type[3]"
                },
                "obj-130::obj-7": {
                    "parameter_longname": "live.tab[17]"
                },
                "obj-130::tt": {
                    "parameter_longname": "m1_pattern_type[2]"
                },
                "obj-31::pad-invert-toggle": {
                    "parameter_invisible": 0,
                    "parameter_modmode": 0,
                    "parameter_unitstyle": 10
                },
                "obj-35::obj-11": {
                    "parameter_invisible": 0,
                    "parameter_longname": "Patt_editor_M1-M2_sel",
                    "parameter_modmode": 0,
                    "parameter_range": [ "Motif 1", "Motif 2" ],
                    "parameter_shortname": "Patt_editor_M1-M2_sel",
                    "parameter_type": 2,
                    "parameter_unitstyle": 9
                },
                "obj-35::obj-17::tt": {
                    "parameter_longname": "m1_pattern_type[1]"
                },
                "obj-3::obj-11": {
                    "parameter_invisible": 0,
                    "parameter_longname": "live.tab[1]",
                    "parameter_modmode": 0,
                    "parameter_range": [ "C1-B2", "C2-B3", "C3-B4", "C4-B5" ],
                    "parameter_shortname": "live.tab[1]",
                    "parameter_type": 2,
                    "parameter_unitstyle": 9
                },
                "obj-3::obj-16": {
                    "parameter_initial": 1,
                    "parameter_invisible": 0,
                    "parameter_longname": "live.tab[2]",
                    "parameter_modmode": 0,
                    "parameter_range": [ "Root", "Root+Oct.", "Root+5", "Root+5+Oct." ],
                    "parameter_shortname": "live.tab[2]",
                    "parameter_type": 2,
                    "parameter_unitstyle": 9
                },
                "obj-3::obj-5": {
                    "parameter_invisible": 0,
                    "parameter_longname": "live.tab",
                    "parameter_modmode": 0,
                    "parameter_range": [ "stop", "start" ],
                    "parameter_shortname": "live.tab",
                    "parameter_type": 2,
                    "parameter_unitstyle": 9
                },
                "obj-5::obj-6": {
                    "parameter_longname": "live.tab[7]"
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0,
        "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1.0 ]
    }
}
