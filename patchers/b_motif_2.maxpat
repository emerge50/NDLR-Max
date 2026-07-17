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
        "rect": [ 268.0, 192.0, 462.0, 478.0 ],
        "openinpresentation": 1,
        "boxes": [
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
                    "patching_rect": [ 634.5, 107.0, 29.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 196.0, 147.5, 24.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "68",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "motif2_velocity_display"
                }
            },
            {
                "box": {
                    "id": "motif2-accent-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 855.0, 161.0, 55.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 172.0, 50.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Accent",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 169.5, 100.0, 29.5, 22.0 ],
                    "text": "+ 1"
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
                    "patching_rect": [ 169.5, 49.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 58.5, 121.0, 157.5, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "M2_pattern"
                }
            },
            {
                "box": {
                    "id": "editor-input-2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 885.0, 513.0, 92.0, 22.0 ],
                    "text": "r motif2_editor"
                }
            },
            {
                "box": {
                    "id": "editor-feedback-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 44.0, 824.0, 143.0, 22.0 ],
                    "text": "s motif2_editor_feedback"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 479.75, 124.0, 29.5, 22.0 ],
                    "text": "+ 1",
                    "varname": "obj-80"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 513.0, 39.0, 22.0 ],
                    "text": "r pool",
                    "varname": "obj-78"
                }
            },
            {
                "box": {
                    "id": "pe-rscale",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ -32.0, 513.0, 60.0, 22.0 ],
                    "text": "r scale",
                    "varname": "obj-77"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 756.0, 100.0, 50.0, 22.0 ],
                    "text": "10",
                    "varname": "obj-72"
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
                    "patching_rect": [ 518.0, 101.5, 113.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 49.5, 142.0, 152.5, 30.0 ],
                    "varname": "motif2_velocity_slider"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 100.0, 50.0, 22.0 ],
                    "text": "0",
                    "varname": "obj-69"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 317.0, 100.0, 50.0, 22.0 ],
                    "text": "7",
                    "varname": "obj-68"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 220.5, 100.0, 50.0, 22.0 ],
                    "text": "20",
                    "varname": "obj-67"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 621.0, 25.0, 58.0, 22.0 ],
                    "text": "loadbang",
                    "varname": "obj-65"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1044.0, 383.0, 50.0, 22.0 ],
                    "text": "4",
                    "varname": "obj-64"
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 657.0, 190.0, 112.0, 22.0 ],
                    "text": "r m_motif2_velocity",
                    "varname": "obj-63"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 430.0, 190.0, 117.0, 22.0 ],
                    "text": "r m_motif2_variation",
                    "varname": "obj-62"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 551.0, 190.0, 102.0, 22.0 ],
                    "text": "r m_motif2_clkdiv",
                    "varname": "obj-61"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 318.0, 190.0, 108.0, 22.0 ],
                    "text": "r m_motif2_pattlen",
                    "varname": "obj-60"
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 203.0, 190.0, 109.0, 22.0 ],
                    "text": "r m_motif2_pattern",
                    "varname": "obj-59"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 84.0, 190.0, 113.0, 22.0 ],
                    "text": "r m_motif2_position",
                    "varname": "obj-58"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.5, 144.0, 97.0, 22.0 ],
                    "text": "s motif2_velocity",
                    "varname": "obj-57"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 144.0, 103.0, 22.0 ],
                    "text": "s motif2_variation",
                    "varname": "obj-56"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 499.5, 144.0, 87.0, 22.0 ],
                    "text": "s motif2_clkdiv",
                    "varname": "obj-55"
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 279.0, 144.0, 93.0, 22.0 ],
                    "text": "s motif2_pattlen",
                    "varname": "obj-54"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 181.0, 144.0, 95.0, 22.0 ],
                    "text": "s motif2_pattern",
                    "varname": "obj-53"
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 144.0, 99.0, 22.0 ],
                    "text": "s motif2_position",
                    "varname": "obj-52"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 18.0,
                    "htabcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-6",
                    "maxclass": "tab",
                    "multiline": 0,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 64.0, 48.0, 85.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 40.0, 202.0, 24.0 ],
                    "rounded": 5.0,
                    "saved_attribute_attributes": {
                        "htabcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_enum": [ "stop", "start" ],
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "live.tab[5]",
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
                    "varname": "live.tab"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 195.0, 513.0, 49.0, 22.0 ],
                    "text": "r tempo",
                    "varname": "obj-49"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 72.5, 513.0, 70.0, 22.0 ],
                    "text": "r allnotesoff",
                    "varname": "obj-48"
                }
            },
            {
                "box": {
                    "id": "mc_lbl_m1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1043.0, 355.0, 97.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 147.0, 13.0, 65.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Midi Chan",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "obj-47"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mc_num_m1",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1115.0, 383.0, 36.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 116.5, 12.0, 36.0, 22.0 ],
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
                    "varname": "motif2_midi_channel"
                }
            },
            {
                "box": {
                    "id": "mc_s_m1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1115.0, 414.0, 83.0, 22.0 ],
                    "text": "s m2_channel",
                    "varname": "obj-45"
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
                    "id": "obj-24",
                    "items": [ "Forward", ",", "Reverse", ",", "Ping-pong", ",", "Ping-pong hold", ",", "Odds / evens", ",", "Random" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 366.5, 100.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 58.5, 95.5, 157.5, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "M2_variation"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-26",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 266.5, 100.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 178.5, 70.0, 37.5, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_longname": "motif2_pattlen",
                            "parameter_mmax": 16.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "motif2_pattlen",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "motif2_pattlen"
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
                    "id": "obj-33",
                    "items": [ "Very Low", ",", "Low", ",", "Mid", ",", "High", ",", "Very High" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 19.0, 104.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 58.5, 70.0, 73.5, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "M2_position"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 366.5, 76.0, 84.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 96.5, 58.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Variation",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "obj-40"
                }
            },
            {
                "box": {
                    "id": "obj-ma88c137c",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 72.5, 544.0, 114.0, 22.0 ],
                    "text": "prepend allnotesoff",
                    "varname": "obj-39"
                }
            },
            {
                "box": {
                    "id": "obj-m5c52e4b9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 55.0, 75.0, 80.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 71.0, 54.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Position",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "obj-38"
                }
            },
            {
                "box": {
                    "id": "obj-mc39a261a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 167.5, 76.0, 83.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 121.5, 50.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Pattern",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "obj-37"
                }
            },
            {
                "box": {
                    "id": "obj-mef253b93",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 264.5, 76.0, 90.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 129.5, 71.0, 54.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Patt Len",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "obj-36"
                }
            },
            {
                "box": {
                    "id": "obj-mc44a1864",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 67.0, 223.0, 97.0, 22.0 ],
                    "text": "prepend position",
                    "varname": "obj-34"
                }
            },
            {
                "box": {
                    "id": "obj-m399c1d75",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 168.0, 223.0, 168.0, 22.0 ],
                    "text": "prepend pattern_custom_load",
                    "varname": "obj-33"
                }
            },
            {
                "box": {
                    "id": "obj-mb0266ece",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 267.0, 223.0, 92.0, 22.0 ],
                    "text": "prepend pattlen",
                    "varname": "obj-32"
                }
            },
            {
                "box": {
                    "id": "obj-mdaf84b1a",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 367.0, 223.0, 114.0, 22.0 ],
                    "text": "prepend variation",
                    "varname": "obj-31"
                }
            },
            {
                "box": {
                    "id": "obj-m4035969f",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 487.0, 223.0, 86.0, 22.0 ],
                    "text": "prepend clkdiv",
                    "varname": "obj-30"
                }
            },
            {
                "box": {
                    "id": "obj-mbecfe632",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 195.0, 544.0, 89.0, 22.0 ],
                    "text": "prepend tempo",
                    "varname": "obj-29"
                }
            },
            {
                "box": {
                    "id": "obj-m46e402c7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 694.0, 184.0, 742.0, 738.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 121.0, 173.0, 29.5, 22.0 ],
                                    "text": "t i 0",
                                    "varname": "obj-9"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 121.0, 138.0, 25.0, 22.0 ],
                                    "text": "iter",
                                    "varname": "obj-8"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 50.0, 80.0, 160.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "filename": "motif_builder.js",
                                        "parameter_enable": 0
                                    },
                                    "text": "js motif_builder.js",
                                    "varname": "obj-7"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 50.0, 178.0, 47.0, 22.0 ],
                                    "text": "unpack",
                                    "varname": "obj-6"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 238.0, 49.0, 22.0 ],
                                    "text": "noteout",
                                    "varname": "obj-5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 0,
                                    "patching_rect": [ 119.0, 238.0, 49.0, 22.0 ],
                                    "text": "noteout",
                                    "varname": "obj-4"
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 30.0, 30.0, 30.0 ],
                                    "varname": "obj-1"
                                }
                            },
                            {
                                "box": {
                                    "id": "m1_rchan",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 228.0, 84.0, 81.0, 22.0 ],
                                    "text": "r m2_channel",
                                    "varname": "obj-2"
                                }
                            },
                            {
                                "box": {
                                    "id": "m2_rport",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 313.0, 84.0, 89.0, 22.0 ],
                                    "text": "r midi_port_out",
                                    "varname": "obj-1[1]"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-uiout",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 180.0, 230.0, 30.0, 30.0 ],
                                    "varname": "obj-0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 2 ],
                                    "order": 1,
                                    "source": [ "m1_rchan", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 2 ],
                                    "order": 0,
                                    "source": [ "m1_rchan", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "order": 1,
                                    "source": [ "m2_rport", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "order": 0,
                                    "source": [ "m2_rport", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-2", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-uiout", 0 ],
                                    "source": [ "obj-2", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 1 ],
                                    "source": [ "obj-4", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 1 ],
                                    "source": [ "obj-5", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 48.0, 675.0, 58.0, 22.0 ],
                    "text": "p p_motif",
                    "varname": "obj-28"
                }
            },
            {
                "box": {
                    "id": "mm-m2-gate-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 780.0, 190.0, 100.0, 22.0 ],
                    "text": "r m_motif2_gate"
                }
            },
            {
                "box": {
                    "id": "mm-m2-gate-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 815.0, 223.0, 82.0, 22.0 ],
                    "text": "prepend gate"
                }
            },
            {
                "box": {
                    "id": "mm-m2-accent-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 885.0, 190.0, 112.0, 22.0 ],
                    "text": "r m_motif2_accent"
                }
            },
            {
                "box": {
                    "id": "mm-m2-accent-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 905.0, 223.0, 92.0, 22.0 ],
                    "text": "prepend accent"
                }
            },
            {
                "box": {
                    "id": "mm-m2-rhythm-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1018.5, 324.0, 113.0, 22.0 ],
                    "text": "r m_motif2_rhythm"
                }
            },
            {
                "box": {
                    "id": "mm-m2-rhythm-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1002.0, 220.0, 170.0, 22.0 ],
                    "text": "prepend rhythm_pattern_load"
                }
            },
            {
                "box": {
                    "id": "mm-m2-on-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1177.0, 220.0, 90.0, 22.0 ],
                    "text": "r m_motif2_on"
                }
            },
            {
                "box": {
                    "id": "mm-m2-on-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1177.0, 254.0, 75.0, 22.0 ],
                    "text": "prepend on"
                }
            },
            {
                "box": {
                    "id": "mm-m2-mod-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1273.0, 220.0, 96.0, 22.0 ],
                    "text": "r m_motif2_mod"
                }
            },
            {
                "box": {
                    "id": "obj-vh585016",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 518.0, 76.0, 92.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 147.0, 52.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Velocity",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "obj-27"
                }
            },
            {
                "box": {
                    "id": "obj-vhb3f79b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 702.5, 76.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 197.5, 63.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Humanize",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "obj-26"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-vha7cc03",
                    "maxclass": "number",
                    "maximum": 10,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 702.5, 100.0, 55.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 75.0, 196.5, 31.5, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_longname": "motif2_humanize",
                            "parameter_mmax": 10.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "motif2_humanize",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "motif2_humanize"
                }
            },
            {
                "box": {
                    "id": "obj-vhd0ee22",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 584.0, 223.0, 110.0, 22.0 ],
                    "text": "prepend velocity",
                    "varname": "obj-23"
                }
            },
            {
                "box": {
                    "id": "obj-vh99af43",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 703.0, 223.0, 110.0, 22.0 ],
                    "text": "prepend humanize",
                    "varname": "obj-22"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "motif2-rhythm-ui",
                    "maxclass": "number",
                    "maximum": 40,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 730.0, 513.0, 42.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 178.5, 196.5, 37.5, 22.0 ],
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
                    "varname": "motif2_rhythm"
                }
            },
            {
                "box": {
                    "id": "motif2-rhythm-select-trigger",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 910.0, 513.0, 42.0, 22.0 ],
                    "text": "t i 1"
                }
            },
            {
                "box": {
                    "id": "motif2-rhythm-editor-select-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 910.0, 557.0, 138.0, 22.0 ],
                    "text": "s rhythm_editor_select"
                }
            },
            {
                "box": {
                    "id": "motif2-rhythm-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 725.0, 488.0, 52.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 129.5, 197.5, 50.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Rhythm",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "motif2-rhythm-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 730.0, 544.0, 170.0, 22.0 ],
                    "text": "prepend rhythm_pattern_load"
                }
            },
            {
                "box": {
                    "id": "motif2-rhythm-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 730.0, 459.0, 72.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "motif2-rhythm-feedback-route",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 7,
                    "outlettype": [ "", "", "", "", "", "", "" ],
                    "patching_rect": [ 48.0, 723.0, 513.0, 22.0 ],
                    "text": "route rhythm_len rhythm_slot pattern_slot pattlen variation clkdiv"
                }
            },
            {
                "box": {
                    "id": "motif2-pattern-index-feedback",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 171.66666666666669, 754.0, 32.0, 22.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "motif2-pattern-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 171.66666666666669, 785.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "motif2-pattlen-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 295.0, 785.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "motif2-variation-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 377.3333333333333, 785.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "motif2-variation-ui-to-engine",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 367.0, 190.0, 32.0, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "motif2-variation-engine-to-ui",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 377.3333333333333, 755.0, 32.0, 22.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "motif2-clkdiv-index-feedback",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 459.6666666666667, 754.0, 32.0, 22.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "motif2-clkdiv-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 459.6666666666667, 785.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "motif2-id-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 454.0, 459.0, 125.0, 22.0 ],
                    "text": "loadmess motif_id 2"
                }
            },
            {
                "box": {
                    "id": "motif2-rhythm-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 777.5, 513.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "fontname": "Hiragino Maru Gothic ProN",
                    "fontsize": 22.0,
                    "id": "obj-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 24.0, 13.0, 260.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 9.0, 9.0, 107.0, 28.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "text": "MOTIF 2",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "obj-7"
                }
            },
            {
                "box": {
                    "id": "obj-121",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 291.0, 513.0, 50.0, 22.0 ],
                    "text": "r beat",
                    "varname": "obj-5"
                }
            },
            {
                "box": {
                    "id": "obj-122",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 291.0, 544.0, 89.0, 22.0 ],
                    "text": "prepend beat",
                    "varname": "obj-4"
                }
            },
            {
                "box": {
                    "id": "obj-tr1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 386.5, 513.0, 110.0, 22.0 ],
                    "text": "r transport_reset",
                    "varname": "obj-3"
                }
            },
            {
                "box": {
                    "id": "obj-tr2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 386.5, 544.0, 90.0, 22.0 ],
                    "text": "transportstart",
                    "varname": "obj-2"
                }
            },
            {
                "box": {
                    "id": "obj-ts1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 499.5, 513.0, 100.0, 22.0 ],
                    "text": "r transport_stop",
                    "varname": "obj-1"
                }
            },
            {
                "box": {
                    "id": "obj-ts2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 499.5, 544.0, 90.0, 22.0 ],
                    "text": "transportstop",
                    "varname": "obj-0"
                }
            },
            {
                "box": {
                    "id": "m2-bar-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 660.0, 103.0, 22.0 ],
                    "text": "r motif1_bar_ticks"
                }
            },
            {
                "box": {
                    "id": "m2-bar-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 690.0, 143.0, 22.0 ],
                    "text": "prepend motif1_bar_ticks"
                }
            },
            {
                "box": {
                    "id": "m2-offset-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 790.0, 660.0, 84.0, 22.0 ],
                    "text": "r motif2_offset"
                }
            },
            {
                "box": {
                    "id": "m2-offset-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 790.0, 690.0, 85.0, 22.0 ],
                    "text": "prepend offset"
                }
            },
            {
                "box": {
                    "id": "m2-midi-note-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1002.0, 526.0, 151.0, 22.0 ],
                    "text": "r motif2_pattern_midi_note"
                }
            },
            {
                "box": {
                    "id": "m2-midi-note-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1002.0, 557.0, 152.0, 22.0 ],
                    "text": "prepend pattern_midi_note"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "motif2-gate-ui",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 5,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1050.0, 190.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 178.5, 171.0, 37.5, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_longname": "motif2_gate",
                            "parameter_mmin": 5.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "motif2_gate",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "motif2_gate"
                }
            },
            {
                "box": {
                    "id": "motif2-gate-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1105.0, 190.0, 50.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 143.0, 172.0, 38.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Gate",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "motif2-gate-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1050.0, 128.0, 83.0, 22.0 ],
                    "text": "loadmess 102"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "motif2-accent-ui",
                    "maxclass": "number",
                    "maximum": 10,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 912.0, 160.0, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_longname": "motif2_accent",
                            "parameter_mmax": 10.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "motif2_accent",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "motif2_accent"
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
                    "fontsize": 12.0,
                    "id": "motif2-accent-menu",
                    "items": [ "Rhythm Vel", ",", "Humanize", ",", "Motif Vel", ",", "Beat 1", ",", "Beat 2", ",", "Beat 3", ",", "Beat 4", ",", "Beat 5", ",", "Beat 6", ",", "Beat 7" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1010.0, 160.0, 150.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 58.0, 170.0, 91.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "bgfillcolor": {
                            "expression": "themecolor.live_lcd_bg"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "motif2_accent_menu"
                }
            },
            {
                "box": {
                    "id": "motif2-accent-menu-to-value",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1010.0, 194.0, 32.0, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "motif2-accent-value-to-index",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1070.0, 194.0, 32.0, 22.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "motif2-accent-menu-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1080.0, 250.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "motif2-accent-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 912.0, 128.0, 72.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "id": "mm-pattern-mod-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 131.0, 276.0, 126.0, 22.0 ],
                    "text": "prepend pattern_mod"
                }
            },
            {
                "box": {
                    "id": "mm-m2-gate-base-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1002.0, 277.0, 100.0, 22.0 ],
                    "text": "s motif2_gate"
                }
            },
            {
                "box": {
                    "id": "mm-m2-accent-base-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1225.0, 250.0, 100.0, 22.0 ],
                    "text": "s motif2_accent"
                }
            },
            {
                "box": {
                    "id": "mm-m2-rhythm-base-s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 994.0, 301.0, 100.0, 22.0 ],
                    "text": "s motif2_rhythm"
                }
            },
            {
                "box": {
                    "id": "mm-m2-velocity-modset-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 657.0, 250.0, 100.0, 22.0 ],
                    "text": "prepend modset"
                }
            },
            {
                "box": {
                    "id": "mm-m2-velocity-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 780.0, 190.0, 130.0, 22.0 ],
                    "text": "r m_motif2_velocity_ui"
                }
            },
            {
                "box": {
                    "id": "mm-m2-velocity-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 780.0, 220.0, 100.0, 22.0 ],
                    "text": "prepend modset"
                }
            },
            {
                "box": {
                    "id": "mm-m2-on-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1150.0, 120.0, 112.0, 22.0 ],
                    "text": "r m_motif2_on_ui"
                }
            },
            {
                "box": {
                    "id": "mm-m2-on-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1150.0, 150.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mm-m2-position-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1150.0, 190.0, 154.0, 22.0 ],
                    "text": "r m_motif2_position_ui"
                }
            },
            {
                "box": {
                    "id": "mm-m2-position-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1150.0, 220.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mm-m2-pattern-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1168.5, 294.0, 147.0, 22.0 ],
                    "text": "r m_motif2_pattern_ui"
                }
            },
            {
                "box": {
                    "id": "mm-m2-pattern-ui-index",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1168.5, 324.0, 32.0, 22.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "mm-m2-pattern-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1168.5, 354.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mm-m2-pattlen-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 922.0, 429.0, 147.0, 22.0 ],
                    "text": "r m_motif2_pattlen_ui"
                }
            },
            {
                "box": {
                    "id": "mm-m2-pattlen-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 922.0, 459.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mm-m2-variation-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1150.0, 442.0, 161.0, 22.0 ],
                    "text": "r m_motif2_variation_ui"
                }
            },
            {
                "box": {
                    "id": "mm-m2-variation-ui-index",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1150.0, 472.0, 32.0, 22.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "mm-m2-variation-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1150.0, 490.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mm-m2-gate-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1330.0, 120.0, 126.0, 22.0 ],
                    "text": "r m_motif2_gate_ui"
                }
            },
            {
                "box": {
                    "id": "mm-m2-gate-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1330.0, 150.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mm-m2-accent-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1330.0, 190.0, 140.0, 22.0 ],
                    "text": "r m_motif2_accent_ui"
                }
            },
            {
                "box": {
                    "id": "mm-m2-accent-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1330.0, 220.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "mm-m2-rhythm-ui-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1330.0, 260.0, 140.0, 22.0 ],
                    "text": "r m_motif2_rhythm_ui"
                }
            },
            {
                "box": {
                    "id": "mm-m2-rhythm-ui-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1330.0, 290.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "border": 2,
                    "bordercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-120",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 411.0, 3.0, 91.0, 71.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 220.0, 221.5 ],
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
                    "varname": "obj-6"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "editor-input-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "m2-bar-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m2-bar-p", 0 ],
                    "source": [ "m2-bar-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "m2-midi-note-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m2-midi-note-p", 0 ],
                    "source": [ "m2-midi-note-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "m2-offset-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m2-offset-p", 0 ],
                    "source": [ "m2-offset-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mc_s_m1", 0 ],
                    "order": 0,
                    "source": [ "mc_num_m1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 1 ],
                    "order": 1,
                    "source": [ "mc_num_m1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
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
                    "destination": [ "mm-m2-accent-ui-set", 0 ],
                    "order": 0,
                    "source": [ "mm-m2-accent-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-accent-value-to-index", 0 ],
                    "order": 1,
                    "source": [ "mm-m2-accent-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-accent-ui", 0 ],
                    "source": [ "mm-m2-accent-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
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
                    "destination": [ "mm-m2-gate-ui-set", 0 ],
                    "source": [ "mm-m2-gate-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-gate-ui", 0 ],
                    "source": [ "mm-m2-gate-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "mm-m2-mod-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "mm-m2-on-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-on-p", 0 ],
                    "source": [ "mm-m2-on-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-on-ui-set", 0 ],
                    "source": [ "mm-m2-on-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "mm-m2-on-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-pattern-ui-set", 0 ],
                    "source": [ "mm-m2-pattern-ui-index", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-pattern-ui-index", 0 ],
                    "source": [ "mm-m2-pattern-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "mm-m2-pattern-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-pattlen-ui-set", 0 ],
                    "source": [ "mm-m2-pattlen-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "mm-m2-pattlen-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-position-ui-set", 0 ],
                    "source": [ "mm-m2-position-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "mm-m2-position-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
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
                    "destination": [ "mm-m2-rhythm-ui-set", 0 ],
                    "source": [ "mm-m2-rhythm-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-rhythm-ui", 0 ],
                    "source": [ "mm-m2-rhythm-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-variation-ui-set", 0 ],
                    "source": [ "mm-m2-variation-ui-index", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-variation-ui-index", 0 ],
                    "source": [ "mm-m2-variation-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "mm-m2-variation-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "mm-m2-velocity-modset-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-velocity-ui-set", 0 ],
                    "order": 0,
                    "source": [ "mm-m2-velocity-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-velocity-display", 1 ],
                    "order": 1,
                    "source": [ "mm-m2-velocity-ui-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "mm-m2-velocity-ui-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "mm-pattern-mod-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-accent-ui", 0 ],
                    "source": [ "motif2-accent-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-accent-menu-to-value", 0 ],
                    "source": [ "motif2-accent-menu", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-accent-menu", 0 ],
                    "source": [ "motif2-accent-menu-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-accent-ui", 0 ],
                    "source": [ "motif2-accent-menu-to-value", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-accent-base-s", 0 ],
                    "order": 0,
                    "source": [ "motif2-accent-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-accent-p", 0 ],
                    "order": 2,
                    "source": [ "motif2-accent-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-accent-value-to-index", 0 ],
                    "order": 1,
                    "source": [ "motif2-accent-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-accent-menu-set", 0 ],
                    "source": [ "motif2-accent-value-to-index", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-clkdiv-set", 0 ],
                    "source": [ "motif2-clkdiv-index-feedback", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-gate-ui", 0 ],
                    "source": [ "motif2-gate-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-gate-base-s", 0 ],
                    "order": 0,
                    "source": [ "motif2-gate-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-gate-p", 0 ],
                    "order": 1,
                    "source": [ "motif2-gate-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "motif2-id-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-pattern-set", 0 ],
                    "source": [ "motif2-pattern-index-feedback", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "motif2-pattern-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "motif2-pattlen-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-clkdiv-index-feedback", 0 ],
                    "source": [ "motif2-rhythm-feedback-route", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-pattern-index-feedback", 0 ],
                    "source": [ "motif2-rhythm-feedback-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-pattlen-set", 0 ],
                    "source": [ "motif2-rhythm-feedback-route", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-rhythm-set", 0 ],
                    "source": [ "motif2-rhythm-feedback-route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-variation-engine-to-ui", 0 ],
                    "source": [ "motif2-rhythm-feedback-route", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-rhythm-ui", 0 ],
                    "source": [ "motif2-rhythm-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "motif2-rhythm-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-rhythm-editor-select-send", 0 ],
                    "source": [ "motif2-rhythm-select-trigger", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-rhythm-prepend", 0 ],
                    "source": [ "motif2-rhythm-select-trigger", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-rhythm-ui", 0 ],
                    "source": [ "motif2-rhythm-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-rhythm-base-s", 0 ],
                    "order": 0,
                    "source": [ "motif2-rhythm-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-rhythm-select-trigger", 0 ],
                    "order": 1,
                    "source": [ "motif2-rhythm-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-variation-set", 0 ],
                    "source": [ "motif2-variation-engine-to-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "motif2-variation-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "order": 0,
                    "source": [ "motif2-variation-ui-to-engine", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mdaf84b1a", 0 ],
                    "order": 1,
                    "source": [ "motif2-variation-ui-to-engine", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mc44a1864", 0 ],
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mc_num_m1", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "order": 0,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "order": 4,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "order": 3,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "order": 2,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "order": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-121", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-122", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "order": 0,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m399c1d75", 0 ],
                    "order": 1,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ma88c137c", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "order": 1,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vhd0ee22", 0 ],
                    "order": 2,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-velocity-display", 1 ],
                    "order": 0,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vha7cc03", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "order": 1,
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 1 ],
                    "order": 0,
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-variation-ui-to-engine", 0 ],
                    "order": 1,
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "order": 0,
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "order": 0,
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "order": 1,
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mb0266ece", 0 ],
                    "order": 2,
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mbecfe632", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "order": 0,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mc44a1864", 0 ],
                    "order": 1,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m4035969f", 0 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-6", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-m2-velocity-modset-p", 0 ],
                    "order": 0,
                    "source": [ "obj-95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vhd0ee22", 0 ],
                    "order": 2,
                    "source": [ "obj-95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pad-velocity-display", 1 ],
                    "order": 1,
                    "source": [ "obj-95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mdaf84b1a", 0 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m4035969f", 0 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mb0266ece", 0 ],
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-pattern-mod-p", 0 ],
                    "source": [ "obj-99", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-m399c1d75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-m4035969f", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "editor-feedback-2", 0 ],
                    "order": 1,
                    "source": [ "obj-m46e402c7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "motif2-rhythm-feedback-route", 0 ],
                    "order": 0,
                    "source": [ "obj-m46e402c7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-ma88c137c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-mb0266ece", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-mbecfe632", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-mc44a1864", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-mdaf84b1a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tr2", 0 ],
                    "source": [ "obj-tr1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-tr2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ts2", 0 ],
                    "source": [ "obj-ts1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-ts2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-vh99af43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 1 ],
                    "order": 0,
                    "source": [ "obj-vha7cc03", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vh99af43", 0 ],
                    "order": 1,
                    "source": [ "obj-vha7cc03", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "obj-vhd0ee22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m46e402c7", 0 ],
                    "source": [ "pe-rscale", 0 ]
                }
            }
        ]
    }
}