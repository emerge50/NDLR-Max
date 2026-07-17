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
        "rect": [ 59.0, 114.0, 640.0, 420.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "channel-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.5, 148.0, 60.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 159.0, 9.0, 60.0, 20.0 ],
                    "text": "MIDI Ch"
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
                    "patching_rect": [ 20.0, 7.0, 341.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 5.0, 5.0, 123.0, 28.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "text": "ROTATOR",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "enable",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 418.0, 96.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.0, 34.0, 22.0, 22.0 ],
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
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "rotator_enable"
                }
            },
            {
                "box": {
                    "id": "enable-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 448.0, 96.0, 50.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 33.0, 35.0, 52.0, 20.0 ],
                    "text": "Enable"
                }
            },
            {
                "box": {
                    "id": "enable-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 418.0, 187.0, 94.0, 22.0 ],
                    "text": "prepend enable"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "channel",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.5, 203.0, 42.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 129.0, 8.0, 38.0, 22.0 ],
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
                    "varname": "rotator_channel"
                }
            },
            {
                "box": {
                    "id": "channel-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.5, 170.0, 85.0, 22.0 ],
                    "text": "loadmess 16"
                }
            },
            {
                "box": {
                    "id": "channel-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 257.0, 187.0, 101.0, 22.0 ],
                    "text": "prepend channel"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.15, 0.15, 0.15, 0.0 ],
                    "blinkcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "reload",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 67.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 99.0, 34.0, 22.0, 22.0 ],
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
                    "id": "reload-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 67.0, 110.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 122.0, 35.0, 90.0, 20.0 ],
                    "text": "Reload Patt 40"
                }
            },
            {
                "box": {
                    "id": "reload-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 97.0, 101.0, 22.0 ],
                    "text": "reload_pattern"
                }
            },
            {
                "box": {
                    "id": "raw-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 410.0, 155.0, 102.0, 22.0 ],
                    "text": "r ndlr_raw_midi"
                }
            },
            {
                "box": {
                    "id": "key-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 523.0, 155.0, 40.0, 22.0 ],
                    "text": "r key"
                }
            },
            {
                "box": {
                    "id": "key-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 523.0, 187.0, 76.0, 22.0 ],
                    "text": "prepend key"
                }
            },
            {
                "box": {
                    "id": "mode-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 607.0, 155.0, 48.0, 22.0 ],
                    "text": "r mode"
                }
            },
            {
                "box": {
                    "id": "mode-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 607.0, 187.0, 86.0, 22.0 ],
                    "text": "prepend mode"
                }
            },
            {
                "box": {
                    "id": "panic-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 155.0, 78.0, 22.0 ],
                    "text": "r allnotesoff"
                }
            },
            {
                "box": {
                    "id": "panic-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 187.0, 112.0, 22.0 ],
                    "text": "prepend allnotesoff"
                }
            },
            {
                "box": {
                    "id": "engine",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 317.0, 252.0, 137.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "rotator_engine.js",
                        "parameter_enable": 0
                    },
                    "text": "js rotator_engine.js"
                }
            },
            {
                "box": {
                    "id": "unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 317.0, 288.0, 85.0, 22.0 ],
                    "text": "unpack i i i"
                }
            },
            {
                "box": {
                    "id": "noteout",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 317.0, 364.0, 85.0, 22.0 ],
                    "text": "noteout"
                }
            },
            {
                "box": {
                    "id": "port-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 232.0, 318.0, 89.0, 22.0 ],
                    "text": "r midi_port_out"
                }
            },
            {
                "box": {
                    "id": "rot-channel-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.5, 236.0, 146.0, 22.0 ],
                    "text": "s ndlr_transpose_channel"
                }
            },
            {
                "box": {
                    "id": "rot-channel-receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 257.0, 155.0, 145.0, 22.0 ],
                    "text": "r ndlr_transpose_channel"
                }
            },
            {
                "box": {
                    "id": "rot-channel-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 128.0, 170.0, 76.0, 22.0 ],
                    "text": "prepend set"
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
                    "patching_rect": [ 508.0, 49.0, 91.0, 71.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 220.0, 60.0 ],
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
                    "destination": [ "rot-channel-send", 0 ],
                    "source": [ "channel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "channel", 0 ],
                    "source": [ "channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 0 ],
                    "source": [ "channel-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "enable-p", 0 ],
                    "source": [ "enable", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 0 ],
                    "source": [ "enable-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "unpack", 0 ],
                    "source": [ "engine", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 0 ],
                    "source": [ "key-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "key-p", 0 ],
                    "source": [ "key-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 0 ],
                    "source": [ "mode-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mode-p", 0 ],
                    "source": [ "mode-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 0 ],
                    "source": [ "panic-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "panic-p", 0 ],
                    "source": [ "panic-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "noteout", 0 ],
                    "source": [ "port-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 0 ],
                    "source": [ "raw-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "reload-msg", 0 ],
                    "source": [ "reload", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 0 ],
                    "source": [ "reload-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "channel-p", 0 ],
                    "order": 0,
                    "source": [ "rot-channel-receive", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rot-channel-set", 0 ],
                    "order": 1,
                    "source": [ "rot-channel-receive", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "channel", 0 ],
                    "source": [ "rot-channel-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "noteout", 2 ],
                    "source": [ "unpack", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "noteout", 1 ],
                    "source": [ "unpack", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "noteout", 0 ],
                    "source": [ "unpack", 0 ]
                }
            }
        ]
    }
}