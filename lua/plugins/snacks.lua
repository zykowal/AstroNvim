return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    {
      "AstroNvim/astrolsp",
      opts = {
        mappings = {
          n = {
            ["gd"] = {
              function() require("snacks").picker.lsp_definitions { layout = "ivy" } end,
              desc = "Definition",
            },
            ["gD"] = {
              function() require("snacks").picker.lsp_declarations { layout = "ivy" } end,
              desc = "Declaration",
            },
            ["gr"] = {
              function() require("snacks").picker.lsp_references { layout = "ivy" } end,
              nowait = true,
              desc = "References",
            },
            ["gI"] = {
              function() require("snacks").picker.lsp_implementations { layout = "ivy" } end,
              desc = "Implementation",
            },
            ["gy"] = {
              function() require("snacks").picker.lsp_type_definitions { layout = "ivy" } end,
              desc = "Type Definition",
            },
          },
        },
      },
    },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<leader>e"] = { function() require("snacks").explorer() end, desc = "File Explorer" },

            ["<leader>."] = { function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
            ["<leader>f."] = { function() require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },
            ["<leader>:"] = {
              function() require("snacks").picker.command_history { layout = "select" } end,
              desc = "Command History",
            },
            ["<leader>fD"] = {
              function() require("snacks").picker.diagnostics { layout = "vertical" } end,
              desc = "Diagnostics",
            },
            ["<leader>fd"] = {
              function() require("snacks").picker.diagnostics_buffer { layout = "vertical" } end,
              desc = "Buffer Diagnostics",
            },

            ["<leader>fi"] = { function() require("snacks").picker.icons() end, desc = "Find icons" },
          },
        },
      },
    },
  },
  opts = {
    words = {
      enabled = true,
    },
    quickfile = {
      enabled = true,
    },
    bigfile = {
      enabled = true,
    },
    notifier = {
      style = "minimal",
      top_down = false,
    },
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
          relativenumber = false,
          number = false,
          spell = false,
          signcolumn = "no",
        },
      },
    },
    picker = {
      hidden = true,
      ignored = true,
      layout = "default",
      matcher = {
        frecency = true,
      },
      win = {
        input = {
          keys = {
            ["o"] = { "confirm", mode = { "n" } },
            ["J"] = { "preview_scroll_down", mode = { "n" } },
            ["K"] = { "preview_scroll_up", mode = { "n" } },
            ["H"] = { "preview_scroll_left", mode = { "n" } },
            ["L"] = { "preview_scroll_right", mode = { "n" } },
          },
        },
      },
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

        vertical = {
          layout = {
            backdrop = false,
            width = 0.6,
            min_width = 100,
            height = 0.8,
            min_height = 30,
            box = "vertical",
            border = "rounded",
            title = "{title} {live} {flags}",
            title_pos = "center",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.495, border = "top" },
          },
        },

        vscode = {
          preview = false,
          layout = {
            backdrop = false,
            row = 1,
            width = 0.4,
            min_width = 80,
            height = 0.647,
            border = "none",
            box = "vertical",
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "left",
              { win = "list", border = "none" },
              { win = "input", height = 1, border = "top" },
            },
            { win = "preview", title = "{preview}", border = "rounded" },
          },
        },

        ivy = {
          layout = {
            box = "vertical",
            backdrop = false,
            row = -1,
            width = 0,
            height = 0.5,
            border = "top",
            title = " {title} {live} {flags}",
            title_pos = "left",
            { win = "input", height = 1, border = "bottom" },
            {
              box = "horizontal",
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", width = 0.618, border = "left" },
            },
          },
        },
      },
      sources = {
        explorer = {
          auto_close = true,
          jump = { close = true },
          layout = { preset = "vscode" },
        },
      },
    },
    dashboard = {
      preset = {
        header = table.concat({
          "                                                                                  ",
          "                                                                                  ",
          "                      *((##*                                                      ",
          "                  /###%%#%&&&%,                           .%((//(/.               ",
          "                  #%%&&&&@@@@@@@*                        #%#&%@&%%##%%            ",
          "                 &&&@@@@@@@@@@@@@   .**(/(,*,/,*,       &@@@@@@@@@&&%%%*          ",
          "                 @@@@@@@@@@&@*                         %@@@@@@@@@@@@&&&&          ",
          "                  @@@@%/,               ,                 /@&%@@@@@@@&&&*         ",
          "                   &@,                 .                      /%@@@@@@@&.         ",
          "                .(..                  ,                         *#@@@@@#          ",
          "              .(                                                 .@@@@*           ",
          "              #                                                    (              ",
          "             ,             *%@%             .@@@@&*                 ,             ",
          "          *            /@@@@@@&            @@@@@@@@&                .*            ",
          "          ,            @@@@@@@@,   ...  .   .@@@@@@@@@                 /          ",
          "          /           @@@@@@/                  *&@@@@@&                           ",
          "         /           ,@&@@@.    %@@@@@@@@@,     .#@@@&&                 ,         ",
          "         #            (%%%/    *@@@@@@@@@%*      *&%#(*                 /         ",
          "         *        .     .           /                   , .,.                     ",
          "          .                /                     *                      *         ",
          "          *                #.    ./%,%/.      ,%                       /..        ",
          "          .,                                                        ,,*  *        ",
          "            %*                                 (%%#%%(,          *&*..    ,       ",
          "           ,/**#@%,**         ........ ...    #&&&@&&&%%%&(,#@@@@@&##%(%%#,,.     ",
          "          .%@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@(@@@@@@&&@@%&%%&&&#@@@@@@@@&&&%(,    ",
          "          (%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@&&%&@%&@@@@@@@@@%#,   ",
          "        *&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@&%&&*&@@@@@@&&#.  ",
          "        &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@&@@@&&(@@@@@@&%* ",
          "      .#@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@%@@@(@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@##@@@@#.",
          "      /@@@@@@@@@@@%%&%@&##%&#%/(@(&#%%###%&%@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&/",
          "     @@@@@@@@@@%((/((**,.,,,,*,,.,*.*.,*,,,,.. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/",
          "    .@@@@@@@@@/.*   .                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(",
        }, "\n"),
      },
      sections = {
        { section = "header", padding = 5 },
      },
    },
  },
}
