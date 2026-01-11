return {
  "ibhagwan/fzf-lua",
  event = "User AstroFile",
  cmd = "FzfLua",
  init = function() require("fzf-lua").register_ui_select() end,
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
          if maps.n.gd then maps.n.gd[1] = function() require("fzf-lua").lsp_definitions { jump1 = true } end end
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
        maps.n["<Leader>gt"] = { function() require("fzf-lua").git_status() end, desc = "Git status" }
        maps.n["<Leader>gw"] = { function() require("fzf-lua").git_worktrees() end, desc = "Git worktrees" }
        maps.n["<Leader>gA"] = { function() require("fzf-lua").git_stash() end, desc = "Git stash" }
        maps.n["<Leader>ga"] = { function() require("fzf-lua").git_tags() end, desc = "Git tags" }
        maps.i["<C-x><C-f>"] = { function() require("fzf-lua").complete_path() end, desc = "fuzzy complete path" }

        maps.n["<Leader>f<CR>"] = { function() require("fzf-lua").resume() end, desc = "Resume previous search" }
        maps.n["<Leader>f'"] = { function() require("fzf-lua").marks() end, desc = "Find marks" }
        maps.n["<Leader>/"] = {
          function() require("fzf-lua").blines { winopts = { preview = { hidden = true } } } end,
          desc = "Find words in current buffer",
        }
        maps.n["<Leader>fa"] = {
          function() require("fzf-lua").files { prompt = "Config> ", cwd = vim.fn.stdpath "config" } end,
          desc = "Find AstroNvim config files",
        }
        maps.n["<Leader>fb"] = { function() require("fzf-lua").buffers() end, desc = "Find buffers" }
        maps.n["<Leader>fc"] = { function() require("fzf-lua").grep_cword() end, desc = "Find word under cursor" }
        maps.n["<Leader>fC"] = { function() require("fzf-lua").commands() end, desc = "Find commands" }
        maps.n["<Leader>ff"] = { function() require("fzf-lua").files() end, desc = "Find files" }
        maps.n["<Leader>fh"] = { function() require("fzf-lua").helptags() end, desc = "Find help" }
        maps.n["<Leader>fk"] = {
          function()
            require("fzf-lua").keymaps {
              winopts = {
                preview = {
                  scrollbar = false,
                  layout = "horizontal",
                  horizontal = "right:62%",
                  vertical = "down:62%",
                },
              },
            }
          end,
          desc = "Find keymaps",
        }
        maps.n["<Leader>fm"] = { function() require("fzf-lua").marks() end, desc = "Find man" }
        maps.n["<Leader>fM"] = { function() require("fzf-lua").manpages() end, desc = "Find man" }
        maps.n["<Leader>fo"] = { function() require("fzf-lua").oldfiles() end, desc = "Find history" }
        maps.n["<Leader>fr"] = { function() require("fzf-lua").registers() end, desc = "Find registers" }
        maps.n["<Leader>fT"] = { function() require("fzf-lua").colorschemes() end, desc = "Find themes" }
        maps.n["<Leader>fw"] = { function() require("fzf-lua").live_grep_native() end, desc = "Find words" }
        maps.n["<Leader>ls"] = { function() require("fzf-lua").lsp_document_symbols() end, desc = "Search symbols" }
        maps.n["<Leader>lS"] =
        { function() require("fzf-lua").lsp_live_workspace_symbols() end, desc = "Search workspace symbols" }
        maps.n["gp"] = { function() require("fzf-lua").lsp_finder() end, desc = "Lsp finder" }
        maps.n["gh"] = { function() require("fzf-lua").lsp_type_sub() end, desc = "Show subtypes" }
        maps.n["gH"] = { function() require("fzf-lua").lsp_type_super() end, desc = "Show supertypes" }
        maps.n["gr"] = { function() require("fzf-lua").lsp_references() end, desc = "Search references" }
        maps.n["gD"] = { function() require("fzf-lua").lsp_declarations() end, desc = "Search declarations" }
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
        maps.n["<Leader>fl"] = { function() require("fzf-lua").loclist() end, desc = "Find loclist" }
        maps.n["<Leader>fL"] = { function() require("fzf-lua").loclist_stack() end, desc = "Find loclist stack" }
        maps.n["<Leader>fg"] = { function() require("fzf-lua").git_files() end, desc = "Search git files" }
        maps.n["<Leader>f/"] = { function() require("fzf-lua").search_history() end, desc = "Search history" }
        maps.n["z="] = { function() require("fzf-lua").spell_suggest() end, desc = "Spell suggest" }
      end,
    },
  },
  opts = {
    {
      "max-perf",
      "border-fused",
      "hide",
    },
    winopts = {
      height = 0.48,
      width = 1,
      row = 1,
      col = 0,
      border = "border-top",
      title_pos = "left",
      preview = {
        scrollbar = false,
        layout = "flex",
        horizontal = "right:62%",
        vertical = "down:62%",
      },
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
      true,          -- auto generate rest of fzf’s highlights?
      bg = "-1",
      gutter = "-1", -- I like this one too, try with and without
    },
  },
}
