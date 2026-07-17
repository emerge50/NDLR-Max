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
        "rect": [ 183.0, 212.0, 651.0, 589.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 75.0, 297.0, 59.0, 22.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.14901960784313725, 0.14901960784313725, 0.14901960784313725, 0.0 ],
                    "bordercolor": [ 0.270112557475181, 0.270112486262571, 0.270112504871564, 0.0 ],
                    "fontsize": 10.0,
                    "id": "obj-27",
                    "keymode": 1,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 111.0, 262.5, 268.0, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 134.5, 272.0, 23.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "text": "1 2 3 1 2 3 4 2 3 4 5 3 4 5 6 4",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 422.0, 297.0, 41.0, 22.0 ],
                    "text": "set $1"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 422.0, 263.0, 106.0, 22.0 ],
                    "text": "route pattern_type"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 422.0, 234.0, 85.0, 22.0 ],
                    "text": "r motif1_editor"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 700.0, 318.0, 29.5, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 700.0, 250.0, 29.5, 22.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "bgfillcolor_color1": [ 0.10980392156862745, 0.10980392156862745, 0.10980392156862745, 1 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "id": "obj-22",
                    "items": [ "Montée-descente", ",", "Sauts de tierces", ",", "Pivot sur racine", ",", "Zigzag montant", ",", "Bourdon aigu", ",", "Cascade", ",", "Impairs-pairs", ",", "Alberti", ",", "Escalier d'accord", ",", "Basse + accord", ",", "Echo doublé", ",", "Miroir", ",", "Clave", ",", "Rythmique", ",", "Pentatonique feel", ",", "Paires alternées", ",", "Spirale", ",", "Marches liées", ",", "Sauts de quarte", ",", "Rotatif", ",", "User 21", ",", "User 22", ",", "User 23", ",", "User 24", ",", "User 25", ",", "User 26", ",", "User 27", ",", "User 28", ",", "User 29", ",", "User 30", ",", "User 31", ",", "User 32", ",", "User 33", ",", "User 34", ",", "User 35", ",", "User 36", ",", "User 37", ",", "User 38", ",", "Perlin M1", ",", "Perlin M2" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 700.0, 281.0, 126.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 51.0, 28.0, 120.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 988.0, 244.0, 29.5, 22.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 988.0, 303.0, 29.5, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "init-user-slot",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 320.0, 55.0, 32.0, 22.0 ],
                    "text": "21"
                }
            },
            {
                "box": {
                    "id": "init-rhythm-load",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 355.0, 55.0, 32.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "editor-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 346.0, 683.0, 88.0, 22.0 ],
                    "text": "s motif1_editor"
                }
            },
            {
                "box": {
                    "id": "editor-feedback-recv",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 461.0, 542.0, 144.0, 22.0 ],
                    "text": "r motif1_editor_feedback"
                }
            },
            {
                "box": {
                    "id": "editor-feedback-route",
                    "maxclass": "newobj",
                    "numinlets": 11,
                    "numoutlets": 11,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 457.0, 609.0, 660.0, 22.0 ],
                    "text": "route pattern_set pattern_max pattlen pattern_type pattern_slot rhythm_slot rhythm_len variation clkdiv pattern_slots_used"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "pattern_slot_marker.js",
                    "id": "pattern-slot-used-marker",
                    "maxclass": "jsui",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1015.0, 609.0, 18.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 168.0, 29.0, 16.0, 20.0 ]
                }
            },
            {
                "box": {
                    "id": "feedback-set-prefix",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 457.0, 660.0, 72.0, 22.0 ],
                    "text": "t l b"
                }
            },
            {
                "box": {
                    "id": "menu-set-prefix",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 900.0, 250.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "rhythm-slot-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 790.0, 750.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "variation-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 895.0, 740.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "state-request",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1055.0, 740.0, 70.0, 22.0 ],
                    "text": "dumpstate"
                }
            },
            {
                "box": {
                    "id": "state-request-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 980.0, 740.0, 62.0, 22.0 ],
                    "text": "delay 50"
                }
            },
            {
                "box": {
                    "id": "pattlen-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 229.0, 135.0, 59.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 211.0, 29.0, 63.0, 20.0 ],
                    "text": "Patt Len"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "pattlen-ui",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 290.0, 135.0, 40.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 264.0, 28.0, 42.0, 22.0 ],
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
                    "varname": "m1_pattlen_editor"
                }
            },
            {
                "box": {
                    "id": "pattlen-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1075.0, 591.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "prep-pattern-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 410.0, 340.0, 118.0, 22.0 ],
                    "text": "prepend pattern_set"
                }
            },
            {
                "box": {
                    "id": "prep-pattern-type",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 522.0, 129.0, 22.0 ],
                    "text": "prepend pattern_type1"
                }
            },
            {
                "box": {
                    "id": "prep-pattlen",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 255.0, 522.0, 100.0, 22.0 ],
                    "text": "prepend pattlen"
                }
            },
            {
                "box": {
                    "id": "prep-rhythm-load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 460.0, 166.0, 22.0 ],
                    "text": "prepend rhythm_pattern_load"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 65.0, 50.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 91.0, 63.0, 50.0, 22.0 ],
                    "text": "3"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "int" ],
                    "patching_rect": [ 709.0, 116.0, 29.5, 22.0 ],
                    "text": "t b i"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 657.0, 151.0, 81.0, 22.0 ],
                    "text": "sprintf %i / %i"
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
                    "gradient": 1,
                    "id": "obj-14",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 626.0, 192.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 259.0, 135.0, 47.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "8 / 16",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 2
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 214.0, 683.0, 114.0, 22.0 ],
                    "text": "s pattern_steps_M1"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 320.0, 14.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 209.25, 85.0, 29.5, 22.0 ],
                    "text": "60"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 174.0, 85.0, 29.5, 22.0 ],
                    "text": "40"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 139.0, 85.0, 29.5, 22.0 ],
                    "text": "20"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "bang", "bang", "bang", "" ],
                    "patching_rect": [ 167.0, 52.0, 54.0, 22.0 ],
                    "text": "sel 0 1 2"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 139.0, 119.0, 64.0, 22.0 ],
                    "text": "setmax $1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "htabcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "tt",
                    "maxclass": "tab",
                    "multiline": 0,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 48.0, 25.0, 252.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 4.0, 302.0, 22.0 ],
                    "rounded": 5.0,
                    "saved_attribute_attributes": {
                        "htabcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_enum": [ "CHORD", "SCALE", "CHROMATIC" ],
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m1_pattern_type",
                            "parameter_mmax": 2,
                            "parameter_modmode": 0,
                            "parameter_shortname": "type",
                            "parameter_type": 2,
                            "parameter_unitstyle": 9
                        }
                    },
                    "spacing_x": 1.0,
                    "spacing_y": 0.0,
                    "tabcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "tabs": [ "CHORD", "SCALE", "CHROMATIC" ],
                    "varname": "m1_pattern_type"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "pattern_active_highlight.js",
                    "hidden": 1,
                    "id": "pattern-active-overlay",
                    "ignoreclick": 1,
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 68.0, 159.0, 352.0, 82.0 ]
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "pattern_multislider.js",
                    "id": "mslider",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 68.0, 159.0, 352.0, 82.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 51.0, 302.0, 82.0 ]
                }
            },
            {
                "box": {
                    "id": "pattern-active-controller",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 461.0, 572.0, 178.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "pattern_active_overlay.js",
                        "parameter_enable": 0
                    },
                    "text": "js pattern_active_overlay.js"
                }
            },
            {
                "box": {
                    "id": "pattern-active-direct-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 461.0, 600.0, 118.0, 22.0 ],
                    "text": "r pattern_active_M1"
                }
            },
            {
                "box": {
                    "id": "slot_lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 742.5555555555557, 251.0, 67.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 29.0, 54.0, 20.0 ],
                    "text": "Pattern"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.15, 0.15, 0.15, 0.0 ],
                    "blinkcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "save_bng",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 621.0, 511.0, 20.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 190.0, 29.0, 20.0, 20.0 ],
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
                    "fontsize": 9.0,
                    "id": "save_lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 621.0, 489.0, 18.0, 17.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 177.0, 31.0, 20.0, 17.0 ],
                    "text": "S"
                }
            },
            {
                "box": {
                    "id": "prep_var",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 472.0, 430.0, 101.0, 22.0 ],
                    "text": "prepend variation"
                }
            },
            {
                "box": {
                    "id": "prep_clk",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 581.0, 430.0, 100.0, 22.0 ],
                    "text": "prepend clkdiv"
                }
            },
            {
                "box": {
                    "id": "pack_save",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 629.0, 575.0, 162.0, 22.0 ],
                    "text": "pack pattern_custom_save 0"
                }
            },
            {
                "box": {
                    "id": "pack_load",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 676.0, 533.0, 159.0, 22.0 ],
                    "text": "pack pattern_custom_load 0"
                }
            },
            {
                "box": {
                    "id": "msg_size_steps",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 48.0, 89.0, 80.0, 22.0 ],
                    "text": "size $1"
                }
            },
            {
                "box": {
                    "id": "mslider-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 580.0, 729.0, 50.0, 22.0 ],
                    "text": "gate 1"
                }
            },
            {
                "box": {
                    "id": "mslider-gate-close",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 580.0, 660.0, 40.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "mslider-gate-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 640.0, 660.0, 60.0, 22.0 ],
                    "text": "delay 1"
                }
            },
            {
                "box": {
                    "id": "mslider-gate-reopen",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 640.0, 700.0, 40.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "menu-auto-load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "int" ],
                    "patching_rect": [ 760.0, 318.0, 40.0, 22.0 ],
                    "text": "t b i"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "editor-feedback-route", 0 ],
                    "order": 1,
                    "source": [ "editor-feedback-recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pattern-active-controller", 0 ],
                    "order": 0,
                    "source": [ "editor-feedback-recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "feedback-set-prefix", 0 ],
                    "source": [ "editor-feedback-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "msg_size_steps", 0 ],
                    "midpoints": [ 594.7, 642.0, 426.0, 642.0, 426.0, 372.0, 375.0, 372.0, 375.0, 243.0, 60.0, 243.0, 60.0, 123.0, 33.0, 123.0, 33.0, 75.0, 57.5, 75.0 ],
                    "order": 3,
                    "source": [ "editor-feedback-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 1,
                    "source": [ "editor-feedback-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "editor-feedback-route", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "order": 1,
                    "source": [ "editor-feedback-route", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "editor-feedback-route", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "order": 2,
                    "source": [ "editor-feedback-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "editor-feedback-route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pattern-slot-used-marker", 0 ],
                    "source": [ "editor-feedback-route", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pattern-slot-used-marker", 1 ],
                    "order": 0,
                    "source": [ "editor-feedback-route", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pattlen-set", 0 ],
                    "order": 0,
                    "source": [ "editor-feedback-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rhythm-slot-set", 0 ],
                    "source": [ "editor-feedback-route", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tt", 0 ],
                    "source": [ "editor-feedback-route", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "variation-set", 0 ],
                    "source": [ "editor-feedback-route", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mslider", 0 ],
                    "order": 1,
                    "source": [ "feedback-set-prefix", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mslider-gate-close", 0 ],
                    "order": 1,
                    "source": [ "feedback-set-prefix", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mslider-gate-delay", 0 ],
                    "order": 0,
                    "source": [ "feedback-set-prefix", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "order": 0,
                    "source": [ "feedback-set-prefix", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "init-user-slot", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack_load", 1 ],
                    "source": [ "menu-auto-load", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack_load", 0 ],
                    "source": [ "menu-auto-load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "menu-set-prefix", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mslider", 0 ],
                    "source": [ "msg_size_steps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mslider-gate", 1 ],
                    "source": [ "mslider", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prep-pattern-set", 0 ],
                    "source": [ "mslider-gate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mslider-gate", 0 ],
                    "source": [ "mslider-gate-close", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mslider-gate-reopen", 0 ],
                    "source": [ "mslider-gate-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mslider-gate", 0 ],
                    "source": [ "mslider-gate-reopen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 1 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prep_clk", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "init-rhythm-load", 0 ],
                    "order": 2,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "init-user-slot", 0 ],
                    "order": 3,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "order": 1,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "order": 4,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "order": 5,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "state-request-delay", 0 ],
                    "order": 0,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tt", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "menu-set-prefix", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "menu-auto-load", 0 ],
                    "order": 2,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack_save", 1 ],
                    "order": 1,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pattern-slot-used-marker", 1 ],
                    "order": 0,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tt", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 1 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prep-pattern-set", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mslider", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-6", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-6", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "editor-send", 0 ],
                    "source": [ "pack_load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "editor-send", 0 ],
                    "source": [ "pack_save", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mslider", 0 ],
                    "source": [ "pattern-active-direct-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pattlen-ui", 0 ],
                    "source": [ "pattlen-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prep-pattlen", 0 ],
                    "source": [ "pattlen-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "editor-send", 0 ],
                    "source": [ "prep-pattern-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "editor-send", 0 ],
                    "source": [ "prep-pattern-type", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "editor-send", 0 ],
                    "source": [ "prep-pattlen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "editor-send", 0 ],
                    "source": [ "prep-rhythm-load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "editor-send", 0 ],
                    "source": [ "prep_clk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "editor-send", 0 ],
                    "source": [ "prep_var", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack_save", 0 ],
                    "source": [ "save_bng", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "editor-send", 0 ],
                    "source": [ "state-request", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "state-request", 0 ],
                    "source": [ "state-request-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 1 ],
                    "order": 0,
                    "source": [ "tt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 1,
                    "source": [ "tt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prep-pattern-type", 0 ],
                    "order": 2,
                    "source": [ "tt", 0 ]
                }
            }
        ]
    }
}