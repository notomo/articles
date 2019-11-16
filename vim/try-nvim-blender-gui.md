
# neovimをblenderに埋め込もうとしたときのメモ

## neovimの --embed オプション

neovimは他のアプリケーションに埋め込むことが前提の状態で起動できる。  
pythonでneovimを起動して、event loopの様子を見たときのscriptが以下。


```python
import json
import time
from threading import Thread

import pynvim

cmd = ["nvim", "--embed"]
nvim = pynvim.attach("child", argv=cmd)

width = 80
height = 40
rgb = True
options = {
    # "override": True,
    # "ext_cmdline": True,
    # "ext_hlstate": True,
    "ext_linegrid": True,
    # "ext_messages": True,
    # "ext_multigrid": True,
    # "ext_popupmenu": True,
    # "ext_tabline": True,
    # "ext_termcolors": True,
}
nvim.ui_attach(width, height, rgb, **options)


def start():
    def cb(name, args):
        print(json.dumps({"name": name, "args": args}, indent=4))

    nvim.run_loop(cb, cb)


t = Thread(target=start)
t.daemon = True
t.start()

time.sleep(3)
```

<details>
<summary>Result</summary>

```json
{
    "name": "redraw",
    "args": [
        [
            "option_set",
            [
                "arabicshape",
                true
            ],
            [
                "ambiwidth",
                "single"
            ],
            [
                "emoji",
                true
            ],
            [
                "guifont",
                ""
            ],
            [
                "guifontset",
                ""
            ],
            [
                "guifontwide",
                ""
            ],
            [
                "linespace",
                0
            ],
            [
                "pumblend",
                0
            ],
            [
                "showtabline",
                1
            ],
            [
                "termguicolors",
                false
            ],
            [
                "ext_linegrid",
                true
            ],
            [
                "ext_multigrid",
                false
            ],
            [
                "ext_hlstate",
                false
            ],
            [
                "ext_termcolors",
                false
            ]
        ],
        [
            "default_colors_set",
            [
                16777215,
                0,
                16711680,
                0,
                0
            ]
        ],
        [
            "hl_attr_define",
            [
                1,
                {},
                {},
                []
            ],
            [
                2,
                {
                    "foreground": 13882323,
                    "background": 11119017
                },
                {
                    "foreground": 7,
                    "background": 242
                },
                []
            ],
            [
                3,
                {
                    "bold": true,
                    "background": 16711680
                },
                {
                    "bold": true,
                    "background": 9
                },
                []
            ],
            [
                4,
                {
                    "foreground": 16777215,
                    "background": 16711680
                },
                {
                    "foreground": 15,
                    "background": 1
                },
                []
            ],
            [
                5,
                {
                    "reverse": true
                },
                {
                    "reverse": true
                },
                []
            ],
            [
                6,
                {
                    "bold": true
                },
                {
                    "bold": true
                },
                []
            ],
            [
                7,
                {
                    "bold": true,
                    "foreground": 255
                },
                {
                    "foreground": 12
                },
                []
            ],
            [
                8,
                {
                    "background": 8421504
                },
                {
                    "background": 248
                },
                []
            ],
            [
                9,
                {
                    "bold": true,
                    "reverse": true
                },
                {
                    "bold": true,
                    "reverse": true
                },
                []
            ],
            [
                10,
                {
                    "foreground": 0,
                    "background": 16776960
                },
                {
                    "foreground": 0,
                    "background": 11
                },
                []
            ],
            [
                11,
                {
                    "background": 16776960
                },
                {
                    "background": 11
                },
                []
            ],
            [
                12,
                {
                    "background": 32768
                },
                {
                    "background": 10
                },
                []
            ],
            [
                13,
                {
                    "background": 16711680
                },
                {
                    "background": 9
                },
                []
            ],
            [
                14,
                {
                    "background": 9109504
                },
                {
                    "background": 1
                },
                []
            ],
            [
                15,
                {
                    "background": 6710886
                },
                {
                    "background": 242
                },
                []
            ],
            [
                16,
                {
                    "background": 6710886
                },
                {
                    "underline": true
                },
                []
            ],
            [
                17,
                {
                    "bold": true,
                    "foreground": 16776960
                },
                {
                    "foreground": 11
                },
                []
            ],
            [
                18,
                {
                    "background": 139
                },
                {
                    "background": 4
                },
                []
            ],
            [
                19,
                {
                    "background": 9109643
                },
                {
                    "background": 5
                },
                []
            ],
            [
                20,
                {
                    "bold": true,
                    "foreground": 255,
                    "background": 35723
                },
                {
                    "foreground": 12,
                    "background": 6
                },
                []
            ],
            [
                21,
                {
                    "foreground": 65535
                },
                {
                    "foreground": 159
                },
                []
            ],
            [
                22,
                {
                    "foreground": 65535,
                    "background": 8421504
                },
                {
                    "foreground": 14,
                    "background": 242
                },
                []
            ],
            [
                23,
                {
                    "foreground": 65535,
                    "background": 11119017
                },
                {
                    "foreground": 14,
                    "background": 242
                },
                []
            ],
            [
                24,
                {
                    "foreground": 16776960
                },
                {
                    "foreground": 11
                },
                []
            ],
            [
                25,
                {
                    "background": 35723
                },
                {
                    "background": 6
                },
                []
            ],
            [
                26,
                {
                    "bold": true,
                    "foreground": 3050327
                },
                {
                    "foreground": 121
                },
                []
            ],
            [
                27,
                {
                    "background": 16711935
                },
                {
                    "foreground": 0,
                    "background": 13
                },
                []
            ],
            [
                28,
                {
                    "background": 11119017
                },
                {
                    "foreground": 242,
                    "background": 0
                },
                []
            ],
            [
                29,
                {
                    "background": 16777215
                },
                {
                    "background": 15
                },
                []
            ],
            [
                30,
                {
                    "bold": true,
                    "foreground": 32768
                },
                {
                    "foreground": 121
                },
                []
            ],
            [
                31,
                {
                    "foreground": 65535
                },
                {
                    "foreground": 81
                },
                []
            ],
            [
                32,
                {
                    "undercurl": true,
                    "special": 16711680
                },
                {
                    "background": 9
                },
                []
            ],
            [
                33,
                {
                    "undercurl": true,
                    "special": 255
                },
                {
                    "background": 12
                },
                []
            ],
            [
                34,
                {
                    "undercurl": true,
                    "special": 65535
                },
                {
                    "background": 14
                },
                []
            ],
            [
                35,
                {
                    "undercurl": true,
                    "special": 16711935
                },
                {
                    "background": 13
                },
                []
            ],
            [
                36,
                {
                    "underline": true,
                    "background": 11119017
                },
                {
                    "underline": true,
                    "foreground": 15,
                    "background": 242
                },
                []
            ],
            [
                37,
                {
                    "bold": true,
                    "foreground": 16711935
                },
                {
                    "foreground": 225
                },
                []
            ],
            [
                38,
                {
                    "background": 11119017
                },
                {},
                []
            ],
            [
                39,
                {
                    "foreground": 16711680
                },
                {
                    "foreground": 224
                },
                []
            ],
            [
                40,
                {
                    "background": 11119017
                },
                {
                    "background": 242
                },
                []
            ],
            [
                41,
                {
                    "foreground": 16711680,
                    "background": 16711680
                },
                {
                    "foreground": 9,
                    "background": 9
                },
                []
            ]
        ],
        [
            "hl_group_set",
            [
                "SpecialKey",
                1
            ],
            [
                "EndOfBuffer",
                1
            ],
            [
                "TermCursor",
                1
            ],
            [
                "TermCursorNC",
                1
            ],
            [
                "NonText",
                1
            ],
            [
                "Directory",
                1
            ],
            [
                "ErrorMsg",
                1
            ],
            [
                "IncSearch",
                1
            ],
            [
                "Search",
                1
            ],
            [
                "MoreMsg",
                1
            ],
            [
                "ModeMsg",
                1
            ],
            [
                "LineNr",
                1
            ],
            [
                "CursorLineNr",
                1
            ],
            [
                "Question",
                1
            ],
            [
                "StatusLine",
                1
            ],
            [
                "StatusLineNC",
                1
            ],
            [
                "VertSplit",
                1
            ],
            [
                "Title",
                1
            ],
            [
                "Visual",
                1
            ],
            [
                "VisualNC",
                1
            ],
            [
                "WarningMsg",
                1
            ],
            [
                "WildMenu",
                1
            ],
            [
                "Folded",
                1
            ],
            [
                "FoldColumn",
                1
            ],
            [
                "DiffAdd",
                1
            ],
            [
                "DiffChange",
                1
            ],
            [
                "DiffDelete",
                1
            ],
            [
                "DiffText",
                1
            ],
            [
                "SignColumn",
                1
            ],
            [
                "Conceal",
                1
            ],
            [
                "SpellBad",
                1
            ],
            [
                "SpellCap",
                1
            ],
            [
                "SpellRare",
                1
            ],
            [
                "SpellLocal",
                1
            ],
            [
                "Pmenu",
                1
            ],
            [
                "PmenuSel",
                1
            ],
            [
                "PmenuSbar",
                1
            ],
            [
                "PmenuThumb",
                1
            ],
            [
                "TabLine",
                1
            ],
            [
                "TabLineSel",
                1
            ],
            [
                "TabLineFill",
                1
            ],
            [
                "CursorColumn",
                1
            ],
            [
                "CursorLine",
                1
            ],
            [
                "ColorColumn",
                1
            ],
            [
                "QuickFixLine",
                1
            ],
            [
                "Whitespace",
                1
            ],
            [
                "NormalNC",
                0
            ],
            [
                "MsgSeparator",
                1
            ],
            [
                "NormalFloat",
                1
            ],
            [
                "MsgArea",
                1
            ]
        ],
        [
            "option_set",
            [
                "ext_cmdline",
                false
            ],
            [
                "ext_popupmenu",
                false
            ],
            [
                "ext_tabline",
                false
            ],
            [
                "ext_wildmenu",
                false
            ],
            [
                "ext_messages",
                false
            ]
        ],
        [
            "default_colors_set",
            [
                16777215,
                0,
                16711680,
                0,
                0
            ]
        ],
        [
            "grid_resize",
            [
                1,
                80,
                40
            ]
        ],
        [
            "grid_clear",
            [
                1
            ]
        ],
        [
            "hl_attr_define",
            [
                42,
                {
                    "background": 10824234
                },
                {
                    "background": 130
                },
                []
            ],
            [
                43,
                {
                    "foreground": 8429823
                },
                {
                    "foreground": 14
                },
                []
            ],
            [
                44,
                {
                    "foreground": 16752800
                },
                {
                    "foreground": 13
                },
                []
            ],
            [
                45,
                {
                    "foreground": 16753920
                },
                {
                    "foreground": 224
                },
                []
            ],
            [
                46,
                {
                    "foreground": 4259839
                },
                {
                    "bold": true,
                    "foreground": 14
                },
                []
            ],
            [
                47,
                {
                    "bold": true,
                    "foreground": 16777056
                },
                {
                    "foreground": 11
                },
                []
            ],
            [
                48,
                {
                    "foreground": 16744703
                },
                {
                    "foreground": 81
                },
                []
            ],
            [
                49,
                {
                    "bold": true,
                    "foreground": 6356832
                },
                {
                    "foreground": 121
                },
                []
            ],
            [
                50,
                {
                    "underline": true,
                    "foreground": 8429823
                },
                {
                    "underline": true,
                    "foreground": 81
                },
                []
            ],
            [
                51,
                {},
                {
                    "foreground": 0
                },
                []
            ],
            [
                52,
                {
                    "foreground": 16777215,
                    "background": 16711680
                },
                {
                    "foreground": 15,
                    "background": 9
                },
                []
            ],
            [
                53,
                {
                    "foreground": 255,
                    "background": 16776960
                },
                {
                    "foreground": 0,
                    "background": 11
                },
                []
            ]
        ],
        [
            "option_set",
            [
                "showtabline",
                2
            ]
        ],
        [
            "mouse_on",
            []
        ],
        [
            "set_icon",
            [
                ""
            ]
        ],
        [
            "set_title",
            [
                ""
            ]
        ],
        [
            "grid_cursor_goto",
            [
                1,
                0,
                0
            ]
        ],
        [
            "mode_info_set",
            [
                true,
                [
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 400,
                        "blinkoff": 250,
                        "hl_id": 0,
                        "id_lm": 0,
                        "attr_id": 0,
                        "attr_id_lm": 0,
                        "name": "normal",
                        "short_name": "n"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 400,
                        "blinkoff": 250,
                        "hl_id": 0,
                        "id_lm": 0,
                        "attr_id": 0,
                        "attr_id_lm": 0,
                        "name": "visual",
                        "short_name": "v"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 400,
                        "blinkoff": 250,
                        "hl_id": 0,
                        "id_lm": 0,
                        "attr_id": 0,
                        "attr_id_lm": 0,
                        "name": "insert",
                        "short_name": "i"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 400,
                        "blinkoff": 250,
                        "hl_id": 0,
                        "id_lm": 0,
                        "attr_id": 0,
                        "attr_id_lm": 0,
                        "name": "replace",
                        "short_name": "r"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 400,
                        "blinkoff": 250,
                        "hl_id": 0,
                        "id_lm": 0,
                        "attr_id": 0,
                        "attr_id_lm": 0,
                        "name": "cmdline_normal",
                        "short_name": "c"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 400,
                        "blinkoff": 250,
                        "hl_id": 0,
                        "id_lm": 0,
                        "attr_id": 0,
                        "attr_id_lm": 0,
                        "name": "cmdline_insert",
                        "short_name": "ci"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 400,
                        "blinkoff": 250,
                        "hl_id": 0,
                        "id_lm": 0,
                        "attr_id": 0,
                        "attr_id_lm": 0,
                        "name": "cmdline_replace",
                        "short_name": "cr"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 400,
                        "blinkoff": 250,
                        "hl_id": 0,
                        "id_lm": 0,
                        "attr_id": 0,
                        "attr_id_lm": 0,
                        "name": "operator",
                        "short_name": "o"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 400,
                        "blinkoff": 250,
                        "hl_id": 0,
                        "id_lm": 0,
                        "attr_id": 0,
                        "attr_id_lm": 0,
                        "name": "visual_select",
                        "short_name": "ve"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "cmdline_hover",
                        "short_name": "e"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "statusline_hover",
                        "short_name": "s"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "statusline_drag",
                        "short_name": "sd"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "vsep_hover",
                        "short_name": "vs"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "vsep_drag",
                        "short_name": "vd"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "more",
                        "short_name": "m"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "more_lastline",
                        "short_name": "ml"
                    },
                    {
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 100,
                        "blinkon": 100,
                        "blinkoff": 100,
                        "hl_id": 0,
                        "id_lm": 0,
                        "attr_id": 0,
                        "attr_id_lm": 0,
                        "name": "showmatch",
                        "short_name": "sm"
                    }
                ]
            ]
        ],
        [
            "mode_change",
            [
                "normal",
                0
            ]
        ],
        [
            "flush",
            []
        ]
    ]
}
{
    "name": "redraw",
    "args": [
        [
            "option_set",
            [
                "termguicolors",
                true
            ]
        ],
        [
            "hl_attr_define",
            [
                54,
                {
                    "foreground": 16614537
                },
                {
                    "foreground": 210
                },
                []
            ],
            [
                55,
                {
                    "foreground": 11132317
                },
                {
                    "foreground": 150
                },
                []
            ],
            [
                56,
                {
                    "background": 5464691
                },
                {
                    "background": 238
                },
                []
            ],
            [
                57,
                {
                    "foreground": 9281202
                },
                {
                    "foreground": 103
                },
                []
            ],
            [
                58,
                {
                    "foreground": 16484709,
                    "background": 3359058
                },
                {
                    "foreground": 209,
                    "background": 233
                },
                []
            ],
            [
                59,
                {
                    "foreground": 11064043
                },
                {
                    "foreground": 153
                },
                []
            ],
            [
                60,
                {
                    "foreground": 3359058,
                    "background": 16776939
                },
                {
                    "foreground": 233,
                    "background": 230
                },
                []
            ],
            [
                61,
                {
                    "background": 3820380
                },
                {
                    "background": 235
                },
                []
            ],
            [
                62,
                {
                    "bold": true,
                    "foreground": 15193599,
                    "background": 5464691
                },
                {
                    "foreground": 189,
                    "background": 238
                },
                []
            ],
            [
                63,
                {
                    "foreground": 15772298
                },
                {
                    "foreground": 216
                },
                []
            ],
            [
                64,
                {
                    "foreground": 5464691
                },
                {
                    "foreground": 238
                },
                []
            ],
            [
                65,
                {
                    "bold": true,
                    "foreground": 16614537,
                    "background": 3820380
                },
                {
                    "bold": true,
                    "foreground": 210,
                    "background": 235
                },
                []
            ],
            [
                66,
                {
                    "bold": true,
                    "foreground": 16614537,
                    "background": 3359058
                },
                {
                    "bold": true,
                    "foreground": 210,
                    "background": 233
                },
                []
            ],
            [
                67,
                {
                    "foreground": 16776939,
                    "background": 3820380
                },
                {
                    "foreground": 230,
                    "background": 235
                },
                []
            ],
            [
                68,
                {
                    "foreground": 15193599,
                    "background": 3820380
                },
                {
                    "foreground": 189,
                    "background": 235
                },
                []
            ],
            [
                69,
                {
                    "foreground": 15193599,
                    "background": 6582140
                },
                {
                    "foreground": 189,
                    "background": 60
                },
                []
            ],
            [
                70,
                {
                    "foreground": 16703361
                },
                {
                    "bold": true,
                    "foreground": 222
                },
                []
            ],
            [
                71,
                {
                    "underline": true,
                    "background": 11101818
                },
                {
                    "underline": true,
                    "background": 132
                },
                []
            ],
            [
                72,
                {
                    "bold": true,
                    "foreground": 15788714
                },
                {
                    "bold": true,
                    "foreground": 229
                },
                []
            ],
            [
                73,
                {
                    "foreground": 7899288,
                    "background": 3820380
                },
                {
                    "foreground": 102,
                    "background": 235
                },
                []
            ],
            [
                74,
                {
                    "bold": true,
                    "foreground": 3359058,
                    "background": 11101818
                },
                {
                    "bold": true,
                    "foreground": 233,
                    "background": 132
                },
                []
            ],
            [
                75,
                {
                    "bold": true,
                    "foreground": 16703361
                },
                {
                    "bold": true,
                    "foreground": 222
                },
                []
            ],
            [
                76,
                {
                    "bold": true,
                    "foreground": 11132317
                },
                {
                    "foreground": 150
                },
                []
            ],
            [
                77,
                {
                    "bold": true,
                    "foreground": 6582140
                },
                {
                    "foreground": 60
                },
                []
            ],
            [
                78,
                {
                    "foreground": 3359058,
                    "background": 16776939
                },
                {
                    "foreground": -1,
                    "background": -1
                },
                []
            ],
            [
                79,
                {
                    "foreground": 16776939,
                    "background": 3359058
                },
                {},
                []
            ],
            [
                80,
                {
                    "foreground": 3359058
                },
                {
                    "foreground": 0,
                    "background": -1
                },
                []
            ]
        ],
        [
            "default_colors_set",
            [
                16776939,
                3359058,
                16711680,
                231,
                234
            ]
        ],
        [
            "hl_attr_define",
            [
                81,
                {
                    "foreground": 16703361,
                    "background": 5464691
                },
                {
                    "foreground": 222,
                    "background": 238
                },
                []
            ],
            [
                82,
                {
                    "foreground": 16703361,
                    "background": 9281202
                },
                {
                    "foreground": 222,
                    "background": 103
                },
                []
            ],
            [
                83,
                {
                    "bold": true,
                    "foreground": 11064043
                },
                {
                    "foreground": 153,
                    "background": -1
                },
                []
            ],
            [
                84,
                {
                    "underline": true,
                    "background": 6313849
                },
                {
                    "underline": true,
                    "foreground": -1,
                    "background": 60
                },
                []
            ],
            [
                85,
                {
                    "foreground": 65535,
                    "background": 3820380
                },
                {
                    "foreground": 14,
                    "background": 235
                },
                []
            ],
            [
                86,
                {
                    "foreground": 6320256
                },
                {
                    "foreground": 60,
                    "background": -1
                },
                []
            ],
            [
                87,
                {
                    "underline": true,
                    "foreground": 16614537,
                    "special": 16614537
                },
                {
                    "underline": true,
                    "foreground": 210,
                    "background": -1
                },
                []
            ],
            [
                88,
                {
                    "underline": true,
                    "foreground": 15193599,
                    "special": 15193599
                },
                {
                    "underline": true,
                    "foreground": 189,
                    "background": -1
                },
                []
            ],
            [
                89,
                {
                    "underline": true,
                    "foreground": 15788714,
                    "special": 15788714
                },
                {
                    "underline": true,
                    "foreground": 229,
                    "background": -1
                },
                []
            ],
            [
                90,
                {
                    "bold": true,
                    "foreground": 16776939,
                    "background": 5464691
                },
                {
                    "bold": true,
                    "background": 238
                },
                []
            ],
            [
                91,
                {
                    "foreground": 9281202,
                    "background": 3820380
                },
                {
                    "foreground": 103,
                    "background": 235
                },
                []
            ],
            [
                92,
                {
                    "foreground": 16703361
                },
                {
                    "foreground": 222,
                    "background": -1
                },
                []
            ],
            [
                93,
                {
                    "underline": true,
                    "foreground": 9281202,
                    "background": 5464691
                },
                {
                    "underline": true,
                    "foreground": 103,
                    "background": 238
                },
                []
            ],
            [
                94,
                {
                    "reverse": true,
                    "foreground": 3820380
                },
                {
                    "reverse": true,
                    "foreground": 235,
                    "background": -1
                },
                []
            ],
            [
                95,
                {
                    "bold": true,
                    "foreground": 16703361,
                    "background": 3359058
                },
                {
                    "bold": true,
                    "foreground": 222
                },
                []
            ],
            [
                96,
                {
                    "bold": true,
                    "foreground": 3359058,
                    "background": 16614537
                },
                {
                    "bold": true,
                    "foreground": 233,
                    "background": 210
                },
                []
            ],
            [
                97,
                {
                    "foreground": 9281202,
                    "background": 5464691
                },
                {
                    "foreground": 103,
                    "background": 238
                },
                []
            ],
            [
                98,
                {
                    "bold": true,
                    "foreground": 16703361
                },
                {
                    "foreground": 222,
                    "background": -1
                },
                []
            ],
            [
                99,
                {
                    "underline": true,
                    "foreground": 11064043
                },
                {
                    "underline": true,
                    "foreground": 153,
                    "background": -1
                },
                []
            ],
            [
                100,
                {
                    "reverse": true,
                    "foreground": 3820380,
                    "background": 3359058
                },
                {
                    "reverse": true,
                    "foreground": 235
                },
                []
            ],
            [
                101,
                {
                    "background": 7358813
                },
                {
                    "foreground": -1,
                    "background": 95
                },
                []
            ],
            [
                102,
                {
                    "foreground": 16484709,
                    "background": 3820380
                },
                {
                    "foreground": 209,
                    "background": 235
                },
                []
            ],
            [
                103,
                {
                    "foreground": 0,
                    "background": 16703361
                },
                {
                    "foreground": 0,
                    "background": 222
                },
                []
            ],
            [
                104,
                {
                    "foreground": 15788714
                },
                {
                    "foreground": 229,
                    "background": -1
                },
                []
            ],
            [
                105,
                {
                    "bold": true,
                    "background": 6260592
                },
                {
                    "bold": true,
                    "foreground": -1,
                    "background": 65
                },
                []
            ],
            [
                106,
                {
                    "bold": true,
                    "background": 6838272
                },
                {
                    "bold": true,
                    "foreground": -1,
                    "background": 58
                },
                []
            ],
            [
                107,
                {
                    "bold": true,
                    "foreground": 16776939,
                    "background": 11232608
                },
                {
                    "bold": true,
                    "background": 167
                },
                []
            ],
            [
                108,
                {
                    "bold": true,
                    "background": 3359058
                },
                {
                    "bold": true,
                    "foreground": -1
                },
                []
            ],
            [
                109,
                {
                    "background": 11232608
                },
                {
                    "foreground": -1,
                    "background": 167
                },
                []
            ],
            [
                110,
                {
                    "bold": true,
                    "foreground": 11064043
                },
                {
                    "bold": true,
                    "foreground": 153,
                    "background": -1
                },
                []
            ],
            [
                111,
                {
                    "foreground": 15193599
                },
                {
                    "foreground": 189,
                    "background": -1
                },
                []
            ],
            [
                112,
                {
                    "foreground": 16776939
                },
                {
                    "background": -1
                },
                []
            ],
            [
                113,
                {
                    "bold": true,
                    "background": 5464691
                },
                {
                    "bold": true,
                    "foreground": -1,
                    "background": 238
                },
                []
            ],
            [
                114,
                {
                    "foreground": 15189687
                },
                {
                    "foreground": 181,
                    "background": -1
                },
                []
            ],
            [
                115,
                {
                    "foreground": 3359058,
                    "background": 11064043
                },
                {
                    "foreground": 233,
                    "background": 153
                },
                []
            ],
            [
                116,
                {
                    "foreground": 3359058,
                    "background": 16703361
                },
                {
                    "foreground": 233,
                    "background": 222
                },
                []
            ],
            [
                117,
                {
                    "bold": true,
                    "foreground": 15772298,
                    "background": 3820380
                },
                {
                    "bold": true,
                    "foreground": 216,
                    "background": 235
                },
                []
            ],
            [
                118,
                {
                    "bold": true,
                    "foreground": 3820380,
                    "background": 11232608
                },
                {
                    "bold": true,
                    "foreground": 235,
                    "background": 167
                },
                []
            ],
            [
                119,
                {
                    "background": 6582140
                },
                {
                    "foreground": -1,
                    "background": 60
                },
                []
            ],
            [
                120,
                {
                    "background": 6838272
                },
                {
                    "foreground": -1,
                    "background": 58
                },
                []
            ],
            [
                121,
                {
                    "foreground": 16614537,
                    "background": 3820380
                },
                {
                    "foreground": 210,
                    "background": 235
                },
                []
            ],
            [
                122,
                {
                    "foreground": 15788714,
                    "background": 3820380
                },
                {
                    "foreground": 229,
                    "background": 235
                },
                []
            ],
            [
                123,
                {
                    "foreground": 11064043,
                    "background": 3820380
                },
                {
                    "foreground": 153,
                    "background": 235
                },
                []
            ],
            [
                124,
                {
                    "foreground": 11132317,
                    "background": 3820380
                },
                {
                    "foreground": 150,
                    "background": 235
                },
                []
            ],
            [
                125,
                {
                    "foreground": 16703361,
                    "background": 3820380
                },
                {
                    "foreground": 222,
                    "background": 235
                },
                []
            ],
            [
                126,
                {
                    "foreground": 3359058,
                    "background": 16614537
                },
                {
                    "foreground": 233,
                    "background": 210
                },
                []
            ],
            [
                127,
                {
                    "bold": true,
                    "foreground": 16614537
                },
                {
                    "bold": true,
                    "foreground": 210,
                    "background": -1
                },
                []
            ],
            [
                128,
                {
                    "foreground": 9281202,
                    "background": 3359058
                },
                {
                    "foreground": 103
                },
                []
            ],
            [
                129,
                {
                    "underline": true,
                    "foreground": 3355443,
                    "background": 11132317
                },
                {
                    "foreground": -1,
                    "background": 60
                },
                []
            ],
            [
                130,
                {
                    "foreground": 16776939,
                    "background": 16484709
                },
                {
                    "foreground": -1,
                    "background": -1
                },
                []
            ],
            [
                131,
                {
                    "foreground": 3355443,
                    "background": 11064043
                },
                {
                    "foreground": -1,
                    "background": 0
                },
                []
            ],
            [
                132,
                {
                    "background": 6260592
                },
                {
                    "underline": true,
                    "foreground": -1,
                    "background": -1
                },
                []
            ],
            [
                133,
                {
                    "foreground": 16774638,
                    "background": 5464691
                },
                {
                    "underline": true,
                    "foreground": 103,
                    "background": 238
                },
                []
            ],
            [
                134,
                {
                    "foreground": 3355443,
                    "background": 16703361
                },
                {
                    "foreground": -1,
                    "background": 130
                },
                []
            ],
            [
                135,
                {
                    "background": 11232608
                },
                {
                    "foreground": -1,
                    "background": 2
                },
                []
            ],
            [
                136,
                {
                    "foreground": 16733525
                },
                {
                    "foreground": -1,
                    "background": -1
                },
                []
            ],
            [
                137,
                {
                    "foreground": 16163747
                },
                {
                    "foreground": -1,
                    "background": -1
                },
                []
            ],
            [
                138,
                {
                    "background": 4018278
                },
                {
                    "foreground": -1,
                    "background": -1
                },
                []
            ],
            [
                139,
                {
                    "foreground": 16777215,
                    "background": 8087936
                },
                {
                    "foreground": -1,
                    "background": -1
                },
                []
            ],
            [
                140,
                {
                    "foreground": 16776939,
                    "background": 5464691
                },
                {
                    "background": 60
                },
                []
            ],
            [
                141,
                {
                    "foreground": 5464691,
                    "background": 5464691
                },
                {
                    "foreground": 60,
                    "background": 60
                },
                []
            ],
            [
                142,
                {
                    "foreground": 16776939,
                    "background": 7966635
                },
                {
                    "background": 103
                },
                []
            ],
            [
                143,
                {
                    "foreground": 7966635,
                    "background": 5464691
                },
                {
                    "foreground": 103,
                    "background": 60
                },
                []
            ],
            [
                144,
                {
                    "foreground": 7966635,
                    "background": 7966635
                },
                {
                    "foreground": 103,
                    "background": 103
                },
                []
            ],
            [
                145,
                {
                    "foreground": 5464691,
                    "background": 7966635
                },
                {
                    "foreground": 60,
                    "background": 103
                },
                []
            ],
            [
                146,
                {
                    "foreground": 16776939,
                    "background": 6985345
                },
                {
                    "background": 66
                },
                []
            ],
            [
                147,
                {
                    "foreground": 6985345,
                    "background": 5464691
                },
                {
                    "foreground": 66,
                    "background": 60
                },
                []
            ],
            [
                148,
                {
                    "foreground": 6985345,
                    "background": 6985345
                },
                {
                    "foreground": 66,
                    "background": 66
                },
                []
            ],
            [
                149,
                {
                    "foreground": 5464691,
                    "background": 6985345
                },
                {
                    "foreground": 60,
                    "background": 66
                },
                []
            ],
            [
                150,
                {
                    "foreground": 16776939,
                    "background": 11567484
                },
                {
                    "background": 138
                },
                []
            ],
            [
                151,
                {
                    "foreground": 11567484,
                    "background": 5464691
                },
                {
                    "foreground": 138,
                    "background": 60
                },
                []
            ],
            [
                152,
                {
                    "foreground": 11567484,
                    "background": 11567484
                },
                {
                    "foreground": 138,
                    "background": 138
                },
                []
            ],
            [
                153,
                {
                    "foreground": 5464691,
                    "background": 11567484
                },
                {
                    "foreground": 60,
                    "background": 138
                },
                []
            ],
            [
                154,
                {
                    "foreground": 8293787,
                    "background": 3820380
                },
                {
                    "foreground": 103,
                    "background": 59
                },
                []
            ],
            [
                155,
                {
                    "foreground": 3820380,
                    "background": 3820380
                },
                {
                    "foreground": 59,
                    "background": 59
                },
                []
            ],
            [
                156,
                {
                    "underline": true,
                    "background": 6260592
                },
                {
                    "underline": true,
                    "foreground": -1,
                    "background": -1
                },
                []
            ]
        ],
        [
            "hl_group_set",
            [
                "SpecialKey",
                86
            ],
            [
                "EndOfBuffer",
                64
            ],
            [
                "TermCursor",
                5
            ],
            [
                "NonText",
                77
            ],
            [
                "Directory",
                55
            ],
            [
                "ErrorMsg",
                66
            ],
            [
                "IncSearch",
                71
            ],
            [
                "Search",
                129
            ],
            [
                "MoreMsg",
                76
            ],
            [
                "ModeMsg",
                75
            ],
            [
                "LineNr",
                73
            ],
            [
                "CursorLineNr",
                62
            ],
            [
                "Question",
                83
            ],
            [
                "StatusLine",
                90
            ],
            [
                "StatusLineNC",
                91
            ],
            [
                "VertSplit",
                100
            ],
            [
                "Title",
                75
            ],
            [
                "Visual",
                101
            ],
            [
                "WarningMsg",
                102
            ],
            [
                "WildMenu",
                103
            ],
            [
                "Folded",
                69
            ],
            [
                "FoldColumn",
                68
            ],
            [
                "DiffAdd",
                105
            ],
            [
                "DiffChange",
                106
            ],
            [
                "DiffDelete",
                107
            ],
            [
                "DiffText",
                108
            ],
            [
                "SignColumn",
                85
            ],
            [
                "Conceal",
                58
            ],
            [
                "SpellBad",
                136
            ],
            [
                "SpellRare",
                136
            ],
            [
                "SpellLocal",
                136
            ]
        ],
        [
            "hl_attr_define",
            [
                157,
                {
                    "foreground": 15193599,
                    "background": 3820380,
                    "blend": 15
                },
                {
                    "foreground": 189,
                    "background": 235,
                    "blend": 15
                },
                []
            ]
        ],
        [
            "hl_group_set",
            [
                "Pmenu",
                157
            ]
        ],
        [
            "hl_attr_define",
            [
                158,
                {
                    "foreground": 16703361,
                    "background": 5464691,
                    "blend": 15
                },
                {
                    "foreground": 222,
                    "background": 238,
                    "blend": 15
                },
                []
            ]
        ],
        [
            "hl_group_set",
            [
                "PmenuSel",
                158
            ],
            [
                "PmenuSbar",
                158
            ]
        ],
        [
            "hl_attr_define",
            [
                159,
                {
                    "foreground": 16703361,
                    "background": 9281202,
                    "blend": 15
                },
                {
                    "foreground": 222,
                    "background": 103,
                    "blend": 15
                },
                []
            ]
        ],
        [
            "hl_group_set",
            [
                "PmenuThumb",
                159
            ],
            [
                "TabLine",
                133
            ],
            [
                "TabLineSel",
                95
            ],
            [
                "TabLineFill",
                94
            ],
            [
                "CursorColumn",
                61
            ],
            [
                "CursorLine",
                61
            ],
            [
                "ColorColumn",
                56
            ],
            [
                "QuickFixLine",
                129
            ],
            [
                "Whitespace",
                77
            ],
            [
                "MsgSeparator",
                90
            ],
            [
                "NormalFloat",
                67
            ]
        ],
        [
            "option_set",
            [
                "pumblend",
                15
            ]
        ],
        [
            "mouse_on",
            []
        ],
        [
            "mode_info_set",
            [
                true,
                [
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 250,
                        "blinkoff": 400,
                        "hl_id": 55,
                        "id_lm": 56,
                        "attr_id": 60,
                        "attr_id_lm": 78,
                        "name": "normal",
                        "short_name": "n"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 250,
                        "blinkoff": 400,
                        "hl_id": 55,
                        "id_lm": 56,
                        "attr_id": 60,
                        "attr_id_lm": 78,
                        "name": "visual",
                        "short_name": "v"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "vertical",
                        "cell_percentage": 25,
                        "blinkwait": 700,
                        "blinkon": 250,
                        "blinkoff": 400,
                        "hl_id": 55,
                        "id_lm": 56,
                        "attr_id": 60,
                        "attr_id_lm": 78,
                        "name": "insert",
                        "short_name": "i"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "horizontal",
                        "cell_percentage": 20,
                        "blinkwait": 700,
                        "blinkon": 250,
                        "blinkoff": 400,
                        "hl_id": 55,
                        "id_lm": 56,
                        "attr_id": 60,
                        "attr_id_lm": 78,
                        "name": "replace",
                        "short_name": "r"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 700,
                        "blinkon": 250,
                        "blinkoff": 400,
                        "hl_id": 55,
                        "id_lm": 56,
                        "attr_id": 60,
                        "attr_id_lm": 78,
                        "name": "cmdline_normal",
                        "short_name": "c"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "vertical",
                        "cell_percentage": 25,
                        "blinkwait": 700,
                        "blinkon": 250,
                        "blinkoff": 400,
                        "hl_id": 55,
                        "id_lm": 56,
                        "attr_id": 60,
                        "attr_id_lm": 78,
                        "name": "cmdline_insert",
                        "short_name": "ci"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "horizontal",
                        "cell_percentage": 20,
                        "blinkwait": 700,
                        "blinkon": 250,
                        "blinkoff": 400,
                        "hl_id": 55,
                        "id_lm": 56,
                        "attr_id": 60,
                        "attr_id_lm": 78,
                        "name": "cmdline_replace",
                        "short_name": "cr"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "horizontal",
                        "cell_percentage": 50,
                        "blinkwait": 700,
                        "blinkon": 250,
                        "blinkoff": 400,
                        "hl_id": 55,
                        "id_lm": 56,
                        "attr_id": 60,
                        "attr_id_lm": 78,
                        "name": "operator",
                        "short_name": "o"
                    },
                    {
                        "mouse_shape": 0,
                        "cursor_shape": "vertical",
                        "cell_percentage": 25,
                        "blinkwait": 700,
                        "blinkon": 250,
                        "blinkoff": 400,
                        "hl_id": 55,
                        "id_lm": 56,
                        "attr_id": 60,
                        "attr_id_lm": 78,
                        "name": "visual_select",
                        "short_name": "ve"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "cmdline_hover",
                        "short_name": "e"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "statusline_hover",
                        "short_name": "s"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "statusline_drag",
                        "short_name": "sd"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "vsep_hover",
                        "short_name": "vs"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "vsep_drag",
                        "short_name": "vd"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "more",
                        "short_name": "m"
                    },
                    {
                        "mouse_shape": 0,
                        "name": "more_lastline",
                        "short_name": "ml"
                    },
                    {
                        "cursor_shape": "block",
                        "cell_percentage": 0,
                        "blinkwait": 175,
                        "blinkon": 175,
                        "blinkoff": 150,
                        "hl_id": 55,
                        "id_lm": 56,
                        "attr_id": 60,
                        "attr_id_lm": 78,
                        "name": "showmatch",
                        "short_name": "sm"
                    }
                ]
            ]
        ],
        [
            "flush",
            []
        ]
    ]
}
{
    "name": "redraw",
    "args": [
        [
            "grid_line",
            [
                1,
                0,
                0,
                [
                    [
                        " ",
                        95
                    ],
                    [
                        "N"
                    ],
                    [
                        "O"
                    ],
                    [
                        "N"
                    ],
                    [
                        "E"
                    ],
                    [
                        " "
                    ],
                    [
                        " ",
                        94,
                        74
                    ]
                ]
            ]
        ],
        [
            "hl_attr_define",
            [
                160,
                {
                    "bold": true,
                    "foreground": 6582140,
                    "background": 3820380
                },
                {
                    "foreground": 60,
                    "background": 235
                },
                []
            ]
        ],
        [
            "grid_line",
            [
                1,
                1,
                0,
                [
                    [
                        " ",
                        62,
                        2
                    ],
                    [
                        "1"
                    ],
                    [
                        " "
                    ],
                    [
                        "\u21b2",
                        160
                    ],
                    [
                        " ",
                        61,
                        75
                    ]
                ]
            ],
            [
                1,
                2,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                3,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                4,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                5,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                6,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                7,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                8,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                9,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                10,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                11,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                12,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                13,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                14,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                15,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                16,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                17,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                18,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                19,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                20,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                21,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                22,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                23,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                24,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                25,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                26,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                27,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                28,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                29,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                30,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                31,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                32,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                33,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                34,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                35,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ],
            [
                1,
                36,
                0,
                [
                    [
                        "~",
                        64
                    ],
                    [
                        " ",
                        64,
                        79
                    ]
                ]
            ]
        ],
        [
            "flush",
            []
        ]
    ]
}
{
    "name": "redraw",
    "args": [
        [
            "grid_line",
            [
                1,
                37,
                0,
                [
                    [
                        " ",
                        140,
                        58
                    ],
                    [
                        "["
                    ],
                    [
                        "1"
                    ],
                    [
                        "]"
                    ],
                    [
                        " ",
                        140,
                        2
                    ],
                    [
                        "["
                    ],
                    [
                        ":"
                    ],
                    [
                        "u"
                    ],
                    [
                        "n"
                    ],
                    [
                        "i"
                    ],
                    [
                        "x"
                    ],
                    [
                        ":"
                    ],
                    [
                        "]"
                    ],
                    [
                        " "
                    ],
                    [
                        " ",
                        142
                    ],
                    [
                        "N"
                    ],
                    [
                        "O"
                    ],
                    [
                        "R"
                    ],
                    [
                        "M"
                    ],
                    [
                        "A"
                    ],
                    [
                        "L"
                    ],
                    [
                        " "
                    ]
                ]
            ]
        ],
        [
            "flush",
            []
        ]
    ]
}
{
    "name": "redraw",
    "args": [
        [
            "grid_cursor_goto",
            [
                1,
                1,
                4
            ]
        ],
        [
            "flush",
            []
        ]
    ]
}
```

</details>

これをneovimを埋め込んでいるアプリケーション側でハンドリングするとneovimのフロントエンドが作れる。  
pythonの場合、過去にneovimで実験用に作られていたGUIの実装が参考になる。

- https://github.com/neovim/python-gui


今回、Blenderのpython apiでneovimを埋め込むaddonが作れないか調べて大変そうだということがわかった。

## エディタの描画

OpenGLの関数が使えるので不可能ではなさそう

- https://docs.blender.org/api/current/bgl.html
- https://docs.blender.org/api/current/blf.html

## エディタ用のthreadを動かせる?

threadingはそのscriptの実行中に終わるもの以外やるべきじゃないみたい?

- https://docs.blender.org/api/current/info_gotcha.html#strange-errors-using-threading-module
- https://docs.blender.org/api/current/info_gotcha.html#can-i-redraw-during-the-script
- https://blender.stackexchange.com/questions/1050/blender-ui-multithreading-progressbar

modal operatorの中でtimerを用意して、
そのtimerのイベントごとに描画をupdateすることはできそう。  
ただ、それでまともにエディタとして動くのかはわからない。

threadingでneovimを動かしつつ、timerイベント時にupdateでもそこそこ動くのかもしれないが、  
それはサポート外だからクラッシュするかもねということらしい。

## ブロックせずにneovimからのeventを処理できる?

modal operatorでtimerイベントを受け取ったら、neovimからmessageが来てるか確認して、  
あればupdateなければ何もしない、が現時点では無理そう。

- https://github.com/neovim/pynvim/issues/214

## 感想

Blender上で描画するのは大変そうだが、neovimのフロントエンド実装は面白そう。
ネタでいいから1個作ってみたい。

(没になってrepositoryにならなかったようなものをメモとして残す場所としても使えるのもいい。)
