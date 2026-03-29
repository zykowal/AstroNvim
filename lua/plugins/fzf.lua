return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  specs = {
    { "stevearc/dressing.nvim", optional = true, opts = { select = { backend = { "fzf_lua" } } } },
    {
      "AstroNvim/astrolsp",
      optional = true,
      opts = function(_, opts)
        if require("astrocore").is_available "fzf-lua" then
          local maps = opts.mappings
          maps.n["<Leader>lD"] =
          { function() require("fzf-lua").diagnostics_workspace() end, desc = "Search diagnostics" }
          if maps.n.gd then
            maps.n.gd[1] = function()
              -- If you want to use ctags, uncomment the following lines
              -- local word = vim.fn.expand "<cword>"
              -- local before = vim.api.nvim_win_get_cursor(0)
              --
              -- local ok = pcall(vim.cmd, "silent tag " .. word)
              -- local after = vim.api.nvim_win_get_cursor(0)
              --
              -- if ok and (before[1] ~= after[1] or before[2] ~= after[2]) then
              --   local line = vim.api.nvim_get_current_line()
              --   local start_col = string.find(line, "%f[%w]" .. word .. "%f[%W]")
              --
              --   if start_col then vim.api.nvim_win_set_cursor(0, { after[1], start_col - 1 }) end
              --   return
              -- end
              require("fzf-lua").lsp_definitions { jump1 = true }
            end
          end
          if maps.n.gI then maps.n.gI[1] = function() require("fzf-lua").lsp_implementations() end end
          if maps.n["<Leader>lR"] then maps.n["<Leader>lR"][1] = function() require("fzf-lua").lsp_references() end end
          if maps.n.gy then maps.n.gy[1] = function() require("fzf-lua").lsp_typedefs() end end
          if maps.n["<Leader>lG"] then
            maps.n["<Leader>lG"][1] = function() require("fzf-lua").lsp_workspace_symbols() end
          end
        end
      end,
    },
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>f"] = vim.tbl_get(opts, "_map_sections", "f")
        maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
        maps.n["<Leader>gb"] = { function() require("fzf-lua").git_branches() end, desc = "Git branches" }
        maps.n["<Leader>gc"] = { function() require("fzf-lua").git_commits() end, desc = "Git commits (repository)" }
        maps.n["<Leader>gC"] = { function() require("fzf-lua").git_bcommits() end, desc = "Git commits (current file)" }
        maps.n["<Leader>gD"] = { function() require("fzf-lua").git_diff() end, desc = "Git Diff" }
        maps.n["<Leader>gh"] = { function() require("fzf-lua").git_hunks() end, desc = "Git Hunks" }
        maps.n["<Leader>gt"] = { function() require("fzf-lua").git_status() end, desc = "Git status" }
        maps.n["<Leader>gw"] = { function() require("fzf-lua").git_worktrees() end, desc = "Git worktrees" }
        maps.n["<Leader>gA"] = { function() require("fzf-lua").git_stash() end, desc = "Git stash" }
        maps.n["<Leader>ga"] = { function() require("fzf-lua").git_tags() end, desc = "Git tags" }
        maps.i["<C-x><C-f>"] = { function() require("fzf-lua").complete_path() end, desc = "fuzzy complete path" }

        maps.n["<Leader>f<CR>"] = { function() require("fzf-lua").resume() end, desc = "Resume previous search" }
        maps.n["<Leader>f'"] = { function() require("fzf-lua").marks() end, desc = "Find marks" }
        maps.n["<Leader>/"] = {
          function() require("fzf-lua").grep_curbuf() end,
          desc = "Find in current buffer",
        }
        maps.n["<Leader>fa"] = {
          function() require("fzf-lua").files { prompt = "Config> ", cwd = vim.fn.stdpath "config" } end,
          desc = "Find AstroNvim config files",
        }
        maps.n["<Leader>fb"] = { function() require("fzf-lua").buffers() end, desc = "Find buffers" }
        maps.n["<Leader>fc"] = { function() require("fzf-lua").grep_cword() end, desc = "Find word under cursor" }
        maps.n["<Leader>fC"] = { function() require("fzf-lua").commands() end, desc = "Find commands" }
        maps.n["<Leader>ff"] = { function() require("fzf-lua").files() end, desc = "Find files" }
        maps.n["<Leader><Leader>"] = { function() require("fzf-lua").files() end, desc = "Find files" }
        maps.n["<Leader>fh"] = { function() require("fzf-lua").helptags() end, desc = "Find help" }
        maps.n["<Leader>fk"] = {
          function()
            require("fzf-lua").keymaps {
              winopts = {
                preview = {
                  layout = "horizontal",
                  horizontal = "right:62%",
                },
              },
            }
          end,
          desc = "Find keymaps",
        }
        maps.n["<Leader>fn"] = { "<cmd>NoiceFzf<CR>", desc = "Find Messages" }
        maps.n["<Leader>fm"] = { function() require("fzf-lua").marks() end, desc = "Find marks" }
        maps.n["<Leader>fM"] = { function() require("fzf-lua").manpages() end, desc = "Find man" }
        maps.n["<Leader>fo"] = { function() require("fzf-lua").oldfiles() end, desc = "Find history" }
        maps.n["<Leader>fr"] = { function() require("fzf-lua").registers() end, desc = "Find registers" }
        maps.n['<Leader>f"'] = { function() require("fzf-lua").registers() end, desc = "Find registers" }
        maps.n["<Leader>fT"] = { function() require("fzf-lua").colorschemes() end, desc = "Find themes" }
        maps.n["<Leader>fw"] = { function() require("fzf-lua").grep_project() end, desc = "Find words" }
        maps.n["<Leader>ls"] = { function() require("fzf-lua").lsp_document_symbols() end, desc = "Search symbols" }
        maps.n["<Leader>lS"] =
        { function() require("fzf-lua").lsp_live_workspace_symbols() end, desc = "Search workspace symbols" }
        maps.n["gP"] = { function() require("fzf-lua").lsp_finder() end, desc = "Lsp finder" }
        maps.n["gh"] = { function() require("fzf-lua").lsp_type_sub() end, desc = "Show subtypes" }
        maps.n["gH"] = { function() require("fzf-lua").lsp_type_super() end, desc = "Show supertypes" }
        maps.n["gr"] = { function() require("fzf-lua").lsp_references() end, desc = "Search references" }
        maps.n["gD"] = { function() require("fzf-lua").lsp_declarations() end, desc = "Search declarations" }
        maps.n["gI"] = { function() require("fzf-lua").lsp_implementations() end, desc = "Search declarations" }
        maps.n["<Leader>:"] = { function() require("fzf-lua").command_history() end, desc = "Command history" }
        maps.n["<Leader>,"] = { function() require("fzf-lua").live_grep_native() end, desc = "Find words" }
        maps.n["<Leader>."] = { function() require("fzf-lua").buffers() end, desc = "Find buffers" }
        maps.v["<Leader>fw"] = { function() require("fzf-lua").grep_visual() end, desc = "Find selection" }
        maps.n["<Leader>fH"] = {
          function() require("fzf-lua").highlights() end,
          desc = "Find highlights",
        }
        maps.n["<Leader>fj"] = {
          function() require("fzf-lua").jumps() end,
          desc = "Find jumps",
        }

        maps.n["<Leader>fu"] = {
          function() require("fzf-lua").changes() end,
          desc = "Find changes",
        }
        maps.n["<Leader>fA"] = {
          function() require("fzf-lua").autocmds() end,
          desc = "Find autocmds",
        }
        maps.n["<Leader>ft"] = { "<CMD>TodoFzfLua<CR>", desc = "Find todos" }
        maps.n["<Leader>fd"] =
        { function() require("fzf-lua").diagnostics_document() end, desc = "Document diagnositics" }
        maps.n["<Leader>fD"] =
        { function() require("fzf-lua").diagnostics_workspace() end, desc = "Workspace diagnositics" }
        maps.n["<Leader>la"] = { function() require("fzf-lua").lsp_code_actions() end, desc = "Code actions" }
        maps.n["<Leader>fq"] = { function() require("fzf-lua").quickfix() end, desc = "Find quickfix" }
        maps.n["<Leader>fQ"] = { function() require("fzf-lua").quickfix_stack() end, desc = "Find quickfix stack" }
        maps.n["<Leader>fl"] = { function() require("fzf-lua").tags_live_grep() end, desc = "Find tags" }
        maps.v["<Leader>fl"] = { function() require("fzf-lua").tags_grep_visual() end, desc = "Find tags" }
        maps.n["<Leader>fL"] = { function() require("fzf-lua").grep() end, desc = "Grep Pattern" }
        maps.n["<Leader>fg"] = { function() require("fzf-lua").vcs_files() end, desc = "Search git files" }
        maps.n["<Leader>f/"] = { function() require("fzf-lua").search_history() end, desc = "Search history" }
        maps.n["z="] = {
          function()
            require("fzf-lua").spell_suggest {
              winopts = {
                border = "rounded",
                fullscreen = false,
              },
            }
          end,
          desc = "Spell suggest",
        }
        maps.n["<leader>fz"] = { function() require("fzf-lua").zoxide() end, desc = "Find zoxide" }
      end,
    },
  },
  opts = {
    {
      "fzf-native",
      "border-fused",
      "hide",
    },
    lsp = {
      symbols = {
        symbol_icons = {
          Array = "",
          Boolean = "󰨙",
          Class = "󰯳",
          Color = "󰰠",
          Control = "",
          Collapsed = ">",
          Constant = "󰯱",
          Constructor = "",
          Enum = "󰯹",
          EnumMember = "",
          Event = "",
          Field = "",
          File = "",
          Folder = "",
          Function = "󰡱",
          Interface = "󰰅",
          Key = "",
          Keyword = "󱕴",
          Method = "󰰑",
          Module = "󰆼",
          Namespace = "󰰔",
          Null = "",
          Number = "󰰔",
          Object = "󰲟",
          Operator = "",
          Package = "󰰚",
          Property = "󰲽",
          Reference = "󰰠",
          Snippet = "",
          String = "",
          Struct = "󰰣",
          Text = "󱜥",
          TypeParameter = "󰰦",
          Unit = "󱜥",
          Value = "",
          Variable = "󰫧",
        },
      },
    },
    winopts = {
      fullscreen = true,
      height = 1,
      width = 1,
      row = 1,
      col = 0,
      border = "border-top",
      title_pos = "left",
      treesitter = false,
      preview = {
        hidden = true,
        scrollbar = false,
        layout = "horizontal",
        horizontal = "up:62%",
      },
    },
    defaults = {
      git_icons = false,
      file_icons = false,
    },
    git = {
      hunks = {
        fzf_opts = {
          ["--layout"] = "reverse-list",
          ["--multi"] = true,
          ["--delimiter"] = ":",
          ["--nth"] = "3..",
        },
      },
    },
    fzf_opts = {
      ["--layout"] = "default",
    },
    keymap = {
      builtin = {
        true,
        ["<C-n>"] = "preview-page-down",
        ["<C-p>"] = "preview-page-up",
        ["<C-l>"] = "toggle-preview",
      },
      fzf = {
        true,
        ["ctrl-n"] = "preview-page-down",
        ["ctrl-p"] = "preview-page-up",
        ["ctrl-d"] = "half-page-down",
        ["ctrl-u"] = "half-page-up",
        ["ctrl-l"] = "toggle-preview",
        ["ctrl-q"] = "select-all+accept",
      },
    },
    fzf_colors = {
      true,
      bg = "-1",
      gutter = "-1",
    },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    require("fzf-lua").register_ui_select()
  end,
}
