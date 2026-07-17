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
        "rect": [ 320.0, 132.0, 586.0, 790.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-17",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_pattern_editor_M2.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 117.0, 446.0, 311.0, 157.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.0, 39.0, 311.0, 157.0 ],
                    "varname": "MOTIF2",
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
                    "hidden": 1,
                    "id": "obj-15",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "b_pattern_editor_M1.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 117.0, 271.0, 311.0, 157.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.0, 39.0, 311.0, 157.0 ],
                    "varname": "MOTIF1",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 810.0, 202.0, 116.0, 22.0 ],
                    "text": "script show MOTIF2"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 810.0, 243.0, 116.0, 22.0 ],
                    "text": "script show MOTIF1"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 646.0, 293.0, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 687.0, 202.0, 111.0, 22.0 ],
                    "text": "script hide MOTIF2"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 689.0, 243.0, 116.0, 22.0 ],
                    "text": "script hide MOTIF1"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 601.0, 201.0, 44.0, 22.0 ],
                    "text": "sel 0 1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "htabcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-11",
                    "maxclass": "tab",
                    "multiline": 0,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 67.0, 94.0, 106.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 217.0, 10.0, 96.0, 22.0 ],
                    "rounded": 5.0,
                    "saved_attribute_attributes": {
                        "htabcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "valueof": {
                            "parameter_enum": [ "Motif 1", "Motif 2" ],
                            "parameter_initial": [ 1 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Patt_editor_M1-M2_sel",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Patt_editor_M1-M2_sel",
                            "parameter_type": 2,
                            "parameter_unitstyle": 9
                        }
                    },
                    "spacing_x": 1.0,
                    "spacing_y": 0.0,
                    "tabcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 1.0 ],
                    "tabs": [ "Motif 1", "Motif 2" ],
                    "varname": "Patt_editor_M1-M2_sel"
                }
            },
            {
                "box": {
                    "fontname": "Hiragino Maru Gothic ProN",
                    "fontsize": 22.0,
                    "id": "obj-4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 24.0, 13.0, 260.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.0, 7.0, 220.0, 28.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "text": "PATTERN EDITOR",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.10588235294117647, 0.10588235294117647, 0.10588235294117647, 1.0 ],
                    "border": 2,
                    "bordercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "obj-120",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 316.0, 13.0, 91.0, 71.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 325.0, 199.0 ],
                    "proportion": 0.5,
                    "rounded": 10,
                    "saved_attribute_attributes": {
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
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "midpoints": [ 819.5, 280.5078125, 660.0, 280.5078125, 660.0, 290.0, 655.5, 290.0 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "midpoints": [ 696.5, 227.0, 655.5, 227.0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "midpoints": [ 698.5, 270.30859375, 660.0, 270.30859375, 660.0, 290.0, 655.5, 290.0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "midpoints": [ 819.5, 227.0, 655.5, 227.0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "midpoints": [ 610.5, 236.0078125, 819.5, 236.0078125 ],
                    "order": 0,
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "midpoints": [ 610.5, 237.67578125, 649.83984375, 237.67578125, 649.83984375, 190.484375, 696.5, 190.484375 ],
                    "order": 1,
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "midpoints": [ 623.0, 239.0, 698.5, 239.0 ],
                    "order": 1,
                    "source": [ "obj-9", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "midpoints": [ 623.0, 232.03515625, 656.37890625, 232.03515625, 656.37890625, 183.4921875, 819.5, 183.4921875 ],
                    "order": 0,
                    "source": [ "obj-9", 1 ]
                }
            }
        ]
    }
}