return {
  {
    "folke/snacks.nvim",
    opts = {
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
  },

  {
    "s1n7ax/nvim-window-picker",
    enabled = false,
  },

  {
    "astrotheme",
    enabled = false,
  },

  {
    "mrjones2014/smart-splits.nvim",
    enabled = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  -- disable debugger
  {
    "mfussenegger/nvim-dap",
    enabled = false,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = false,
  },

  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              check = { command = "check", extraArgs = {} },
            },
          },
        },
      },
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    opts = {
      transparent_background = true,
      term_colors = true,
    },
  },

  {
    "Saghen/blink.cmp",
    opts = {
      cmdline = {
        keymap = {
          ["<Tab>"] = { "show", "accept" },
          ["<S-Tab>"] = { "show_and_insert", "select_prev" },

          ["<C-N>"] = { "select_next", "show" },
          ["<C-P>"] = { "select_prev", "show" },
          ["<C-J>"] = { "select_next", "fallback" },
          ["<C-K>"] = { "select_prev", "fallback" },

          ["<C-Y>"] = { "select_and_accept" },
          ["<C-E>"] = { "cancel" },
        },
        completion = { menu = { auto_show = true } },
      },
      completion = {
        menu = {
          border = "none",
          scrollbar = false,
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
          },
        },
        documentation = {
          window = {
            border = "rounded",
            scrollbar = false,
          },
        },
      },
      signature = {
        window = {
          border = "none",
        },
      },
    },
  },
}
