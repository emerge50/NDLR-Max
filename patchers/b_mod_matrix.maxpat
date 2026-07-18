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
        "rect": [ 163.0, 206.0, 652.0, 307.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 767.0, 815.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 722.6666902303696, 1060.0, 129.0, 22.0 ],
                    "text": "prepend slot 1 midi_cc"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 722.6666902303696, 1090.0, 129.0, 22.0 ],
                    "text": "prepend slot 2 midi_cc"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 722.6666902303696, 1120.0, 129.0, 22.0 ],
                    "text": "prepend slot 3 midi_cc"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 722.6666902303696, 1150.0, 129.0, 22.0 ],
                    "text": "prepend slot 4 midi_cc"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 722.6666902303696, 1180.0, 129.0, 22.0 ],
                    "text": "prepend slot 5 midi_cc"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 722.6666902303696, 1210.0, 129.0, 22.0 ],
                    "text": "prepend slot 6 midi_cc"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 722.6666902303696, 1240.0, 129.0, 22.0 ],
                    "text": "prepend slot 7 midi_cc"
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 722.6666902303696, 1270.0, 129.0, 22.0 ],
                    "text": "prepend slot 8 midi_cc"
                }
            },
            {
                "box": {
                    "id": "obj-120",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1352.6667069792747, 843.1666682958603, 330.0, 22.0 ],
                    "text": "script sendbox mm_s1ds presentation_rect 118. 70.5 86. 20."
                }
            },
            {
                "box": {
                    "id": "obj-121",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1352.6667069792747, 872.5000025033951, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-122",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1390.666708111763, 817.1666675209999, 336.0, 22.0 ],
                    "text": "script sendbox mm_s1ds presentation_rect 118. 70.5 157. 22."
                }
            },
            {
                "box": {
                    "id": "obj-123",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
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
                        "rect": [ 457.0, 465.0, 793.0, 234.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-19",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 137.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-17",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 96.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 51.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 107.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 107.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 85.0, 80.0, 41.0, 22.0 ],
                                    "text": "sel 45"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-43",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 85.0, 39.99997794628143, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-44",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 195.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-40", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-41", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-38", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1314.6667058467865, 788.5, 95.0, 22.0 ],
                    "text": "p MidiCC_CH_1"
                }
            },
            {
                "box": {
                    "id": "obj-116",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1283.333371579647, 926.0000275969505, 323.0, 22.0 ],
                    "text": "script sendbox mm_s2ds presentation_rect 118. 94. 86. 22."
                }
            },
            {
                "box": {
                    "id": "obj-117",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1283.333371579647, 955.3333618044853, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-118",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1321.3333727121353, 900.0000268220901, 330.0, 22.0 ],
                    "text": "script sendbox mm_s2ds presentation_rect 118. 94. 157. 22."
                }
            },
            {
                "box": {
                    "id": "obj-119",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
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
                        "rect": [ 457.0, 465.0, 793.0, 234.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-19",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 137.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-17",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 96.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 51.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 107.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 107.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 85.0, 80.0, 41.0, 22.0 ],
                                    "text": "sel 45"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-43",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 85.0, 39.99997794628143, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-44",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 195.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-40", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-41", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-38", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1245.3333704471588, 871.3333593010902, 95.0, 22.0 ],
                    "text": "p MidiCC_CH_2"
                }
            },
            {
                "box": {
                    "id": "obj-112",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1212.0000361204147, 1010.0000301599503, 336.0, 22.0 ],
                    "text": "script sendbox mm_s3ds presentation_rect 118. 117.5 86. 22."
                }
            },
            {
                "box": {
                    "id": "obj-113",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1212.0000361204147, 1039.333364367485, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-114",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1250.000037252903, 984.0000293850899, 342.0, 22.0 ],
                    "text": "script sendbox mm_s3ds presentation_rect 118. 117.5 157. 22."
                }
            },
            {
                "box": {
                    "id": "obj-115",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
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
                        "rect": [ 457.0, 465.0, 793.0, 234.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-19",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 137.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-17",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 96.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 51.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 107.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 107.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 85.0, 80.0, 41.0, 22.0 ],
                                    "text": "sel 45"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-43",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 85.0, 39.99997794628143, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-44",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 195.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-40", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-41", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-38", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1174.0000349879265, 955.33336186409, 95.0, 22.0 ],
                    "text": "p MidiCC_CH_3"
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1146.6667008399963, 1094.0000326037407, 330.0, 22.0 ],
                    "text": "script sendbox mm_s4ds presentation_rect 118. 141. 86. 22."
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1146.6667008399963, 1123.3333668112755, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-110",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1184.6667019724846, 1068.0000318288803, 336.0, 22.0 ],
                    "text": "script sendbox mm_s4ds presentation_rect 118. 141. 157. 22."
                }
            },
            {
                "box": {
                    "id": "obj-111",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
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
                        "rect": [ 457.0, 465.0, 793.0, 234.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-19",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 137.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-17",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 96.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 51.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 107.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 107.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 85.0, 80.0, 41.0, 22.0 ],
                                    "text": "sel 45"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-43",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 85.0, 39.99997794628143, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-44",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 195.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-40", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-41", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-38", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1108.666699707508, 1039.3333643078804, 95.0, 22.0 ],
                    "text": "p MidiCC_CH_4"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1078.6666988134384, 1178.6667017936707, 336.0, 22.0 ],
                    "text": "script sendbox mm_s5ds presentation_rect 118. 164.5 86. 22."
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1078.6666988134384, 1208.0000360012054, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1116.6666999459267, 1152.6667010188103, 343.0, 22.0 ],
                    "text": "script sendbox mm_s5ds presentation_rect 118. 164.5 157. 22."
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
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
                        "rect": [ 457.0, 465.0, 793.0, 234.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-19",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 137.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-17",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 96.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 51.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 107.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 107.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 85.0, 80.0, 41.0, 22.0 ],
                                    "text": "sel 45"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-43",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 85.0, 39.99997794628143, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-44",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 195.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-40", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-41", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-38", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1040.6666976809502, 1124.0000334978104, 95.0, 22.0 ],
                    "text": "p MidiCC_CH_5"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1002.6666965484619, 1263.3333709836006, 330.0, 22.0 ],
                    "text": "script sendbox mm_s6ds presentation_rect 118. 188. 86. 22."
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1002.6666965484619, 1292.6667051911354, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1040.6666976809502, 1237.3333702087402, 336.0, 22.0 ],
                    "text": "script sendbox mm_s6ds presentation_rect 118. 188. 157. 22."
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
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
                        "rect": [ 457.0, 465.0, 793.0, 234.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-19",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 137.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-17",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 96.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 51.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 107.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 107.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 85.0, 80.0, 41.0, 22.0 ],
                                    "text": "sel 45"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-43",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 85.0, 39.99997794628143, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-44",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 195.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-40", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-41", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-38", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 964.6666954159737, 1208.6667026877403, 95.0, 22.0 ],
                    "text": "p MidiCC_CH_6"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 934.666694521904, 1346.6666657924652, 336.0, 22.0 ],
                    "text": "script sendbox mm_s7ds presentation_rect 118. 211.5 86. 22."
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 934.666694521904, 1376.0, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 972.6666956543922, 1320.6666650176048, 342.0, 22.0 ],
                    "text": "script sendbox mm_s7ds presentation_rect 118. 211.5 157. 22."
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
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
                        "rect": [ 457.0, 465.0, 793.0, 234.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-19",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 137.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-17",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 96.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 51.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 107.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 107.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 85.0, 80.0, 41.0, 22.0 ],
                                    "text": "sel 45"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-43",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 85.0, 39.99997794628143, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-44",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 195.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-40", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-41", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-38", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 896.6666933894157, 1291.999997496605, 95.0, 22.0 ],
                    "text": "p MidiCC_CH_7"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 473.0, 1554.0, 29.5, 22.0 ],
                    "text": "!- 1"
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 473.0, 1585.0, 61.0, 22.0 ],
                    "text": "hidden $1"
                }
            },
            {
                "box": {
                    "id": "obj-92",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 473.0, 1628.0, 29.5, 22.0 ],
                    "text": "!- 1"
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 473.0, 1659.0, 61.0, 22.0 ],
                    "text": "hidden $1"
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 473.0, 1481.0, 29.5, 22.0 ],
                    "text": "!- 1"
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 473.0, 1512.0, 61.0, 22.0 ],
                    "text": "hidden $1"
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 473.0, 1419.0, 29.5, 22.0 ],
                    "text": "!- 1"
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 473.0, 1450.0, 61.0, 22.0 ],
                    "text": "hidden $1"
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 473.0, 1355.0, 29.5, 22.0 ],
                    "text": "!- 1"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 473.0, 1386.0, 61.0, 22.0 ],
                    "text": "hidden $1"
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 473.0, 1293.0, 29.5, 22.0 ],
                    "text": "!- 1"
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 473.0, 1324.0, 61.0, 22.0 ],
                    "text": "hidden $1"
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 473.0, 1229.0, 29.5, 22.0 ],
                    "text": "!- 1"
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 473.0, 1260.0, 61.0, 22.0 ],
                    "text": "hidden $1"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 473.0, 1165.0, 29.5, 22.0 ],
                    "text": "!- 1"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 473.0, 1196.0, 61.0, 22.0 ],
                    "text": "hidden $1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-59",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 959.0, 1047.5000264644623, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.0, 235.0, 38.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s8ds_CC"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-60",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 959.0, 1018.5000264644623, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.0, 211.5, 38.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s7ds_CC"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-61",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 959.0, 992.0000264644623, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.0, 188.0, 38.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s6ds_CC"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-62",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 959.0, 966.5000264644623, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.0, 164.5, 38.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s5ds_CC"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-63",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 959.0, 940.5000264644623, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.0, 141.0, 38.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s4ds_CC"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-64",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 959.0, 914.0000264644623, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.0, 117.5, 38.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s3ds_CC"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-65",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 959.0, 888.0000264644623, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.0, 94.0, 38.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s2ds_CC"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-66",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 959.0, 866.000030040741, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.0, 71.5, 38.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s1ds_CC"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 831.0, 1431.0, 330.0, 22.0 ],
                    "text": "script sendbox mm_s8ds presentation_rect 118. 235. 86. 22."
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 831.0, 1460.0, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 869.0, 1405.0, 336.0, 22.0 ],
                    "text": "script sendbox mm_s8ds presentation_rect 118. 235. 157. 22."
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-46",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 963.5, 842.6666917800903, 41.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 209.0, 49.5, 24.0, 18.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "CC",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
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
                        "rect": [ 457.0, 465.0, 793.0, 234.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-19",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 137.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-17",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 96.0, 195.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 51.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 107.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 107.0, 108.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 146.0, 55.0, 22.0 ],
                                    "text": "hidden 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 85.0, 80.0, 41.0, 22.0 ],
                                    "text": "sel 45"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-43",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 85.0, 39.99997794628143, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-44",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 195.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-40", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-41", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-38", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 793.0, 1376.0, 95.0, 22.0 ],
                    "text": "p MidiCC_CH_8"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "rslider.js",
                    "id": "obj-37",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 823.500012293458, 792.8333125561476, 166.99997541308403, 17.666687443852425 ],
                    "presentation": 1,
                    "presentation_rect": [ 311.0, 234.99999999999994, 208.0, 22.0 ],
                    "varname": "mm_s8range"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "rslider.js",
                    "id": "obj-36",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 823.500012293458, 772.8333125561476, 166.99997541308403, 17.666687443852425 ],
                    "presentation": 1,
                    "presentation_rect": [ 311.0, 211.57142857142853, 208.0, 22.0 ],
                    "varname": "mm_s7range"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "rslider.js",
                    "id": "obj-35",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 823.500012293458, 752.8333125561476, 166.99997541308403, 17.666687443852425 ],
                    "presentation": 1,
                    "presentation_rect": [ 311.0, 188.1428571428571, 208.5, 22.0 ],
                    "varname": "mm_s6range"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "rslider.js",
                    "id": "obj-34",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 823.500012293458, 731.3333125561476, 166.99997541308403, 17.666687443852425 ],
                    "presentation": 1,
                    "presentation_rect": [ 311.0, 164.7142857142857, 208.5, 22.0 ],
                    "varname": "mm_s5range"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "rslider.js",
                    "id": "obj-33",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 823.500012293458, 712.8333125561476, 166.99997541308403, 17.666687443852425 ],
                    "presentation": 1,
                    "presentation_rect": [ 311.0, 141.28571428571428, 208.5, 22.0 ],
                    "varname": "mm_s4range"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "rslider.js",
                    "id": "obj-32",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 823.500012293458, 690.6666562780738, 166.99997541308403, 17.666687443852425 ],
                    "presentation": 1,
                    "presentation_rect": [ 311.0, 117.85714285714286, 208.5, 22.0 ],
                    "varname": "mm_s3range"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "rslider.js",
                    "id": "obj-30",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 823.500012293458, 667.500021353364, 166.99997541308403, 17.666687443852425 ],
                    "presentation": 1,
                    "presentation_rect": [ 311.0, 94.42857142857143, 208.5, 22.0 ],
                    "varname": "mm_s2range"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "rslider.js",
                    "id": "obj-31",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 820.500012204051, 648.5, 169.999975502491, 17.50002135336399 ],
                    "presentation": 1,
                    "presentation_rect": [ 311.0, 71.0, 208.5, 22.0 ],
                    "varname": "mm_s1range"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-15",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1012.0, 1013.33336353302, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 237.5, 235.0, 30.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s8ds_CC_Ch"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-14",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1012.0, 984.0000293254852, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 238.5, 212.0, 30.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s7ds_CC_Ch"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-12",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1012.0, 964.0000287294388, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 238.5, 188.0, 30.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s6ds_CC_Ch"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-11",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1012.0, 944.0000281333923, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 238.5, 164.5, 30.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s5ds_CC_Ch"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-8",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1013.3333333730698, 925.3333609104156, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 238.5, 141.0, 30.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s4ds_CC_Ch"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-7",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1012.0, 904.0000269412994, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 238.5, 117.5, 30.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s3ds_CC_Ch"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "obj-1",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1012.0, 888.0000264644623, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 238.5, 94.0, 30.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s2ds_CC_Ch"
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
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s1low_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 752.0, 650.0, 32.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 304.5, 73.5, 25.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "0",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s1low_display"
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
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s2low_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 752.0, 670.0, 32.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 304.5, 96.78571428571429, 25.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "0",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s2low_display"
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
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s3low_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 752.0, 690.0, 32.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 304.5, 120.07142857142858, 25.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "0",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s3low_display"
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
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s4low_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 752.0, 710.0, 32.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 304.5, 143.35714285714286, 25.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "0",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s4low_display"
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
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s5low_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 752.0, 730.0, 32.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 304.5, 166.64285714285714, 25.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "0",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s5low_display"
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
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s6low_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 752.0, 750.0, 32.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 304.5, 189.92857142857142, 25.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "0",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s6low_display"
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
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s7low_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 752.0, 770.0, 32.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 304.5, 213.2142857142857, 25.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "0",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s7low_display"
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
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s8low_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 752.0, 790.0, 32.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 304.5, 236.49999999999997, 25.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "0",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s8low_display"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mm_s1a",
                    "maxclass": "number",
                    "maximum": 100,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 913.3333605527878, 857.3333588838577, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 268.5, 71.5, 36.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s1a"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mm_s2a",
                    "maxclass": "number",
                    "maximum": 100,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 913.3333605527878, 877.3333594799042, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 268.5, 94.0, 36.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s2a"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mm_s3a",
                    "maxclass": "number",
                    "maximum": 100,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 913.3333605527878, 897.3333600759506, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 268.5, 117.5, 36.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s3a"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mm_s4a",
                    "maxclass": "number",
                    "maximum": 100,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 913.3333605527878, 917.3333606719971, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 268.5, 141.0, 36.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s4a"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mm_s5a",
                    "maxclass": "number",
                    "maximum": 100,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 913.3333605527878, 937.3333612680435, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 268.5, 164.5, 36.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s5a"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mm_s6a",
                    "maxclass": "number",
                    "maximum": 100,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 913.3333605527878, 957.33336186409, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 268.5, 188.0, 36.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s6a"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mm_s7a",
                    "maxclass": "number",
                    "maximum": 100,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 913.3333605527878, 977.3333624601364, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 268.5, 212.0, 36.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s7a"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mm_s8a",
                    "maxclass": "number",
                    "maximum": 100,
                    "minimum": 0,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 913.3333605527878, 997.3333630561829, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 268.5, 235.0, 36.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s8a"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 328.0, 154.0, 54.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 540.0, 48.5, 160.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Output",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.106, 0.106, 0.106, 0.0 ],
                    "ghostbar": 15,
                    "id": "viz_ms1",
                    "ignoreclick": 1,
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 22.0, 1107.0, 280.0, 50.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 540.0, 71.0, 160.0, 22.0 ],
                    "shadowperbar": 0,
                    "signed": 1,
                    "size": 160,
                    "slidercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "thickness": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.106, 0.106, 0.106, 0.0 ],
                    "ghostbar": 15,
                    "id": "viz_ms2",
                    "ignoreclick": 1,
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 22.0, 1162.0, 280.0, 50.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 540.0, 94.85714285714286, 160.0, 22.0 ],
                    "shadowperbar": 0,
                    "signed": 1,
                    "size": 160,
                    "slidercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "thickness": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.106, 0.106, 0.106, 0.0 ],
                    "ghostbar": 15,
                    "id": "viz_ms3",
                    "ignoreclick": 1,
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 22.0, 1217.0, 280.0, 50.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 540.0, 118.71428571428572, 160.0, 22.0 ],
                    "shadowperbar": 0,
                    "signed": 1,
                    "size": 160,
                    "slidercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "thickness": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.106, 0.106, 0.106, 0.0 ],
                    "ghostbar": 15,
                    "id": "viz_ms4",
                    "ignoreclick": 1,
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 22.0, 1272.0, 280.0, 50.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 540.0, 142.57142857142858, 160.0, 22.0 ],
                    "shadowperbar": 0,
                    "signed": 1,
                    "size": 160,
                    "slidercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "thickness": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.106, 0.106, 0.106, 0.0 ],
                    "ghostbar": 15,
                    "id": "viz_ms5",
                    "ignoreclick": 1,
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 22.0, 1327.0, 280.0, 50.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 540.0, 166.42857142857144, 160.0, 22.0 ],
                    "shadowperbar": 0,
                    "signed": 1,
                    "size": 160,
                    "slidercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "thickness": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.106, 0.106, 0.106, 0.0 ],
                    "ghostbar": 15,
                    "id": "viz_ms6",
                    "ignoreclick": 1,
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 22.0, 1382.0, 280.0, 50.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 540.0, 190.2857142857143, 160.0, 22.0 ],
                    "shadowperbar": 0,
                    "signed": 1,
                    "size": 160,
                    "slidercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "thickness": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.106, 0.106, 0.106, 0.0 ],
                    "ghostbar": 15,
                    "id": "viz_ms7",
                    "ignoreclick": 1,
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 22.0, 1437.0, 280.0, 50.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 540.0, 214.14285714285717, 160.0, 20.0 ],
                    "shadowperbar": 0,
                    "signed": 1,
                    "size": 160,
                    "slidercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "thickness": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.106, 0.106, 0.106, 0.0 ],
                    "ghostbar": 15,
                    "id": "viz_ms8",
                    "ignoreclick": 1,
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 22.0, 1492.0, 280.0, 50.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 540.0, 236.00000000000003, 160.0, 22.0 ],
                    "shadowperbar": 0,
                    "signed": 1,
                    "size": 160,
                    "slidercolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "thickness": 1
                }
            },
            {
                "box": {
                    "fontsize": 13.0,
                    "id": "cmt0001",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 10.0, -29.0, 287.0, 21.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "style": "bold",
                    "text": "MODULATION MATRIX — input via r mod_input",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj0002",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 9,
                    "outlettype": [ "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 187.0, 308.0, 160.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "mod_matrix.js",
                        "parameter_enable": 0
                    },
                    "text": "js mod_matrix.js"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s1high_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 997.0000297129154, 650.0, 28.99997028708458, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 512.0, 73.5, 24.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "100",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s1high_display"
                }
            },
            {
                "box": {
                    "id": "mm_s1pv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1067.0, 117.0, 122.0, 22.0 ],
                    "text": "prepend slot 1 low"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s2high_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 997.0, 670.0, 29.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 512.0, 96.78571428571428, 24.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "100",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s2high_display"
                }
            },
            {
                "box": {
                    "id": "mm_s2pv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 614.0, 659.6739130434787, 122.0, 22.0 ],
                    "text": "prepend slot 2 low"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s3high_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 997.0, 690.0, 29.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 512.0, 120.07142857142856, 24.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "100",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s3high_display"
                }
            },
            {
                "box": {
                    "id": "mm_s3pv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 614.0, 679.6739130434787, 122.0, 22.0 ],
                    "text": "prepend slot 3 low"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s4high_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 997.0, 710.0, 29.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 512.0, 143.35714285714283, 24.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "100",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s4high_display"
                }
            },
            {
                "box": {
                    "id": "mm_s4pv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 614.0, 699.6739130434787, 122.0, 22.0 ],
                    "text": "prepend slot 4 low"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s5high_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 997.0, 730.0, 29.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 512.0, 166.6428571428571, 24.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "100",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s5high_display"
                }
            },
            {
                "box": {
                    "id": "mm_s5pv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 614.0, 719.6739130434787, 122.0, 22.0 ],
                    "text": "prepend slot 5 low"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s6high_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 997.0, 750.0, 29.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 512.0, 189.9285714285714, 24.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "100",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s6high_display"
                }
            },
            {
                "box": {
                    "id": "mm_s6pv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 614.0, 739.6739130434787, 122.0, 22.0 ],
                    "text": "prepend slot 6 low"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s7high_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 997.0, 770.0, 29.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 512.0, 213.21428571428567, 24.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "100",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s7high_display"
                }
            },
            {
                "box": {
                    "id": "mm_s7pv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 614.0, 759.6739130434787, 122.0, 22.0 ],
                    "text": "prepend slot 7 low"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgcolor2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0 ],
                    "bgfillcolor_color1": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 0.01 ],
                    "bgfillcolor_color2": [ 0.208680531953877, 0.20868047419733, 0.208680489290039, 1 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 9.0,
                    "gradient": 1,
                    "id": "mm_s8high_display",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 997.0, 790.0, 29.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 512.0, 236.49999999999994, 24.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "100",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "varname": "mm_s8high_display"
                }
            },
            {
                "box": {
                    "id": "mm_s8pv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 614.0, 779.6739130434787, 122.0, 22.0 ],
                    "text": "prepend slot 8 low"
                }
            },
            {
                "box": {
                    "id": "mm_s1ph",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1056.0, 648.5, 126.0, 22.0 ],
                    "text": "prepend slot 1 high"
                }
            },
            {
                "box": {
                    "id": "mm_s2ph",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1040.0, 186.0, 126.0, 22.0 ],
                    "text": "prepend slot 2 high"
                }
            },
            {
                "box": {
                    "id": "mm_s3ph",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1056.0, 688.5, 126.0, 22.0 ],
                    "text": "prepend slot 3 high"
                }
            },
            {
                "box": {
                    "id": "mm_s4ph",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1056.0, 708.5, 126.0, 22.0 ],
                    "text": "prepend slot 4 high"
                }
            },
            {
                "box": {
                    "id": "mm_s5ph",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1056.0, 728.5, 126.0, 22.0 ],
                    "text": "prepend slot 5 high"
                }
            },
            {
                "box": {
                    "id": "mm_s6ph",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1056.0, 748.5, 126.0, 22.0 ],
                    "text": "prepend slot 6 high"
                }
            },
            {
                "box": {
                    "id": "mm_s7ph",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1056.0, 768.5, 126.0, 22.0 ],
                    "text": "prepend slot 7 high"
                }
            },
            {
                "box": {
                    "id": "mm_s8ph",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1056.0, 788.5, 126.0, 22.0 ],
                    "text": "prepend slot 8 high"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "mm-cc-channel-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1012.0, 842.6666917800903, 39.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 234.0, 49.5, 39.0, 18.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "CC Ch",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "fontsize": 12.0,
                    "hidden": 1,
                    "htricolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "id": "mm-cc-channel",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "mousefilter": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1012.0, 864.0000257492065, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 238.5, 71.5, 30.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "htricolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s1ds_CC_Ch"
                }
            },
            {
                "box": {
                    "id": "mm-cc-channel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 679.0, 38.0, 149.0, 22.0 ],
                    "text": "prepend slot 1 cc_channel"
                }
            },
            {
                "box": {
                    "id": "mm-cc-channel-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 635.0, 38.0, 70.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "mm-s2-cc-channel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 679.0, 68.0, 156.0, 22.0 ],
                    "text": "prepend slot 2 cc_channel"
                }
            },
            {
                "box": {
                    "id": "mm-s3-cc-channel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 679.0, 98.0, 156.0, 22.0 ],
                    "text": "prepend slot 3 cc_channel"
                }
            },
            {
                "box": {
                    "id": "mm-s4-cc-channel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 679.0, 128.0, 156.0, 22.0 ],
                    "text": "prepend slot 4 cc_channel"
                }
            },
            {
                "box": {
                    "id": "mm-s5-cc-channel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 679.0, 158.0, 156.0, 22.0 ],
                    "text": "prepend slot 5 cc_channel"
                }
            },
            {
                "box": {
                    "id": "mm-s6-cc-channel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 679.0, 188.0, 156.0, 22.0 ],
                    "text": "prepend slot 6 cc_channel"
                }
            },
            {
                "box": {
                    "id": "mm-s7-cc-channel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 679.0, 218.0, 156.0, 22.0 ],
                    "text": "prepend slot 7 cc_channel"
                }
            },
            {
                "box": {
                    "id": "mm-s8-cc-channel-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 679.0, 248.0, 156.0, 22.0 ],
                    "text": "prepend slot 8 cc_channel"
                }
            },
            {
                "box": {
                    "id": "obj0003",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 77.0, 354.0, 90.0, 22.0 ],
                    "text": "s mod_output"
                }
            },
            {
                "box": {
                    "id": "obj0004",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 279.0, 221.0, 90.0, 22.0 ],
                    "text": "r mod_base"
                }
            },
            {
                "box": {
                    "id": "rmi0001",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 10.0, 56.0, 100.0, 22.0 ],
                    "text": "r mod_input"
                }
            },
            {
                "box": {
                    "fontname": "Hiragino Maru Gothic ProN",
                    "fontsize": 22.0,
                    "id": "mm_title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 10.0, 11.0, 205.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 9.0, 160.0, 28.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "text": "MOD MATRIX",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_sh_o",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 684.0000203847885, 841.3333584070206, 25.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 32.5, 48.5, 25.0, 20.0 ],
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
                    "fontsize": 12.0,
                    "id": "mm_sh_sr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 702.6666876077652, 841.3333584070206, 70.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 48.5, 64.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Source",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_sh_ds",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 790.6666902303696, 841.3333584070206, 114.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 122.0, 48.5, 69.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Destination",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_sh_a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 913.3333605527878, 841.3333584070206, 34.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 270.5, 48.5, 32.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Amt",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_sh_v",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 782.0, 629.0, 55.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 311.0, 48.5, 208.5, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "Range%",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_s1n",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 666.6666865348816, 860.0000256299973, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 72.0, 22.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "1",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "mm_s1o",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 684.00002, 857.3333588838577, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 71.0, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "mm_s1o"
                }
            },
            {
                "box": {
                    "id": "mm_s1po",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 340.8260869565217, 112.0, 22.0 ],
                    "text": "prepend slot 1 on"
                }
            },
            {
                "box": {
                    "allowdrag": 0,
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s1sr",
                    "items": [ "off", ",", "lfo1", ",", "lfo2", ",", "lfo3", ",", "lfo4", ",", "lfo5", ",", "lfo6", ",", "lfo7", ",", "lfo8", ",", "midi vel", ",", "midi pb", ",", "midi cc", ",", "midi at" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 702.6666876077652, 857.3333588838577, 85.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 71.0, 64.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s1sr"
                }
            },
            {
                "box": {
                    "id": "mm_s1ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 389.58695652173907, 118.0, 22.0 ],
                    "text": "prepend slot 1 src"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s1ds",
                    "items": [ "none", ",", "key", ",", "mode", ",", "degree", ",", "chord type", ",", "pad on", ",", "pad register", ",", "pad spread", ",", "pad inversion", ",", "pad strum", ",", "pad velocity", ",", "drone on", ",", "drone position", ",", "drone type", ",", "drone trigger", ",", "drone velocity", ",", "m1 on", ",", "m1 position", ",", "m1 pattern", ",", "m1 pattlen", ",", "m1 variation", ",", "m1 clkdiv", ",", "m1 velocity", ",", "m1 gate", ",", "m1 accent", ",", "m1 rhythm", ",", "m2 on", ",", "m2 position", ",", "m2 pattern", ",", "m2 pattlen", ",", "m2 variation", ",", "m2 clkdiv", ",", "m2 velocity", ",", "m2 gate", ",", "m2 accent", ",", "m2 rhythm", ",", "m1 active pattern", ",", "m2 active pattern", ",", "perlin noise x", ",", "perlin noise y", ",", "perlin noise zoom", ",", "perlin noise spacing", ",", "perlin noise ruff", ",", "perlin noise persistence", ",", "perlin noise lum", ",", "midi cc" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 790.6666902303696, 857.3333588838577, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 118.0, 70.5, 157.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s1ds"
                }
            },
            {
                "box": {
                    "id": "mm_s1pd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 413.96739130434776, 118.0, 22.0 ],
                    "text": "prepend slot 1 dst"
                }
            },
            {
                "box": {
                    "id": "mm_s1pa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 438.34782608695645, 118.0, 22.0 ],
                    "text": "prepend slot 1 amt"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_s2n",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 666.6666865348816, 880.0000262260437, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 95.42857142857143, 22.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "2",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "mm_s2o",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 684.00002, 877.3333594799042, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 94.5, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "mm_s2o"
                }
            },
            {
                "box": {
                    "id": "mm_s2po",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 462.72826086956513, 112.0, 22.0 ],
                    "text": "prepend slot 2 on"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s2sr",
                    "items": [ "off", ",", "lfo1", ",", "lfo2", ",", "lfo3", ",", "lfo4", ",", "lfo5", ",", "lfo6", ",", "lfo7", ",", "lfo8", ",", "midi vel", ",", "midi pb", ",", "midi cc", ",", "midi at" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 702.6666876077652, 877.3333594799042, 85.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 93.57142961876733, 64.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s2sr"
                }
            },
            {
                "box": {
                    "id": "mm_s2ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 487.1086956521738, 118.0, 22.0 ],
                    "text": "prepend slot 2 src"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s2ds",
                    "items": [ "none", ",", "key", ",", "mode", ",", "degree", ",", "chord type", ",", "pad on", ",", "pad register", ",", "pad spread", ",", "pad inversion", ",", "pad strum", ",", "pad velocity", ",", "drone on", ",", "drone position", ",", "drone type", ",", "drone trigger", ",", "drone velocity", ",", "m1 on", ",", "m1 position", ",", "m1 pattern", ",", "m1 pattlen", ",", "m1 variation", ",", "m1 clkdiv", ",", "m1 velocity", ",", "m1 gate", ",", "m1 accent", ",", "m1 rhythm", ",", "m2 on", ",", "m2 position", ",", "m2 pattern", ",", "m2 pattlen", ",", "m2 variation", ",", "m2 clkdiv", ",", "m2 velocity", ",", "m2 gate", ",", "m2 accent", ",", "m2 rhythm", ",", "m1 active pattern", ",", "m2 active pattern", ",", "perlin noise x", ",", "perlin noise y", ",", "perlin noise zoom", ",", "perlin noise spacing", ",", "perlin noise ruff", ",", "perlin noise persistence", ",", "perlin noise lum", ",", "midi cc" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 790.6666902303696, 877.3333594799042, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 118.0, 94.0, 157.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s2ds"
                }
            },
            {
                "box": {
                    "id": "mm_s2pd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 511.4891304347825, 118.0, 22.0 ],
                    "text": "prepend slot 2 dst"
                }
            },
            {
                "box": {
                    "id": "mm_s2pa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 535.8695652173913, 118.0, 22.0 ],
                    "text": "prepend slot 2 amt"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_s3n",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 666.6666865348816, 900.0000268220901, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 118.85714285714286, 22.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "3",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "mm_s3o",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 684.00002, 900.000027, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 117.85714285714286, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "mm_s3o"
                }
            },
            {
                "box": {
                    "id": "mm_s3po",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 560.25, 112.0, 22.0 ],
                    "text": "prepend slot 3 on"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s3sr",
                    "items": [ "off", ",", "lfo1", ",", "lfo2", ",", "lfo3", ",", "lfo4", ",", "lfo5", ",", "lfo6", ",", "lfo7", ",", "lfo8", ",", "midi vel", ",", "midi pb", ",", "midi cc", ",", "midi at" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 702.6666876077652, 897.3333600759506, 85.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 117.14285923753465, 64.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s3sr"
                }
            },
            {
                "box": {
                    "id": "mm_s3ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 584.6304347826087, 118.0, 22.0 ],
                    "text": "prepend slot 3 src"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s3ds",
                    "items": [ "none", ",", "key", ",", "mode", ",", "degree", ",", "chord type", ",", "pad on", ",", "pad register", ",", "pad spread", ",", "pad inversion", ",", "pad strum", ",", "pad velocity", ",", "drone on", ",", "drone position", ",", "drone type", ",", "drone trigger", ",", "drone velocity", ",", "m1 on", ",", "m1 position", ",", "m1 pattern", ",", "m1 pattlen", ",", "m1 variation", ",", "m1 clkdiv", ",", "m1 velocity", ",", "m1 gate", ",", "m1 accent", ",", "m1 rhythm", ",", "m2 on", ",", "m2 position", ",", "m2 pattern", ",", "m2 pattlen", ",", "m2 variation", ",", "m2 clkdiv", ",", "m2 velocity", ",", "m2 gate", ",", "m2 accent", ",", "m2 rhythm", ",", "m1 active pattern", ",", "m2 active pattern", ",", "perlin noise x", ",", "perlin noise y", ",", "perlin noise zoom", ",", "perlin noise spacing", ",", "perlin noise ruff", ",", "perlin noise persistence", ",", "perlin noise lum", ",", "midi cc" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 790.6666902303696, 897.3333600759506, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 118.0, 117.5, 157.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s3ds"
                }
            },
            {
                "box": {
                    "id": "mm_s3pd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 609.0108695652175, 118.0, 22.0 ],
                    "text": "prepend slot 3 dst"
                }
            },
            {
                "box": {
                    "id": "mm_s3pa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 633.3913043478262, 118.0, 22.0 ],
                    "text": "prepend slot 3 amt"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_s4n",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 666.6666865348816, 920.0000274181366, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 142.28571428571428, 22.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "4",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "mm_s4o",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 684.00002, 920.000027, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 141.28571428571428, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "mm_s4o"
                }
            },
            {
                "box": {
                    "id": "mm_s4po",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 657.771739130435, 112.0, 22.0 ],
                    "text": "prepend slot 4 on"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s4sr",
                    "items": [ "off", ",", "lfo1", ",", "lfo2", ",", "lfo3", ",", "lfo4", ",", "lfo5", ",", "lfo6", ",", "lfo7", ",", "lfo8", ",", "midi vel", ",", "midi pb", ",", "midi cc", ",", "midi at" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 702.6666876077652, 917.3333606719971, 85.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 140.71428885630198, 64.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s4sr"
                }
            },
            {
                "box": {
                    "id": "mm_s4ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 682.1521739130437, 118.0, 22.0 ],
                    "text": "prepend slot 4 src"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s4ds",
                    "items": [ "none", ",", "key", ",", "mode", ",", "degree", ",", "chord type", ",", "pad on", ",", "pad register", ",", "pad spread", ",", "pad inversion", ",", "pad strum", ",", "pad velocity", ",", "drone on", ",", "drone position", ",", "drone type", ",", "drone trigger", ",", "drone velocity", ",", "m1 on", ",", "m1 position", ",", "m1 pattern", ",", "m1 pattlen", ",", "m1 variation", ",", "m1 clkdiv", ",", "m1 velocity", ",", "m1 gate", ",", "m1 accent", ",", "m1 rhythm", ",", "m2 on", ",", "m2 position", ",", "m2 pattern", ",", "m2 pattlen", ",", "m2 variation", ",", "m2 clkdiv", ",", "m2 velocity", ",", "m2 gate", ",", "m2 accent", ",", "m2 rhythm", ",", "m1 active pattern", ",", "m2 active pattern", ",", "perlin noise x", ",", "perlin noise y", ",", "perlin noise zoom", ",", "perlin noise spacing", ",", "perlin noise ruff", ",", "perlin noise persistence", ",", "perlin noise lum", ",", "midi cc" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 790.6666902303696, 917.3333606719971, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 118.0, 141.0, 157.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s4ds"
                }
            },
            {
                "box": {
                    "id": "mm_s4pd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 706.5326086956525, 118.0, 22.0 ],
                    "text": "prepend slot 4 dst"
                }
            },
            {
                "box": {
                    "id": "mm_s4pa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 730.9130434782612, 118.0, 22.0 ],
                    "text": "prepend slot 4 amt"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_s5n",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 666.6666865348816, 940.000028014183, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 165.71428571428572, 22.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "5",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "mm_s5o",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 684.00002, 940.000028, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 164.7142857142857, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "mm_s5o"
                }
            },
            {
                "box": {
                    "id": "mm_s5po",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 755.29347826087, 112.0, 22.0 ],
                    "text": "prepend slot 5 on"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s5sr",
                    "items": [ "off", ",", "lfo1", ",", "lfo2", ",", "lfo3", ",", "lfo4", ",", "lfo5", ",", "lfo6", ",", "lfo7", ",", "lfo8", ",", "midi vel", ",", "midi pb", ",", "midi cc", ",", "midi at" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 702.6666876077652, 937.3333612680435, 85.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 164.2857184750693, 64.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s5sr"
                }
            },
            {
                "box": {
                    "id": "mm_s5ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 779.6739130434787, 118.0, 22.0 ],
                    "text": "prepend slot 5 src"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s5ds",
                    "items": [ "none", ",", "key", ",", "mode", ",", "degree", ",", "chord type", ",", "pad on", ",", "pad register", ",", "pad spread", ",", "pad inversion", ",", "pad strum", ",", "pad velocity", ",", "drone on", ",", "drone position", ",", "drone type", ",", "drone trigger", ",", "drone velocity", ",", "m1 on", ",", "m1 position", ",", "m1 pattern", ",", "m1 pattlen", ",", "m1 variation", ",", "m1 clkdiv", ",", "m1 velocity", ",", "m1 gate", ",", "m1 accent", ",", "m1 rhythm", ",", "m2 on", ",", "m2 position", ",", "m2 pattern", ",", "m2 pattlen", ",", "m2 variation", ",", "m2 clkdiv", ",", "m2 velocity", ",", "m2 gate", ",", "m2 accent", ",", "m2 rhythm", ",", "m1 active pattern", ",", "m2 active pattern", ",", "perlin noise x", ",", "perlin noise y", ",", "perlin noise zoom", ",", "perlin noise spacing", ",", "perlin noise ruff", ",", "perlin noise persistence", ",", "perlin noise lum", ",", "midi cc" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 790.6666902303696, 937.3333612680435, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 118.0, 164.5, 157.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s5ds"
                }
            },
            {
                "box": {
                    "id": "mm_s5pd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 804.0543478260875, 118.0, 22.0 ],
                    "text": "prepend slot 5 dst"
                }
            },
            {
                "box": {
                    "id": "mm_s5pa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 828.4347826086962, 118.0, 22.0 ],
                    "text": "prepend slot 5 amt"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_s6n",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 666.6666865348816, 960.0000286102295, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 189.14285714285717, 22.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "6",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "mm_s6o",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 684.00002, 960.000029, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 188.1428571428571, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "mm_s6o"
                }
            },
            {
                "box": {
                    "id": "mm_s6po",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 852.8152173913049, 112.0, 22.0 ],
                    "text": "prepend slot 6 on"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s6sr",
                    "items": [ "off", ",", "lfo1", ",", "lfo2", ",", "lfo3", ",", "lfo4", ",", "lfo5", ",", "lfo6", ",", "lfo7", ",", "lfo8", ",", "midi vel", ",", "midi pb", ",", "midi cc", ",", "midi at" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 702.6666876077652, 957.33336186409, 85.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 187.85714809383663, 64.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s6sr"
                }
            },
            {
                "box": {
                    "id": "mm_s6ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 877.1956521739137, 118.0, 22.0 ],
                    "text": "prepend slot 6 src"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s6ds",
                    "items": [ "none", ",", "key", ",", "mode", ",", "degree", ",", "chord type", ",", "pad on", ",", "pad register", ",", "pad spread", ",", "pad inversion", ",", "pad strum", ",", "pad velocity", ",", "drone on", ",", "drone position", ",", "drone type", ",", "drone trigger", ",", "drone velocity", ",", "m1 on", ",", "m1 position", ",", "m1 pattern", ",", "m1 pattlen", ",", "m1 variation", ",", "m1 clkdiv", ",", "m1 velocity", ",", "m1 gate", ",", "m1 accent", ",", "m1 rhythm", ",", "m2 on", ",", "m2 position", ",", "m2 pattern", ",", "m2 pattlen", ",", "m2 variation", ",", "m2 clkdiv", ",", "m2 velocity", ",", "m2 gate", ",", "m2 accent", ",", "m2 rhythm", ",", "m1 active pattern", ",", "m2 active pattern", ",", "perlin noise x", ",", "perlin noise y", ",", "perlin noise zoom", ",", "perlin noise spacing", ",", "perlin noise ruff", ",", "perlin noise persistence", ",", "perlin noise lum", ",", "midi cc" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 790.6666902303696, 957.33336186409, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 118.0, 188.0, 157.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s6ds"
                }
            },
            {
                "box": {
                    "id": "mm_s6pd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 901.5760869565224, 118.0, 22.0 ],
                    "text": "prepend slot 6 dst"
                }
            },
            {
                "box": {
                    "id": "mm_s6pa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 925.9565217391312, 118.0, 22.0 ],
                    "text": "prepend slot 6 amt"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_s7n",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 666.6666865348816, 980.0000292062759, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 212.5714285714286, 22.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "7",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "mm_s7o",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 684.00002, 980.000029, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 211.5, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "mm_s7o"
                }
            },
            {
                "box": {
                    "id": "mm_s7po",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 950.3369565217399, 112.0, 22.0 ],
                    "text": "prepend slot 7 on"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s7sr",
                    "items": [ "off", ",", "lfo1", ",", "lfo2", ",", "lfo3", ",", "lfo4", ",", "lfo5", ",", "lfo6", ",", "lfo7", ",", "lfo8", ",", "midi vel", ",", "midi pb", ",", "midi cc", ",", "midi at" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 702.6666876077652, 977.3333624601364, 85.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 211.42857771260395, 64.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s7sr"
                }
            },
            {
                "box": {
                    "id": "mm_s7ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 974.7173913043487, 118.0, 22.0 ],
                    "text": "prepend slot 7 src"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s7ds",
                    "items": [ "none", ",", "key", ",", "mode", ",", "degree", ",", "chord type", ",", "pad on", ",", "pad register", ",", "pad spread", ",", "pad inversion", ",", "pad strum", ",", "pad velocity", ",", "drone on", ",", "drone position", ",", "drone type", ",", "drone trigger", ",", "drone velocity", ",", "m1 on", ",", "m1 position", ",", "m1 pattern", ",", "m1 pattlen", ",", "m1 variation", ",", "m1 clkdiv", ",", "m1 velocity", ",", "m1 gate", ",", "m1 accent", ",", "m1 rhythm", ",", "m2 on", ",", "m2 position", ",", "m2 pattern", ",", "m2 pattlen", ",", "m2 variation", ",", "m2 clkdiv", ",", "m2 velocity", ",", "m2 gate", ",", "m2 accent", ",", "m2 rhythm", ",", "m1 active pattern", ",", "m2 active pattern", ",", "perlin noise x", ",", "perlin noise y", ",", "perlin noise zoom", ",", "perlin noise spacing", ",", "perlin noise ruff", ",", "perlin noise persistence", ",", "perlin noise lum", ",", "midi cc" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 790.6666902303696, 977.3333624601364, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 118.0, 211.5, 157.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s7ds"
                }
            },
            {
                "box": {
                    "id": "mm_s7pd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 999.0978260869574, 118.0, 22.0 ],
                    "text": "prepend slot 7 dst"
                }
            },
            {
                "box": {
                    "id": "mm_s7pa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 1023.4782608695662, 118.0, 22.0 ],
                    "text": "prepend slot 7 amt"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "mm_s8n",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 666.6666865348816, 1000.0000298023224, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 236.0, 22.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_lcd_title"
                        }
                    },
                    "text": "8",
                    "textcolor": [ 0.768399306904929, 0.768399117237748, 0.7683991666346, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09411764705882353, 0.09411764705882353, 0.09411764705882353, 0.0 ],
                    "checkedcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "id": "mm_s8o",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 684.0000203847885, 1000.0000298023224, 16.0, 16.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 234.99999999999994, 22.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "checkedcolor": {
                            "expression": "themecolor.live_play"
                        },
                        "uncheckedcolor": {
                            "expression": "themecolor.live_alert"
                        }
                    },
                    "uncheckedcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "varname": "mm_s8o"
                }
            },
            {
                "box": {
                    "id": "mm_s8po",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 1047.858695652175, 112.0, 22.0 ],
                    "text": "prepend slot 8 on"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s8sr",
                    "items": [ "off", ",", "lfo1", ",", "lfo2", ",", "lfo3", ",", "lfo4", ",", "lfo5", ",", "lfo6", ",", "lfo7", ",", "lfo8", ",", "midi vel", ",", "midi pb", ",", "midi cc", ",", "midi at" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 702.6666876077652, 997.3333630561829, 85.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 235.00000733137128, 64.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s8sr"
                }
            },
            {
                "box": {
                    "id": "mm_s8ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 1072.2391304347836, 118.0, 22.0 ],
                    "text": "prepend slot 8 src"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_angle": 270,
                    "bgfillcolor_autogradient": 0,
                    "bgfillcolor_color": [ 0.094525624565048, 0.094525586030663, 0.09452559599708, 0 ],
                    "bgfillcolor_color1": [ 0.3764705882352941, 0.3843137254901961, 0.4, 1 ],
                    "bgfillcolor_color2": [ 0.2901960784313726, 0.30980392156862746, 0.30196078431372547, 1 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "color": [ 0.6196078431372549, 0.7450980392156863, 0.9529411764705882, 1.0 ],
                    "fontsize": 12.0,
                    "id": "mm_s8ds",
                    "items": [ "none", ",", "key", ",", "mode", ",", "degree", ",", "chord type", ",", "pad on", ",", "pad register", ",", "pad spread", ",", "pad inversion", ",", "pad strum", ",", "pad velocity", ",", "drone on", ",", "drone position", ",", "drone type", ",", "drone trigger", ",", "drone velocity", ",", "m1 on", ",", "m1 position", ",", "m1 pattern", ",", "m1 pattlen", ",", "m1 variation", ",", "m1 clkdiv", ",", "m1 velocity", ",", "m1 gate", ",", "m1 accent", ",", "m1 rhythm", ",", "m2 on", ",", "m2 position", ",", "m2 pattern", ",", "m2 pattlen", ",", "m2 variation", ",", "m2 clkdiv", ",", "m2 velocity", ",", "m2 gate", ",", "m2 accent", ",", "m2 rhythm", ",", "m1 active pattern", ",", "m2 active pattern", ",", "perlin noise x", ",", "perlin noise y", ",", "perlin noise zoom", ",", "perlin noise spacing", ",", "perlin noise ruff", ",", "perlin noise persistence", ",", "perlin noise lum", ",", "midi cc" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 790.6666902303696, 1001.3333631753922, 115.00000059604645, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 118.0, 235.0, 157.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
                    "varname": "mm_s8ds"
                }
            },
            {
                "box": {
                    "id": "mm_s8pd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 1097.000000000001, 118.0, 22.0 ],
                    "text": "prepend slot 8 dst"
                }
            },
            {
                "box": {
                    "id": "mm_s8pa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 1121.0000000000011, 118.0, 22.0 ],
                    "text": "prepend slot 8 amt"
                }
            },
            {
                "box": {
                    "id": "lb_mm",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 10.0, 280.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "msg_mm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 10.0, 308.0, 115.0, 22.0 ],
                    "text": "read mod_matrix.js"
                }
            },
            {
                "box": {
                    "fontsize": 13.0,
                    "id": "cmt_scope",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 87.0, 1075.0, 215.0, 21.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.live_play"
                        }
                    },
                    "style": "bold",
                    "text": "SCOPE — modulation par slot (1-8)",
                    "textcolor": [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "mm_range_mouse_poll",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 820.0, 350.0, 35.0, 22.0 ],
                    "text": "poll"
                }
            },
            {
                "box": {
                    "id": "mm_range_mouse_state",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 10,
                    "outlettype": [ "int", "int", "int", "int", "int", "int", "int", "float", "float", "list" ],
                    "patching_rect": [ 860.0, 350.0, 72.0, 22.0 ],
                    "text": "mousestate"
                }
            },
            {
                "box": {
                    "id": "mm_range_mouse_change",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 940.0, 350.0, 48.0, 22.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "mm_range_mouse_up",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 995.0, 350.0, 36.0, 22.0 ],
                    "text": "sel 0"
                }
            },
            {
                "box": {
                    "id": "mm_range_release_msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1040.0, 350.0, 89.0, 22.0 ],
                    "text": "range_release"
                }
            },
            {
                "box": {
                    "id": "mm-pause-global-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 760.0, 340.0, 117.0, 22.0 ],
                    "text": "r mod_pause_global"
                }
            },
            {
                "box": {
                    "id": "mm-pause-global-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 340.0, 154.0, 22.0 ],
                    "text": "prepend mod_pause global"
                }
            },
            {
                "box": {
                    "id": "mm-pause-pad-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 760.0, 370.0, 105.0, 22.0 ],
                    "text": "r mod_pause_pad"
                }
            },
            {
                "box": {
                    "id": "mm-pause-pad-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 370.0, 142.0, 22.0 ],
                    "text": "prepend mod_pause pad"
                }
            },
            {
                "box": {
                    "id": "mm-pause-drone-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 760.0, 400.0, 116.0, 22.0 ],
                    "text": "r mod_pause_drone"
                }
            },
            {
                "box": {
                    "id": "mm-pause-drone-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 400.0, 153.0, 22.0 ],
                    "text": "prepend mod_pause drone"
                }
            },
            {
                "box": {
                    "id": "mm-pause-m1-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 760.0, 430.0, 118.0, 22.0 ],
                    "text": "r mod_pause_motif1"
                }
            },
            {
                "box": {
                    "id": "mm-pause-m1-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 430.0, 155.0, 22.0 ],
                    "text": "prepend mod_pause motif1"
                }
            },
            {
                "box": {
                    "id": "mm-pause-m2-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 760.0, 460.0, 118.0, 22.0 ],
                    "text": "r mod_pause_motif2"
                }
            },
            {
                "box": {
                    "id": "mm-pause-m2-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 460.0, 155.0, 22.0 ],
                    "text": "prepend mod_pause motif2"
                }
            },
            {
                "box": {
                    "id": "mm-cc-slot-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1040.0, 340.0, 88.0, 22.0 ],
                    "text": "r mod_cc_slot"
                }
            },
            {
                "box": {
                    "id": "mm-cc-slot-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1140.0, 340.0, 93.0, 22.0 ],
                    "text": "prepend cc_slot"
                }
            },
            {
                "box": {
                    "id": "mm-cc-ch-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1040.0, 370.0, 149.0, 22.0 ],
                    "text": "r mod_cc_channel_setting"
                }
            },
            {
                "box": {
                    "id": "mm-cc-ch-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1190.0, 370.0, 117.0, 22.0 ],
                    "text": "prepend cc_channel"
                }
            },
            {
                "box": {
                    "id": "mm-cc-port-setting-r",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1040.0, 400.0, 135.0, 22.0 ],
                    "text": "r mod_cc_port_setting"
                }
            },
            {
                "box": {
                    "id": "mm-cc-port-setting-p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1180.0, 400.0, 98.0, 22.0 ],
                    "text": "prepend cc_port"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0, 0.980392156862745, 0.63921568627451, 0.15 ],
                    "bordercolor": [ 0.618934978328545, 0.744701397656435, 0.953750108255376, 0.0 ],
                    "hidden": 1,
                    "id": "obj-68",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 537.1666660159826, 1197.3333330452442, 43.666667968034744, 19.333333909511566 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 71.0, 668.0, 22.0 ],
                    "proportion": 0.5,
                    "rounded": 5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0, 0.980392156862745, 0.63921568627451, 0.15 ],
                    "bordercolor": [ 0.618934978328545, 0.744701397656435, 0.953750108255376, 0.0 ],
                    "hidden": 1,
                    "id": "obj-81",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 543.0, 1660.3333330452442, 43.666667968034744, 19.333333909511566 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 235.0, 668.0, 22.0 ],
                    "proportion": 0.5,
                    "rounded": 5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0, 0.980392156862745, 0.63921568627451, 0.15 ],
                    "bordercolor": [ 0.618934978328545, 0.744701397656435, 0.953750108255376, 0.0 ],
                    "hidden": 1,
                    "id": "obj-80",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 543.0, 1586.3333330452442, 43.666667968034744, 19.333333909511566 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 211.5714285714285, 668.0, 22.0 ],
                    "proportion": 0.5,
                    "rounded": 5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0, 0.980392156862745, 0.63921568627451, 0.15 ],
                    "bordercolor": [ 0.618934978328545, 0.744701397656435, 0.953750108255376, 0.0 ],
                    "hidden": 1,
                    "id": "obj-79",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 543.0, 1513.3333330452442, 43.666667968034744, 19.333333909511566 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 188.14285714285708, 668.0, 22.0 ],
                    "proportion": 0.5,
                    "rounded": 5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0, 0.980392156862745, 0.63921568627451, 0.15 ],
                    "bordercolor": [ 0.618934978328545, 0.744701397656435, 0.953750108255376, 0.0 ],
                    "hidden": 1,
                    "id": "obj-78",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 543.0, 1451.3333330452442, 43.666667968034744, 19.333333909511566 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 164.71428571428567, 668.0, 22.0 ],
                    "proportion": 0.5,
                    "rounded": 5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0, 0.980392156862745, 0.63921568627451, 0.15 ],
                    "bordercolor": [ 0.618934978328545, 0.744701397656435, 0.953750108255376, 0.0 ],
                    "hidden": 1,
                    "id": "obj-77",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 543.0, 1387.3333330452442, 43.666667968034744, 19.333333909511566 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 141.28571428571425, 668.0, 22.0 ],
                    "proportion": 0.5,
                    "rounded": 5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0, 0.980392156862745, 0.63921568627451, 0.15 ],
                    "bordercolor": [ 0.618934978328545, 0.744701397656435, 0.953750108255376, 0.0 ],
                    "hidden": 1,
                    "id": "obj-76",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 549.0, 1325.3333330452442, 43.666667968034744, 19.333333909511566 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 117.85714285714283, 668.0, 22.0 ],
                    "proportion": 0.5,
                    "rounded": 5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0, 0.980392156862745, 0.63921568627451, 0.15 ],
                    "bordercolor": [ 0.618934978328545, 0.744701397656435, 0.953750108255376, 0.0 ],
                    "hidden": 1,
                    "id": "obj-75",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 549.0, 1261.3333330452442, 43.666667968034744, 19.333333909511566 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 94.42857142857142, 668.0, 22.0 ],
                    "proportion": 0.5,
                    "rounded": 5
                }
            },
            {
                "box": {
                    "id": "lfo_control_recv",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 187.0, 260.0, 175.0, 22.0 ],
                    "text": "r mod_matrix_lfo_control"
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
                    "patching_rect": [ 0.0, 0.0, 405.0, 238.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 710.0, 264.0 ],
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
                    "destination": [ "mm_range_mouse_poll", 0 ],
                    "order": 0,
                    "source": [ "lb_mm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "msg_mm", 0 ],
                    "order": 1,
                    "source": [ "lb_mm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "lfo_control_recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-cc-ch-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-ch-p", 0 ],
                    "source": [ "mm-cc-ch-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-channel-prepend", 0 ],
                    "source": [ "mm-cc-channel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-channel", 0 ],
                    "order": 7,
                    "source": [ "mm-cc-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 6,
                    "source": [ "mm-cc-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "order": 4,
                    "source": [ "mm-cc-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "order": 3,
                    "source": [ "mm-cc-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "order": 2,
                    "source": [ "mm-cc-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "order": 1,
                    "source": [ "mm-cc-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "order": 5,
                    "source": [ "mm-cc-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "order": 0,
                    "source": [ "mm-cc-channel-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-cc-channel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-cc-port-setting-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-port-setting-p", 0 ],
                    "source": [ "mm-cc-port-setting-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-cc-slot-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-slot-p", 0 ],
                    "source": [ "mm-cc-slot-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-pause-drone-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-pause-drone-p", 0 ],
                    "source": [ "mm-pause-drone-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-pause-global-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-pause-global-p", 0 ],
                    "source": [ "mm-pause-global-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-pause-m1-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-pause-m1-p", 0 ],
                    "source": [ "mm-pause-m1-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-pause-m2-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-pause-m2-p", 0 ],
                    "source": [ "mm-pause-m2-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-pause-pad-p", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-pause-pad-p", 0 ],
                    "source": [ "mm-pause-pad-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-s2-cc-channel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-s3-cc-channel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-s4-cc-channel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-s5-cc-channel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-s6-cc-channel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-s7-cc-channel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm-s8-cc-channel-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_range_mouse_up", 0 ],
                    "source": [ "mm_range_mouse_change", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_range_mouse_state", 0 ],
                    "source": [ "mm_range_mouse_poll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_range_mouse_change", 0 ],
                    "source": [ "mm_range_mouse_state", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_range_release_msg", 0 ],
                    "source": [ "mm_range_mouse_up", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_range_release_msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s1pa", 0 ],
                    "source": [ "mm_s1a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s1pd", 0 ],
                    "order": 1,
                    "source": [ "mm_s1ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-123", 0 ],
                    "order": 0,
                    "source": [ "mm_s1ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s1po", 0 ],
                    "order": 0,
                    "source": [ "mm_s1o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "order": 1,
                    "source": [ "mm_s1o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s1pa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s1pd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s1ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s1po", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s1ps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s1pv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s1ps", 0 ],
                    "source": [ "mm_s1sr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s2pa", 0 ],
                    "source": [ "mm_s2a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s2pd", 0 ],
                    "order": 1,
                    "source": [ "mm_s2ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-119", 0 ],
                    "order": 0,
                    "source": [ "mm_s2ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s2po", 0 ],
                    "order": 0,
                    "source": [ "mm_s2o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "order": 1,
                    "source": [ "mm_s2o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s2pa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s2pd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s2ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s2po", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s2ps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s2pv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s2ps", 0 ],
                    "source": [ "mm_s2sr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s3pa", 0 ],
                    "source": [ "mm_s3a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s3pd", 0 ],
                    "order": 1,
                    "source": [ "mm_s3ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-115", 0 ],
                    "order": 0,
                    "source": [ "mm_s3ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s3po", 0 ],
                    "order": 0,
                    "source": [ "mm_s3o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-84", 0 ],
                    "order": 1,
                    "source": [ "mm_s3o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s3pa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s3pd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s3ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s3po", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s3ps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s3pv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s3ps", 0 ],
                    "source": [ "mm_s3sr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s4pa", 0 ],
                    "source": [ "mm_s4a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s4pd", 0 ],
                    "order": 1,
                    "source": [ "mm_s4ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-111", 0 ],
                    "order": 0,
                    "source": [ "mm_s4ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s4po", 0 ],
                    "order": 0,
                    "source": [ "mm_s4o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "order": 1,
                    "source": [ "mm_s4o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s4pa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s4pd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s4ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s4po", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s4ps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s4pv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s4ps", 0 ],
                    "source": [ "mm_s4sr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s5pa", 0 ],
                    "source": [ "mm_s5a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s5pd", 0 ],
                    "order": 1,
                    "source": [ "mm_s5ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-107", 0 ],
                    "order": 0,
                    "source": [ "mm_s5ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s5po", 0 ],
                    "order": 0,
                    "source": [ "mm_s5o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-88", 0 ],
                    "order": 1,
                    "source": [ "mm_s5o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s5pa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s5pd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s5ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s5po", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s5ps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s5pv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s5ps", 0 ],
                    "source": [ "mm_s5sr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s6pa", 0 ],
                    "source": [ "mm_s6a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s6pd", 0 ],
                    "order": 1,
                    "source": [ "mm_s6ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "order": 0,
                    "source": [ "mm_s6ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s6po", 0 ],
                    "order": 0,
                    "source": [ "mm_s6o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-90", 0 ],
                    "order": 1,
                    "source": [ "mm_s6o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s6pa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s6pd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s6ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s6po", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s6ps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s6pv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s6ps", 0 ],
                    "source": [ "mm_s6sr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s7pa", 0 ],
                    "source": [ "mm_s7a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s7pd", 0 ],
                    "order": 1,
                    "source": [ "mm_s7ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-99", 0 ],
                    "order": 0,
                    "source": [ "mm_s7ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s7po", 0 ],
                    "order": 0,
                    "source": [ "mm_s7o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "order": 1,
                    "source": [ "mm_s7o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s7pa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s7pd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s7ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s7po", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s7ps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s7pv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s7ps", 0 ],
                    "source": [ "mm_s7sr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s8pa", 0 ],
                    "source": [ "mm_s8a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s8pd", 0 ],
                    "order": 1,
                    "source": [ "mm_s8ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "order": 0,
                    "source": [ "mm_s8ds", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s8po", 0 ],
                    "order": 0,
                    "source": [ "mm_s8o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "order": 1,
                    "source": [ "mm_s8o", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s8pa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s8pd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s8ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s8po", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s8ps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "mm_s8pv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s8ps", 0 ],
                    "source": [ "mm_s8sr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "msg_mm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-s2-cc-channel-prepend", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-101", 0 ],
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-101", 0 ],
                    "source": [ "obj-102", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "source": [ "obj-103", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "obj-103", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "order": 0,
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "order": 1,
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "source": [ "obj-107", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "source": [ "obj-107", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "order": 0,
                    "source": [ "obj-107", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "order": 1,
                    "source": [ "obj-107", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-109", 0 ],
                    "source": [ "obj-108", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-s5-cc-channel-prepend", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-109", 0 ],
                    "source": [ "obj-110", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-108", 0 ],
                    "source": [ "obj-111", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-110", 0 ],
                    "source": [ "obj-111", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "order": 1,
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "order": 0,
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-113", 0 ],
                    "source": [ "obj-112", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-113", 0 ],
                    "source": [ "obj-114", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-112", 0 ],
                    "source": [ "obj-115", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-114", 0 ],
                    "source": [ "obj-115", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "order": 1,
                    "source": [ "obj-115", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "order": 0,
                    "source": [ "obj-115", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 0 ],
                    "source": [ "obj-116", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 0 ],
                    "source": [ "obj-118", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 0,
                    "source": [ "obj-119", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-116", 0 ],
                    "source": [ "obj-119", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-118", 0 ],
                    "source": [ "obj-119", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "order": 1,
                    "source": [ "obj-119", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-s6-cc-channel-prepend", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-121", 0 ],
                    "source": [ "obj-120", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-121", 0 ],
                    "source": [ "obj-122", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-cc-channel", 0 ],
                    "order": 0,
                    "source": [ "obj-123", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-120", 0 ],
                    "source": [ "obj-123", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-123", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "order": 1,
                    "source": [ "obj-123", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-s7-cc-channel-prepend", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-s8-cc-channel-prepend", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s2high_display", 1 ],
                    "order": 1,
                    "source": [ "obj-30", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s2low_display", 1 ],
                    "order": 0,
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s2ph", 0 ],
                    "order": 0,
                    "source": [ "obj-30", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s2pv", 0 ],
                    "order": 1,
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s1high_display", 1 ],
                    "order": 1,
                    "source": [ "obj-31", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s1low_display", 1 ],
                    "order": 1,
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s1ph", 0 ],
                    "order": 0,
                    "source": [ "obj-31", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s1pv", 0 ],
                    "order": 0,
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s3high_display", 1 ],
                    "order": 1,
                    "source": [ "obj-32", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s3low_display", 1 ],
                    "order": 0,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s3ph", 0 ],
                    "order": 0,
                    "source": [ "obj-32", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s3pv", 0 ],
                    "order": 1,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s4high_display", 1 ],
                    "order": 1,
                    "source": [ "obj-33", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s4low_display", 1 ],
                    "order": 0,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s4ph", 0 ],
                    "order": 0,
                    "source": [ "obj-33", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s4pv", 0 ],
                    "order": 1,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s5high_display", 1 ],
                    "order": 1,
                    "source": [ "obj-34", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s5low_display", 1 ],
                    "order": 0,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s5ph", 0 ],
                    "order": 0,
                    "source": [ "obj-34", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s5pv", 0 ],
                    "order": 1,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s6high_display", 1 ],
                    "order": 1,
                    "source": [ "obj-35", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s6low_display", 1 ],
                    "order": 0,
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s6ph", 0 ],
                    "order": 0,
                    "source": [ "obj-35", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s6pv", 0 ],
                    "order": 1,
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s7high_display", 1 ],
                    "order": 1,
                    "source": [ "obj-36", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s7low_display", 1 ],
                    "order": 0,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s7ph", 0 ],
                    "order": 0,
                    "source": [ "obj-36", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s7pv", 0 ],
                    "order": 1,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s8high_display", 1 ],
                    "order": 1,
                    "source": [ "obj-37", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s8low_display", 1 ],
                    "order": 0,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s8ph", 0 ],
                    "order": 0,
                    "source": [ "obj-37", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s8pv", 0 ],
                    "order": 1,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "order": 0,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-45", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-45", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "order": 1,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s1ds", 0 ],
                    "order": 7,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s2ds", 0 ],
                    "order": 6,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s3ds", 0 ],
                    "order": 5,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s4ds", 0 ],
                    "order": 4,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s5ds", 0 ],
                    "order": 3,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s6ds", 0 ],
                    "order": 2,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s7ds", 0 ],
                    "order": 1,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm_s8ds", 0 ],
                    "order": 0,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-s3-cc-channel-prepend", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mm-s4-cc-channel-prepend", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-83", 0 ],
                    "source": [ "obj-82", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "source": [ "obj-83", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-85", 0 ],
                    "source": [ "obj-84", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "source": [ "obj-85", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 0 ],
                    "source": [ "obj-86", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "source": [ "obj-88", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 0 ],
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-91", 0 ],
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "source": [ "obj-91", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-81", 0 ],
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "order": 0,
                    "source": [ "obj-99", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "order": 1,
                    "source": [ "obj-99", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "source": [ "obj-99", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "source": [ "obj-99", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0003", 0 ],
                    "source": [ "obj0002", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "viz_ms1", 0 ],
                    "source": [ "obj0002", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "viz_ms2", 0 ],
                    "source": [ "obj0002", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "viz_ms3", 0 ],
                    "source": [ "obj0002", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "viz_ms4", 0 ],
                    "source": [ "obj0002", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "viz_ms5", 0 ],
                    "source": [ "obj0002", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "viz_ms6", 0 ],
                    "source": [ "obj0002", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "viz_ms7", 0 ],
                    "source": [ "obj0002", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "viz_ms8", 0 ],
                    "source": [ "obj0002", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "obj0004", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj0002", 0 ],
                    "source": [ "rmi0001", 0 ]
                }
            }
        ]
    }
}