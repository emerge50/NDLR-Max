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
        "rect": [ 249.0, 229.0, 632.0, 603.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4.5, 39.5, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 40.000001192092896, 58.0000017285347, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Voicing",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl-register",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 21.0, 133.0, 110.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 161.0000047981739, 86.00000256299973, 53.33332821726799, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Register",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl-quant",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 156.0, 133.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 242.6666738986969, 86.00000256299973, 45.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Quant",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl-strum",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 405.0, 88.0, 59.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0000000596046448, 86.00000256299973, 43.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Strum",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "pad-strum-on-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 542.0, 113.0, 22.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.000001668930054, 87.00000259280205, 24.0, 18.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "On",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "pad-strum-group-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 662.0, 113.0, 104.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 91.00000271201134, 87.00000259280205, 30.0, 18.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Grp",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 99.00000295042992, 150.66667115688324, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 258.9999982714653, 40.00000074505806, 58.0000017285347, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Inversion",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 2
                }
            },
            {
                "box": {
                    "id": "pad-midi-channel-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 710.0, 690.0, 72.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "slider_1-127.js",
                    "id": "obj-20",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 467.0, 518.0, 113.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 101.66666969656944, 35.000001043081284, 151.66667118668556, 30.00000089406967 ],
                    "varname": "pad_velocity_slider"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-15",
                    "maxclass": "number",
                    "maximum": 2,
                    "minimum": -2,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 26.0, 155.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 209.00000622868538, 85.0000025331974, 29.33333420753479, 22.0 ],
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "pad_register_number"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.15, 0.15, 0.15, 0.01 ],
                    "bgfillcolor_color": [ 0.15, 0.15, 0.15, 0.01 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_type": "color",
                    "id": "obj-13",
                    "items": [ "None", ",", "Dynamic", ",", "Grouping", ",", "Open 1 Voicing", ",", "Open 2 Voicing", ",", "Open 3 Voicing", ",", "Guitar Voicing", ",", "Drop 2 Voicing", ",", "Drop 3 Voicing", ",", "Drop 4 Voicing", ",", "Drop 2 & 3 Voicing", ",", "Voicing Lock" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 272.0, 170.0, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 59.00000175833702, 114.5, 22.0 ],
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "pad_voice_grouping_ui"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 623.0, 47.0, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 707.25, 47.0, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 666.25, 47.0, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 640.0, 9.0, 34.0, 22.0 ],
                    "text": "sel 0"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 640.0, 82.0, 82.0, 22.0 ],
                    "text": "ignoreclick $1"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 405.5, 19.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 18.0,
                    "htabcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-2",
                    "maxclass": "tab",
                    "multiline": 0,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 537.0, 249.0, 85.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 73.0, 8.0, 126.0, 24.0 ],
                    "rounded": 5.0,
                    "saved_attribute_attributes": {
                        "htabcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_enum": [ "stop", "start" ],
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "live.tab[9]",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.tab",
                            "parameter_type": 2,
                            "parameter_unitstyle": 9
                        }
                    },
                    "spacing_x": 1.0,
                    "spacing_y": 0.0,
                    "tabcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "tabs": [ "stop", "start" ],
                    "varname": "pad_run"
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 423.0, 220.0, 89.0, 22.0 ],
                    "text": "r m_pad_strum"
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 295.0, 220.0, 96.0, 22.0 ],
                    "text": "r m_pad_spread"
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 43.5, 220.0, 101.0, 22.0 ],
                    "text": "r m_pad_register"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 423.0, 191.0, 75.0, 22.0 ],
                    "text": "s pad_strum"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 232.0, 314.0, 70.0, 22.0 ],
                    "text": "r allnotesoff"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-panic",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 232.0, 345.0, 130.0, 22.0 ],
                    "text": "prepend allnotesoff"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 406.0, 147.0, 29.5, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 126.0, 345.0, 89.0, 22.0 ],
                    "text": "prepend tempo"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 126.0, 314.0, 49.0, 22.0 ],
                    "text": "r tempo"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "id": "obj-9",
                    "items": [ "1nd", ",", "1n", ",", "1nt", ",", "2nd", ",", "2n", ",", "2nt", ",", "4nd", ",", "4n", ",", "4nt", ",", "8nd", ",", "8n", ",", "8nt", ",", "16nd", ",", "16n", ",", "16nt", ",", "32nd", ",", "32n", ",", "32nt", ",", "64nd", ",", "64n", ",", "128n" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 443.0, 113.0, 60.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 110.00000327825546, 85.0000025331974, 51.5, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "pad_strum_div_menu"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 73.0, 345.0, 42.0, 22.0 ],
                    "text": "r roles"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 26.0, 345.0, 39.0, 22.0 ],
                    "text": "r pool"
                }
            },
            {
                "box": {
                    "id": "mc_lbl_pad",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 416.0, 292.0, 125.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 250.0, 10.0, 67.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Midi Chan",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 2
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mc_num_pad",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 416.0, 314.0, 36.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 220.9999982714653, 9.0, 36.0, 22.0 ],
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
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "pad_midi_channel"
                }
            },
            {
                "box": {
                    "id": "mc_s_pad",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 416.0, 348.0, 90.0, 22.0 ],
                    "text": "s pad_channel"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Hiragino Maru Gothic ProN",
                    "fontsize": 22.0,
                    "id": "obj-lbl-pad",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 10.0, 104.0, 67.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 7.0, 63.0, 28.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "text": "PAD",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.0 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.001740089850500226, 0.9802847504615784, 0.6389970183372498, 0.15 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.0 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "gradient": 1,
                    "id": "obj-lbl-spread",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 276.0, 133.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 113.0, 59.0, 97.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "text": "\"Extract Voicing\"",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "pad_voicing_lock_button"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-register",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 26.0, 250.0, 120.0, 22.0 ],
                    "text": "prepend register"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-spread",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 276.0, 250.0, 110.0, 22.0 ],
                    "text": "prepend spread"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-strum",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 395.0, 274.0, 110.0, 22.0 ],
                    "text": "prepend strum_div"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 26.0, 548.0, 77.0, 22.0 ],
                    "text": "unpack 0 0 0"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 27.0, 664.0, 75.0, 22.0 ],
                    "text": "noteout"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 218.0, 664.0, 75.0, 22.0 ],
                    "text": "midiout"
                }
            },
            {
                "box": {
                    "id": "obj-rtransreset-pad",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 780.0, 231.0, 100.0, 22.0 ],
                    "text": "r transport_reset"
                }
            },
            {
                "box": {
                    "id": "obj-msg-transportstart-pad",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 780.0, 256.0, 90.0, 22.0 ],
                    "text": "transportstart"
                }
            },
            {
                "box": {
                    "id": "obj-rtransstop-pad",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 231.0, 100.0, 22.0 ],
                    "text": "r transport_stop"
                }
            },
            {
                "box": {
                    "id": "obj-msg-transportstop-pad",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 256.0, 90.0, 22.0 ],
                    "text": "transportstop"
                }
            },
            {
                "box": {
                    "id": "obj-js",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 26.0, 444.0, 209.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "pad_builder.js",
                        "parameter_enable": 0
                    },
                    "text": "js pad_builder.js"
                }
            },
            {
                "box": {
                    "id": "mm-pad-velocity-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 220.0, 104.0, 22.0 ],
                    "text": "r m_pad_velocity"
                }
            },
            {
                "box": {
                    "id": "mm-pad-register-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 220.0, 118.0, 22.0 ],
                    "text": "r m_pad_register_ui"
                }
            },
            {
                "box": {
                    "id": "mm-pad-velocity-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 250.0, 118.0, 22.0 ],
                    "text": "r m_pad_velocity_ui"
                }
            },
            {
                "box": {
                    "id": "mm-pad-velocity-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 250.0, 75.0, 22.0 ],
                    "text": "prepend vel"
                }
            },
            {
                "box": {
                    "id": "mm-pad-on-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 220.0, 73.0, 22.0 ],
                    "text": "r m_pad_on"
                }
            },
            {
                "box": {
                    "id": "mm-pad-on-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 250.0, 75.0, 22.0 ],
                    "text": "prepend on"
                }
            },
            {
                "box": {
                    "id": "obj-comment-0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 36.0, 526.0, 73.0, 20.0 ],
                    "text": "0: NoteOn"
                }
            },
            {
                "box": {
                    "id": "obj-comment-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 232.0, 526.0, 100.0, 20.0 ],
                    "text": "1: NoteOn vel 0"
                }
            },
            {
                "box": {
                    "id": "pad_rchan",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 91.0, 576.0, 110.0, 22.0 ],
                    "text": "r pad_channel"
                }
            },
            {
                "box": {
                    "id": "pad-channel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 89.0, 612.0, 98.0, 22.0 ],
                    "text": "prepend channel"
                }
            },
            {
                "box": {
                    "id": "pad-polychain-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 739.0, 412.0, 96.0, 22.0 ],
                    "text": "r pad_polychain"
                }
            },
            {
                "box": {
                    "id": "pad-polychain-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 739.0, 442.0, 107.0, 22.0 ],
                    "text": "prepend polychain"
                }
            },
            {
                "box": {
                    "id": "pad-invert-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 849.0, 412.0, 109.0, 22.0 ],
                    "text": "r pad_inversion"
                }
            },
            {
                "box": {
                    "id": "pad-invert-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 849.0, 442.0, 122.0, 22.0 ],
                    "text": "prepend inversion"
                }
            },
            {
                "box": {
                    "id": "pad-quant-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 969.0, 412.0, 115.0, 22.0 ],
                    "text": "r pad_quant_setting"
                }
            },
            {
                "box": {
                    "id": "pad-quant-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 969.0, 442.0, 113.0, 22.0 ],
                    "text": "prepend pad_quant"
                }
            },
            {
                "box": {
                    "id": "pad-beat-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 684.0, 412.0, 43.0, 22.0 ],
                    "text": "r beat"
                }
            },
            {
                "box": {
                    "id": "pad-beat-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 684.0, 442.0, 35.0, 22.0 ],
                    "text": "beat"
                }
            },
            {
                "box": {
                    "id": "pad_rport",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 298.5, 612.0, 89.0, 22.0 ],
                    "text": "r midi_port_out"
                }
            },
            {
                "box": {
                    "id": "obj-pad-vel-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 126.0, 380.0, 65.0, 22.0 ],
                    "text": "r pad_vel"
                }
            },
            {
                "box": {
                    "id": "obj-pad-vel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 126.0, 410.0, 71.0, 22.0 ],
                    "text": "prepend vel"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.01 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "pad-strum-on-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 520.0, 113.0, 20.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 41.00000122189522, 86.00000256299973, 20.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "pad_strum_on"
                }
            },
            {
                "box": {
                    "id": "pad-strum-on-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 538.0, 164.0, 108.0, 22.0 ],
                    "text": "prepend strum_on"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.01 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "pad-strum-group-toggle",
                    "ignoreclick": 1,
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 640.0, 113.0, 20.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 77.00000229477882, 86.00000256299973, 20.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "pad_strum_group"
                }
            },
            {
                "box": {
                    "id": "pad-strum-group-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 640.0, 140.0, 123.0, 22.0 ],
                    "text": "prepend strum_group"
                }
            },
            {
                "box": {
                    "id": "pad-strum-feedback-index",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 423.0, 250.0, 32.0, 22.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "pad-strum-feedback-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 453.0, 164.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0, 0.980392156862745, 0.63921568627451, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "pad-velocity-display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 518.0, 29.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 242.6666738986969, 40.50000074505806, 24.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "64",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "pad_velocity_display"
                }
            },
            {
                "box": {
                    "id": "pad-velocity-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 420.0, 80.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 60.25000160932541, 40.00000074505806, 50.33333483338356, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Velocity",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "pad-register-feedback-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 43.0, 280.0, 95.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "pad-spread-feedback-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 295.0, 280.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "pad-velocity-feedback-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 280.0, 95.0, 22.0 ],
                    "text": "prepend modset"
                }
            },
            {
                "box": {
                    "id": "pad-register-select",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 26.0, 310.0, 145.0, 22.0 ],
                    "text": "prepend register_select"
                }
            },
            {
                "box": {
                    "id": "pad-spread-preview",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 310.0, 175.0, 22.0 ],
                    "text": "prepend voice_grouping_select"
                }
            },
            {
                "box": {
                    "id": "pad-velocity-preview",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 437.0, 310.0, 119.0, 22.0 ],
                    "text": "prepend vel_preview"
                }
            },
            {
                "box": {
                    "id": "pad-controls-mouse-poll",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 334.0, 35.0, 22.0 ],
                    "text": "poll"
                }
            },
            {
                "box": {
                    "id": "pad-controls-mousestate",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 10,
                    "outlettype": [ "int", "int", "int", "int", "int", "int", "int", "float", "float", "list" ],
                    "patching_rect": [ 610.0, 310.0, 72.0, 22.0 ],
                    "text": "mousestate"
                }
            },
            {
                "box": {
                    "id": "pad-controls-mouse-change",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 690.0, 310.0, 48.0, 22.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "pad-controls-mouse-up",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 745.0, 310.0, 36.0, 22.0 ],
                    "text": "sel 0"
                }
            },
            {
                "box": {
                    "id": "pad-controls-release",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 790.0, 310.0, 101.0, 22.0 ],
                    "text": "controls_release"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1 ],
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_type": "color",
                    "id": "pad-invert-toggle",
                    "items": [ "No Inversion", ",", "1st Inversion", ",", "2nd Inversion", ",", "Drop 2", ",", "Drop 2 & 3", ",", "7ths Inverted", ",", "Octaves & Inverted 3rds" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 900.0, 352.0, 135.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 208.4166738986969, 59.00000175833702, 111.5833261013031, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "No Inversion", "1st Inversion", "2nd Inversion", "Drop 2", "Drop 2 & 3", "7ths Inverted", "Octaves & Inverted 3rds" ],
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Pad Inversion",
                            "parameter_mmax": 6,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Inversion",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "pad_inversion_menu"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "pad-invert-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 925.0, 352.0, 44.0, 20.0 ],
                    "text": "Inv"
                }
            },
            {
                "box": {
                    "id": "pad-invert-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 900.0, 382.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1 ],
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_type": "color",
                    "id": "pad-quant-menu",
                    "items": [ "None", ",", "1/4", ",", "1/8" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1050.0, 352.0, 52.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 278.6666749715805, 85.0000025331974, 41.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "None", "1/4", "1/8" ],
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Pad Quantization",
                            "parameter_mmax": 2,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Pad Quant",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "pad_quant_menu"
                }
            },
            {
                "box": {
                    "id": "pad-quant-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 980.0, 382.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mm-pad-on-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 40.0, 91.0, 22.0 ],
                    "text": "r m_pad_on_ui"
                }
            },
            {
                "box": {
                    "id": "mm-pad-on-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 70.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mm-pad-spread-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 125.0, 119.0, 22.0 ],
                    "text": "r m_pad_spread_ui"
                }
            },
            {
                "box": {
                    "id": "mm-pad-strum-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 155.0, 112.0, 22.0 ],
                    "text": "r m_pad_strum_ui"
                }
            },
            {
                "box": {
                    "id": "mm-pad-inversion-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 185.0, 132.0, 22.0 ],
                    "text": "r m_pad_inversion_ui"
                }
            },
            {
                "box": {
                    "id": "pad-inversion-base-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 900.0, 385.0, 176.0, 22.0 ],
                    "text": "prepend setbase pad_inversion"
                }
            },
            {
                "box": {
                    "id": "pad-inversion-base-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1080.0, 385.0, 75.0, 22.0 ],
                    "text": "s mod_input"
                }
            },
            {
                "box": {
                    "id": "pad-voicing-lock-trigger",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 900.0, 470.0, 122.0, 22.0 ],
                    "text": "voicing_lock_toggle"
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
                    "patching_rect": [ 478.0, 19.0, 91.0, 71.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 325.0, 113.0 ],
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
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "mc_s_pad", 0 ],
                    "source": [ "mc_num_pad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-invert-ui-set", 0 ],
                    "source": [ "mm-pad-inversion-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "mm-pad-on-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-pad-on-prepend", 0 ],
                    "source": [ "mm-pad-on-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-pad-on-ui-set", 0 ],
                    "source": [ "mm-pad-on-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "mm-pad-on-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-register-feedback-set", 0 ],
                    "source": [ "mm-pad-register-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-spread-feedback-set", 0 ],
                    "source": [ "mm-pad-spread-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-strum-feedback-index", 0 ],
                    "source": [ "mm-pad-strum-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-pad-velocity-prepend", 0 ],
                    "order": 1,
                    "source": [ "mm-pad-velocity-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-velocity-display", 1 ],
                    "order": 2,
                    "source": [ "mm-pad-velocity-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-velocity-feedback-set", 0 ],
                    "order": 0,
                    "source": [ "mm-pad-velocity-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-velocity-display", 1 ],
                    "order": 1,
                    "source": [ "mm-pad-velocity-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-velocity-feedback-set", 0 ],
                    "order": 0,
                    "source": [ "mm-pad-velocity-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 2 ],
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 1 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "order": 0,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-strum", 0 ],
                    "order": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-spread-preview", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-panic", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-register-select", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-velocity-display", 1 ],
                    "order": 1,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-velocity-preview", 0 ],
                    "order": 0,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-strum-group-toggle", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "order": 0,
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-22", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "order": 1,
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-strum-group-toggle", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "order": 2,
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "order": 1,
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-controls-mouse-poll", 0 ],
                    "order": 0,
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-register", 0 ],
                    "order": 1,
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-register-feedback-set", 0 ],
                    "order": 0,
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "order": 2,
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-spread", 0 ],
                    "order": 1,
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-spread-feedback-set", 0 ],
                    "order": 0,
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-strum", 0 ],
                    "order": 1,
                    "source": [ "obj-91", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-strum-feedback-index", 0 ],
                    "order": 0,
                    "source": [ "obj-91", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-js", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-js", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-voicing-lock-trigger", 0 ],
                    "source": [ "obj-lbl-spread", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-msg-transportstart-pad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-msg-transportstop-pad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-pad-vel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pad-vel-prepend", 0 ],
                    "source": [ "obj-pad-vel-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-prepend-panic", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-prepend-register", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-prepend-spread", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-prepend-strum", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-transportstart-pad", 0 ],
                    "source": [ "obj-rtransreset-pad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-transportstop-pad", 0 ],
                    "source": [ "obj-rtransstop-pad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-beat-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-beat-msg", 0 ],
                    "source": [ "pad-beat-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-channel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-controls-mouse-up", 0 ],
                    "source": [ "pad-controls-mouse-change", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-controls-mousestate", 0 ],
                    "source": [ "pad-controls-mouse-poll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-controls-release", 0 ],
                    "source": [ "pad-controls-mouse-up", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-controls-mouse-change", 0 ],
                    "source": [ "pad-controls-mousestate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-controls-release", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-inversion-base-s", 0 ],
                    "source": [ "pad-inversion-base-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-invert-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-invert-p", 0 ],
                    "order": 1,
                    "source": [ "pad-invert-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-invert-ui-set", 0 ],
                    "order": 0,
                    "source": [ "pad-invert-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-inversion-base-p", 0 ],
                    "order": 0,
                    "source": [ "pad-invert-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-invert-p", 0 ],
                    "order": 1,
                    "source": [ "pad-invert-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-invert-toggle", 0 ],
                    "source": [ "pad-invert-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mc_num_pad", 0 ],
                    "source": [ "pad-midi-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-polychain-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-polychain-p", 0 ],
                    "source": [ "pad-polychain-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-quant-p", 0 ],
                    "source": [ "pad-quant-menu", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-quant-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-quant-p", 0 ],
                    "order": 1,
                    "source": [ "pad-quant-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-quant-ui-set", 0 ],
                    "order": 0,
                    "source": [ "pad-quant-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-quant-menu", 0 ],
                    "source": [ "pad-quant-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "pad-register-feedback-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-register-select", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "pad-spread-feedback-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-spread-preview", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-strum-feedback-set", 0 ],
                    "source": [ "pad-strum-feedback-index", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "pad-strum-feedback-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-strum-group-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-strum-group-prepend", 0 ],
                    "source": [ "pad-strum-group-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-strum-on-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "order": 0,
                    "source": [ "pad-strum-on-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-strum-on-prepend", 0 ],
                    "order": 1,
                    "source": [ "pad-strum-on-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "pad-velocity-feedback-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-velocity-preview", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "pad-voicing-lock-trigger", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 2 ],
                    "order": 0,
                    "source": [ "pad_rchan", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-channel-prepend", 0 ],
                    "order": 1,
                    "source": [ "pad_rchan", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "order": 1,
                    "source": [ "pad_rport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "order": 0,
                    "source": [ "pad_rport", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-2": [ "live.tab[9]", "live.tab", 0 ],
            "pad-invert-toggle": [ "Pad Inversion", "Inversion", 0 ],
            "pad-quant-menu": [ "Pad Quantization", "Pad Quant", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}