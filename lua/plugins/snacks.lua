return {
  "folke/snacks.nvim",
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>e"] = { function() require("snacks").picker.explorer() end, desc = "Explorer" },
          ["<leader>."] = { function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
          ["<leader>f."] = { function() require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },
        },
      },
    },
  },
  opts = {
    explorer = {
      enabled = true,
    },
    styles = {
      scratch = {
        width = 0.75,
        height = 0.75,
      },
    },
    zen = {
      toggles = {
        dim = true,
        git_signs = false,
        mini_diff_signs = false,
        diagnostics = true,
        inlay_hints = true,
      },
      win = {
        min_width = 140,
        wo = {
          relativenumber = true,
          number = true,
          spell = false,
          signcolumn = "no",
        },
      },
    },
    picker = {
      layout = "default",
      layouts = {
        default = {
          layout = {
            box = "horizontal",
            width = 0.85,
            min_width = 120,
            height = 0.85,
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = "rounded", width = 0.618 },
          },
        },
      },
      sources = {
        explorer = {
          auto_close = true,
          jump = { close = true },
          layout = { preset = "ivy", layout = { position = "top" } },
        },
      },
    },
    dashboard = {
      preset = {
        header = table.concat({
          [[                             ,----..          ,----,        ,--,                                                          ,--. ]],
          [[  ,----..                   /   /   \       .'   .`|      ,--.'|   ,---,                             ,---,              ,--.'| ]],
          [[ /   /   \           ,--,  /   .     :   .'   .'   ;   ,--,  | :,`--.' |       ,---,         ,--,   '  .' \         ,--,:  : | ]],
          [[|   :     :        ,'_ /| .   /   ;.  \,---, '    .',---.'|  : '|   :  :      /_ ./|       ,'_ /|  /  ;    '.    ,`--.'`|  ' : ]],
          [[|   |  ;. /   .--. |  | :.   ;   /  ` ;|   :     ./ |   | : _' |:   |  ',---, |  ' :  .--. |  | : :  :       \   |   :  :  | | ]],
          [[|   ; /--`  ,'_ /| :  . |;   |  ; \ ; |;   | .'  /  :   : |.'  ||   :  /___/ \.  : |,'_ /| :  . | :  |   /\   \  :   |   \ | : ]],
          [[|   | ;  __ |  ' | |  . .|   :  | ; | '`---' /  ;   |   ' '  ; :'   '  ;.  \  \ ,' '|  ' | |  . . |  :  ' ;.   : |   : '  '; | ]],
          [[|   : |.' .'|  | ' |  | |.   |  ' ' ' :  /  ;  /    '   |  .'. ||   |  | \  ;  `  ,'|  | ' |  | | |  |  ;/  \   \'   ' ;.    ; ]],
          [[|   | '_.' ::  | | :  ' ;'   ;  \; /  | ;  /  /--,  |   | :  | ''   :  ;  \  \    ' :  | | :  ' ; '  :  | \  \ ,'|   | | \   | ]],
          [[|   ; : \  ||  ; ' |  | ' \   \  ',  / /  /  / .`|  '   : |  : ;|   |  '   '  \   | |  ; ' |  | ' |  |  '  '--'  '   : |  ; .' ]],
          [[|   | '/  .':  | : ;  ; |  ;   :    /./__;       :  |   | '  ,/ '   :  |    \  ;  ; :  | : ;  ; | |  :  :        |   | '`--'   ]],
          [[|   :    /  '  :  `--'   \  \   \ .' |   :     .'   ;   : ;--'  ;   |.'      :  \  \'  :  `--'   \|  | ,'        '   : |       ]],
          [[ \   \ .'   :  ,      .-./   `---`   ;   |  .'      |   ,/      '---'         \  ' ;:  ,      .-./`--''          ;   |.'       ]],
          [[  `---`      `--`----'               `---'          '---'                      `--`  `--`----'                   '---'         ]],
        }, "\n"),
      },
    },
  },
}
