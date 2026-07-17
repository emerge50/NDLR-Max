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
        "rect": [ 543.0, 168.0, 436.0, 720.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 45.0, 619.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "slider_0-100.js",
                    "id": "obj-15",
                    "varname": "perlin_brightness_slider",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 57.5, 670.0, 113.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 69.000002, 272.0, 168.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "mod-perlin-lum-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 350.0, 663.0, 98.0, 22.0 ],
                    "text": "r m_perlin_lum"
                }
            },
            {
                "box": {
                    "id": "mod-perlin-lum-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 458.0, 663.0, 95.0, 22.0 ],
                    "text": "prepend modset"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 388.0, 605.0, 103.0, 22.0 ],
                    "text": "route rhythm_rate"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 544.0, 600.0, 103.0, 22.0 ],
                    "text": "route rhythm_rate"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 544.0, 636.0, 127.0, 22.0 ],
                    "text": "prepend rhythm_rate2"
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 388.0, 636.0, 127.0, 22.0 ],
                    "text": "prepend rhythm_rate1"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 544.0, 569.0, 70.0, 22.0 ],
                    "text": "r ndlr_rate2"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 388.0, 569.0, 70.0, 22.0 ],
                    "text": "r ndlr_rate1"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 567.0, 507.0, 41.0, 22.0 ],
                    "text": "set $1"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 580.0, 470.0, 116.0, 22.0 ],
                    "text": "route pattern_type 2"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 451.0, 466.0, 113.0, 22.0 ],
                    "text": "route pattern_type1"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 462.0, 501.0, 41.0, 22.0 ],
                    "text": "set $1"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 561.5, 425.0, 85.0, 22.0 ],
                    "text": "r motif2_editor"
                }
            },
            {
                "box": {
                    "id": "editor-send",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 451.0, 425.0, 85.0, 22.0 ],
                    "text": "r motif1_editor"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 665.0, 16.0, 33.0, 22.0 ],
                    "text": "== 0"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 665.0, 59.0, 82.0, 22.0 ],
                    "text": "ignoreclick $1"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 388.0, 16.0, 33.0, 22.0 ],
                    "text": "== 0"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 388.0, 59.0, 82.0, 22.0 ],
                    "text": "ignoreclick $1"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 314.0, 274.0, 30.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 460.0, 29.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "M1",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 342.0, 274.0, 30.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 485.0, 25.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "M2",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 745.0, 152.0, 129.0, 22.0 ],
                    "text": "prepend pattern_type2"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 9.5,
                    "htabcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-21",
                    "maxclass": "tab",
                    "multiline": 0,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 745.0, 103.0, 252.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 484.0, 203.0, 22.0 ],
                    "rounded": 5.0,
                    "saved_attribute_attributes": {
                        "htabcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_enum": [ "CHORD", "SCALE", "CHROMATIC" ],
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m1_pattern_type[3]",
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
                    "varname": "m1_pattern_type[1]"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 451.0, 152.0, 129.0, 22.0 ],
                    "text": "prepend pattern_type1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 9.5,
                    "htabcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "tt",
                    "maxclass": "tab",
                    "multiline": 0,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 451.0, 103.0, 252.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 458.0, 203.0, 22.0 ],
                    "rounded": 5.0,
                    "saved_attribute_attributes": {
                        "htabcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_enum": [ "CHORD", "SCALE", "CHROMATIC" ],
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "m1_pattern_type[2]",
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
                    "id": "obj-26",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1200.0, 230.0, 50.0, 22.0 ],
                    "text": "71"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 608.0, 230.0, 50.0, 22.0 ],
                    "text": "638"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 519.0, 230.0, 50.0, 22.0 ],
                    "text": "11"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 433.0, 230.0, 50.0, 22.0 ],
                    "text": "20"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 354.0, 230.0, 50.0, 22.0 ],
                    "text": "38"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 272.0, 230.0, 50.0, 22.0 ],
                    "text": "20"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 194.0, 230.0, 50.0, 22.0 ],
                    "text": "293"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 103.0, 230.0, 50.0, 22.0 ],
                    "text": "591"
                }
            },
            {
                "box": {
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-130",
                    "varname": "perlin_motif1_enabled",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 220.0, 129.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 182.0, 42.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-132",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 220.0, 103.0, 30.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 179.5, 20.0, 29.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "M1",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-133",
                    "varname": "perlin_motif2_enabled",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 320.0, 129.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 207.0, 42.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-135",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 103.0, 30.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 207.0, 20.0, 25.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "M2",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-160",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 220.0, 40.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-161",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 220.0, 70.0, 30.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-162",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 320.0, 40.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-163",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 320.0, 70.0, 30.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-171",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1500.0, 40.0, 70.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1195.0, 258.0, 60.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.5, 430.0000000000001, 72.5, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Resoltion",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-pn607570",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 254.0, 258.0, 50.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.5, 299.1666666666667, 39.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Zoom",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-pnf9dfa9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 258.0, 46.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.5, 325.33333333333337, 39.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Ruff",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-pn8da4ea",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 579.0, 258.0, 79.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.5, 351.50000000000006, 39.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Seed",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "motif1-pnoise-spacing-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 341.0, 258.0, 60.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 377.66666666666674, 56.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Spacing",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "motif1-pnoise-persistence-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 494.0, 258.0, 75.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.5, 403.8333333333334, 72.5, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Persistance",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "slider_0-100.js",
                    "id": "obj-4",
                    "jsarguments": [ 0, 999 ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 579.0, 280.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 69.000002, 350.50000000000006, 168.0, 22.0 ],
                    "varname": "perlin_seed_slider"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "ndlr_perlin_jsui.js",
                    "id": "obj-46",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 10,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 112.0, 396.0, 220.0, 220.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.5, 68.0, 220.0, 200.0 ],
                    "varname": "m_perlin_mod"
                }
            },
            {
                "box": {
                    "id": "perlin-brightness-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 112.0, 622.0, 40.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 273.0, 38.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Lum.",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "perlin-brightness-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 222.0, 663.0, 117.0, 22.0 ],
                    "text": "prepend brightness"
                }
            },
            {
                "box": {
                    "id": "obj-200",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 59.0, 347.0, 110.0, 22.0 ],
                    "text": "r m_perlin_mod"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "slider_0-100.js",
                    "id": "obj-50",
                    "jsarguments": [ 1, 100 ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 254.0, 280.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 69.000002, 298.1666666666667, 168.0, 22.0 ],
                    "varname": "perlin_zoom_slider"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "slider_0-100.js",
                    "id": "obj-49",
                    "jsarguments": [ 0, 100 ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 341.0, 280.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 69.000002, 376.66666666666674, 168.0, 22.0 ],
                    "varname": "perlin_spacing_slider"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "slider_0-100.js",
                    "id": "obj-48",
                    "jsarguments": [ 1, 100 ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 421.0, 280.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 69.000002, 324.33333333333337, 168.0, 22.0 ],
                    "varname": "perlin_ruff_slider"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "slider_0-100.js",
                    "id": "obj-47",
                    "jsarguments": [ 1, 100 ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 501.0, 280.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 69.000002, 402.8333333333334, 168.0, 22.0 ],
                    "varname": "perlin_persistence_slider"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 894.0, 280.0, 102.0, 22.0 ],
                    "text": "r motif1_clkdiv",
                    "varname": "obj-61[1]"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0, 280.0, 102.0, 22.0 ],
                    "text": "r motif2_clkdiv",
                    "varname": "obj-61"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0, 311.0, 93.0, 22.0 ],
                    "text": "prepend clkdiv2"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 903.0, 311.0, 93.0, 22.0 ],
                    "text": "prepend clkdiv1"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 579.0, 311.0, 82.0, 22.0 ],
                    "text": "prepend seed"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 18.0,
                    "htabcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-7",
                    "maxclass": "tab",
                    "multiline": 0,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 119.0, 129.0, 85.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 42.0, 171.0, 24.0 ],
                    "rounded": 5.0,
                    "saved_attribute_attributes": {
                        "htabcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_enum": [ "stop", "start" ],
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "live.tab[17]",
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
                    "varname": "live.tab[1]"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 783.0, 280.0, 91.0, 22.0 ],
                    "text": "r motif2_pattlen"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 783.0, 311.0, 116.0, 22.0 ],
                    "text": "prepend patternlen2"
                }
            },
            {
                "box": {
                    "fontname": "Hiragino Maru Gothic ProN",
                    "fontsize": 22.0,
                    "id": "obj-9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 22.0, 260.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 10.0, 171.0, 28.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "text": "PERLIN NOISE",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "linecount": 31,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 693.0, 369.0, 492.0, 422.0 ],
                    "text": "Messages acceptes dans l'inlet :\n  setx <1-1000>          Position X dans le champ de bruit (encodeur X)\n  sety <1-1000>          Position Y dans le champ de bruit (encodeur Y)\n  zoom <1-100>           Zoom avant/arriere dans le champ de bruit\n  spc  <0-100>           Spacing : separation entre les chemins Motif1/Motif2\n  ruff <1-100>           Ruffness : amplifie les differences entre pas\n  per  <1-100>           Persistence : melange plus ou moins d'octaves fines\n  seed <0-999>           Graine du champ de bruit (change tout le terrain)\n  patternlen1 <1-16>     Longueur de pattern du Motif 1 (Length, independante)\n  patternlen2 <1-16>     Longueur de pattern du Motif 2 (Length, independante)\n  clkdiv1 <1-21>         Division d'horloge du Motif 1 (index table musicale,\n                         96 ticks/noire ; voir tableau en tete du .js). Pilote\n                         par 's motif1_clkdiv' ailleurs dans le projet.\n  clkdiv2 <1-21>         Division d'horloge du Motif 2 (meme table), pilote\n                         par 's motif2_clkdiv'.\n  motif1 <0/1>           Active/desactive le Motif 1 (sortie + avancement)\n  motif2 <0/1>           Active/desactive le Motif 2 (sortie + avancement)\n  running <0/1>          Start/Stop LOCAL de ce module (ne suffit pas seul)\n  startstop <0/1>        Etat du transport GLOBAL (96 ppqn). L'avancement d'un\n                         Motif ne progresse que si running=1 ET startstop=1\n                         ET ce Motif est actif (motif1/motif2). Les toggles\n                         Motif1/Motif2 sont mis a 1 par defaut au chargement.\n  beat                   Tick d'horloge globale (96 ppqn) ; avance d'un pas\n                         selon la table clkdiv1/clkdiv2 si running, startstop\n                         ET le Motif concerne sont tous actifs.\n  reset                  Remet les compteurs de pas a 0 (relecture depuis le debut)\n  rescells <10-80>       Resolution de la grille (purement cosmetique)\n  bang                   Force le recalcul + renvoi du pattern + redessin\n\nSorties : outlet 0/1 = liste du pattern complet (Motif 1 / Motif 2),\nrenvoyee a chaque changement de parametre ou d'activation de Motif."
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 665.0, 280.0, 91.0, 22.0 ],
                    "text": "r motif1_pattlen"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 12.0, 732.0, 282.0, 22.0 ],
                    "text": "12 9 7 11 8 5 1 11"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 312.0, 692.0, 275.0, 22.0 ],
                    "text": "7 17 27 17 30 23 20 27"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 665.0, 311.0, 116.0, 22.0 ],
                    "text": "prepend patternlen1"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "slider_0-100.js",
                    "id": "obj-45",
                    "jsarguments": [ 10, 80 ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1195.0, 280.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 69.000002, 429.0000000000001, 168.0, 22.0 ],
                    "varname": "perlin_resolution_slider"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1195.0, 311.0, 97.0, 22.0 ],
                    "text": "prepend rescells"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1096.0, 311.0, 96.0, 22.0 ],
                    "text": "prepend running"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 501.0, 311.0, 73.0, 22.0 ],
                    "text": "prepend per"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 421.0, 311.0, 73.0, 22.0 ],
                    "text": "prepend ruff"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 341.0, 311.0, 75.0, 22.0 ],
                    "text": "prepend spc"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 254.0, 311.0, 85.0, 22.0 ],
                    "text": "prepend zoom"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 172.0, 311.0, 78.0, 22.0 ],
                    "text": "prepend sety"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 89.0, 311.0, 78.0, 22.0 ],
                    "text": "prepend setx"
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
                    "patching_rect": [ 547.0, 22.0, 91.0, 71.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 237.0, 513.0 ],
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
                    "id": "obj-131",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 220.0, 159.0, 89.0, 22.0 ],
                    "text": "prepend motif1"
                }
            },
            {
                "box": {
                    "id": "obj-134",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 320.0, 159.0, 89.0, 22.0 ],
                    "text": "prepend motif2"
                }
            },
            {
                "box": {
                    "id": "obj-140",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1300.0, 280.0, 80.0, 22.0 ],
                    "text": "r startstop"
                }
            },
            {
                "box": {
                    "id": "obj-141",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1300.0, 311.0, 102.0, 22.0 ],
                    "text": "prepend startstop"
                }
            },
            {
                "box": {
                    "id": "obj-142",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1410.0, 280.0, 60.0, 22.0 ],
                    "text": "r beat"
                }
            },
            {
                "box": {
                    "id": "obj-143",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1410.0, 311.0, 79.0, 22.0 ],
                    "text": "prepend beat"
                }
            },
            {
                "box": {
                    "id": "obj-180",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1520.0, 280.0, 110.0, 22.0 ],
                    "text": "s motif1_editor"
                }
            },
            {
                "box": {
                    "id": "obj-181",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1520.0, 311.0, 110.0, 22.0 ],
                    "text": "s motif2_editor"
                }
            },
            {
                "box": {
                    "id": "obj-182",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1520.0, 254.0, 359.0, 20.0 ],
                    "text": "-> Pattern Editor (pattlen/pattern_set/pattern_custom_save 39-40)"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "editor-send", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mod-perlin-lum-set", 0 ],
                    "source": [ "mod-perlin-lum-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "mod-perlin-lum-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tt", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 0 ],
                    "order": 1,
                    "source": [ "obj-130", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "order": 0,
                    "source": [ "obj-130", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-131", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-134", 0 ],
                    "order": 1,
                    "source": [ "obj-133", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "order": 0,
                    "source": [ "obj-133", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-134", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-141", 0 ],
                    "source": [ "obj-140", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-141", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-143", 0 ],
                    "source": [ "obj-142", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-143", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perlin-brightness-prepend", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-161", 0 ],
                    "source": [ "obj-160", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-130", 0 ],
                    "source": [ "obj-161", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-163", 0 ],
                    "source": [ "obj-162", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-133", 0 ],
                    "source": [ "obj-163", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "order": 7,
                    "source": [ "obj-171", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "order": 6,
                    "source": [ "obj-171", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "order": 5,
                    "source": [ "obj-171", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "order": 4,
                    "source": [ "obj-171", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "order": 3,
                    "source": [ "obj-171", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "order": 2,
                    "source": [ "obj-171", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "order": 1,
                    "source": [ "obj-171", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "order": 0,
                    "source": [ "obj-171", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-200", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tt", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 1,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 1 ],
                    "order": 0,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 1 ],
                    "order": 0,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "order": 1,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-180", 0 ],
                    "source": [ "obj-46", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-181", 0 ],
                    "source": [ "obj-46", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-46", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-46", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-46", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-46", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 1 ],
                    "source": [ "obj-46", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 1 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 1 ],
                    "order": 0,
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "order": 1,
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 1 ],
                    "order": 0,
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "order": 1,
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "order": 0,
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "order": 1,
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 1 ],
                    "order": 0,
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "order": 1,
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-7", 0 ]
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
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "perlin-brightness-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "tt", 0 ]
                }
            }
        ]
    }
}
