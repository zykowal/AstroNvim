return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon
    local buf_utils = require "astrocore.buffer"

    opts.explorer = { enabled = false }
    opts.bigfile = { enabled = true }
    opts.quickfile = { enabled = true }
    opts.scope = { enabled = true }
    opts.statuscolumn = { enabled = true }
    opts.words = { enabled = true }
    opts.scratch = { enabled = false }

    opts.styles = {
      input = {
        relative = "cursor",
        row = -3,
        col = 0,
      },
    }

    -- configure picker and `vim.ui.select`
    opts.picker = {
      ui_select = true,
      enabled = true,
      hidden = true,
      ignored = true,
      layout = "default",
      matcher = {
        frecency = true,
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "i", "n" } },
            ["<C-l>"] = { "toggle_preview", mode = { "i", "n" } },
            ["o"] = { "confirm", mode = { "n" } },
            ["J"] = { "preview_scroll_down", mode = { "n" } },
            ["K"] = { "preview_scroll_up", mode = { "n" } },
            ["H"] = { "preview_scroll_left", mode = { "n" } },
            ["L"] = { "preview_scroll_right", mode = { "n" } },
          },
        },
      },
      layouts = {
        custom_bottom = {
          layout = {
            box = "horizontal",
            backdrop = false,
            row = -1,
            width = 0,
            height = 0.5,
            border = "none",
            title = " {title} {live} {flags}",
            title_pos = "left",
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              { win = "list",  border = "none" },
              { win = "input", height = 1,     border = "none" },
            },
            { win = "preview", title = "{preview}", border = "rounded", width = 0.618 },
          },
        },

        default = {
          layout = {
            box = "horizontal",
            row = -1,
            width = 0,
            height = 0.5,
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              { win = "list",  border = "none" },
              { win = "input", height = 1,     border = "none" },
            },
            { win = "preview", title = "{preview}", border = "rounded", width = 0.618 },
          },
        },

        vertical = {
          layout = {
            box = "horizontal",
            backdrop = false,
            row = -1,
            width = 0,
            height = 0.5,
            border = "rounded",
            title = "{title} {live} {flags}",
            title_pos = "center",
            { win = "input",   height = 1,          border = "bottom" },
            { win = "list",    border = "none" },
            { win = "preview", title = "{preview}", height = 0.495,   border = "top" },
          },
        },

        vscode = {
          preview = false,
          layout = {
            box = "horizontal",
            backdrop = false,
            row = -1,
            width = 0,
            height = 0.5,
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "left",
              { win = "list",  border = "none" },
              { win = "input", height = 1,     border = "top" },
            },
            { win = "preview", title = "{preview}", border = "rounded" },
          },
        },
      },
    }

    opts.dashboard = {
      preset = {
        header = table.concat({
          [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢠⣿⣷⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⢠⣿⣿⣿⣿⣄⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣦⣀⣠⠴⠚⢛⣛⣭⣥⣽⣶⣶⣶⣶⣶⣶⣶⣶⣴⣮⣭⣛⣒⡢⢤⣄⣀⡀⠀⠀⣠⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⡿⠟⣃⣀⣴⢶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡭⢟⣵⣿⣿⣿⣿⣿⣿⠇⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⡿⠛⣹⣶⠿⣿⣿⣷⡿⠿⢿⣿⠿⠛⠛⠛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣻⣴⣿⣿⣿⣿⣿⣿⣿⡟⢸⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢲⣶⣶⣶⣶⡾⣉⣤⣾⣿⣿⣿⠿⣿⣿⣋⣙⣿⡇⢀⠀⠰⣿⡷⠀⢹⣿⠛⠛⣿⣿⣿⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠹⣿⠟⣋⣵⣿⢏⣾⣿⣿⢻⣥⣶⣿⣿⣿⣿⣷⣌⣻⠷⠖⢀⣠⣿⡛⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣙⠿⠿⣿⣿⠿⠿⣛⣤⣅⣤⣠⣤⣤⣤⣶⣶⡄⠀⠀
⠀⠀⠀⠀⠀⠀⢠⡾⣒⣿⡟⣡⣦⣿⣿⣿⡇⣩⣛⠿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡛⢛⣛⣛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿⡿⣫⣵⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣾⢡⣿⠿⠙⣽⡶⠿⣿⣿⣧⣛⣵⡄⢀⡀⠀⠀⠀⠈⠙⠻⠿⡿⠿⠿⠿⠟⢊⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣙⠻⠿⠿⢿⡿⠟⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣼⠃⣿⣿⡷⢿⠟⣩⣾⣿⣿⣿⣿⣿⡇⠀⣟⡷⠀⠀⠀⠀⠀⠀⢺⡿⠃⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⣧⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⢠⣿⣿⡶⣿⣟⣿⣿⣿⣿⣿⣿⣿⠇⠀⢁⣤⣶⠞⣡⣴⣶⣶⣶⠚⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⡷⢸⣿⣿⣵⡿⢿⣩⣷⣿⣿⣿⣿⠟⢀⣴⣿⣿⣷⣿⣿⣿⠟⢋⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣷⠸⣿⣯⣠⡿⠦⠿⣿⣿⣿⣿⣿⢀⣾⣿⡿⢻⣿⠻⣫⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⡟⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢻⡄⢿⣿⣗⢳⡶⢷⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⠇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠘⣇⡘⣿⣿⣞⣿⣶⢟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣰⡟⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣽⣷⡌⢿⣿⣿⣻⡿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣴⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠰⠿⠿⠿⠿⣆⠹⣿⣿⣷⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⡶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢶⣉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣩⣍⣉⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣡⣴⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠱⢦⡍⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣄⢻⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣟⣏⣴⠿⠻⢿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠶⣬⣙⡙⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣷⣝⢿⣿⡇⡿⢿⠟⣻⡿⠷⠚⠉⠁⠀⠀⠀⠀⠉⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠒⠲⣷⣭⣭⣭⣭⣭⣭⣭⡴⢍⢠⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]],
        }, "\n"),
      },
      sections = {
        { section = "header", padding = 5 },
        { section = "startup" },
      },
    }

    -- configure image support
    opts.image = { doc = { enabled = false } }

    -- configure `vim.ui.input`
    opts.input = {}

    -- configure notifier
    opts.notifier = {
      enabled = true,
      timeout = 3000,
      style = "minimal",
      top_down = false,
    }

    opts.notifier.icons = {
      debug = get_icon "Debugger",
      error = get_icon "DiagnosticError",
      info = get_icon "DiagnosticInfo",
      trace = get_icon "DiagnosticHint",
      warn = get_icon "DiagnosticWarn",
    }

    opts.indent = {
      enabled = false,
      animate = { enabled = false },
    }

    opts.scope = {
      filter = function(bufnr) return buf_utils.is_valid(bufnr) and not buf_utils.is_large(bufnr) end,
    }

    opts.zen = {
      toggles = {
        dim = false,
        git_signs = true,
        mini_diff_signs = false,
        diagnostics = true,
        inlay_hints = false,
      },
      on_open = function(win)
        -- disable snacks indent
        vim.b[win.buf].snacks_indent_old = vim.b[win.buf].snacks_indent
        vim.b[win.buf].snacks_indent = false
      end,
      on_close = function(win)
        -- restore snacks indent setting
        vim.b[win.buf].snacks_indent = vim.b[win.buf].snacks_indent_old
      end,
      win = {
        width = function() return math.min(140, math.floor(vim.o.columns * 0.75)) end,
        height = 0.9,
        backdrop = {
          transparent = false,
          win = { wo = { winhighlight = "Normal:Normal" } },
        },
        wo = {
          number = false,
          relativenumber = false,
          signcolumn = "no",
          foldcolumn = "0",
          winbar = "",
          list = false,
          showbreak = "NONE",
        },
      },
    }

    -- LSP progress
    local progress = vim.defaulttable()
    vim.api.nvim_create_autocmd("LspProgress", {
      ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params
        .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then return end
        local p = progress[client.id]

        for i = 1, #p + 1 do
          if i == #p + 1 or p[i].token == ev.data.params.token then
            p[i] = {
              token = ev.data.params.token,
              msg = ("[%3d%%] %s%s"):format(
                value.kind == "end" and 100 or value.percentage or 100,
                value.title or "",
                value.message and (" **%s**"):format(value.message) or ""
              ),
              done = value.kind == "end",
            }
            break
          end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v) return table.insert(msg, v.msg) or not v.done end, p)

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(table.concat(msg, "\n"), "info", {
          id = "lsp_progress",
          title = client.name,
          opts = function(notif)
            notif.icon = #progress[client.id] == 0 and " "
                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
          end,
        })
      end,
    })
  end,
  specs = {
    {
      "folke/todo-comments.nvim",
      optional = true,
      dependencies = { "folke/snacks.nvim" },
      specs = {
        {
          "AstroNvim/astrocore",
          opts = {
            mappings = {
              n = {
                ["<Leader>fT"] = {
                  function()
                    if not package.loaded["todo-comments"] then -- make sure to load todo-comments
                      require("lazy").load { plugins = { "todo-comments.nvim" } }
                    end
                    require("snacks").picker.todo_comments()
                  end,
                  desc = "Todo Comments",
                },
              },
            },
          },
        },
      },
    },
    {
      "AstroNvim/astrolsp",
      ---@param opts AstroLSPOpts
      opts = function(_, opts)
        if require("astrocore").is_available "snacks.nvim" then
          opts.mappings.n.gr = {
            function() require("snacks.picker").lsp_references() end,
            desc = "LSP References",
            cond = "textDocument/references",
          }
          opts.mappings.n.gD = {
            function() require("snacks.picker").lsp_declarations() end,
            desc = "LSP Declarations",
            cond = "textDocument/declaration",
          }
          opts.mappings.n.gI = {
            function() require("snacks.picker").lsp_implementations() end,
            desc = "LSP Implementations",
            cond = "textDocument/implementation",
          }
          opts.mappings.n.gO = {
            function() require("snacks.picker").lsp_symbols() end,
            desc = "LSP Document Symbols",
          }

          if opts.mappings.n.gd then
            opts.mappings.n.gd[1] = function() require("snacks.picker").lsp_definitions() end
          end
          if opts.mappings.n.gI then
            opts.mappings.n.gI[1] = function() require("snacks.picker").lsp_implementations() end
          end
          if opts.mappings.n.gy then
            opts.mappings.n.gy[1] = function() require("snacks.picker").lsp_type_definitions() end
          end
          if opts.mappings.n["<Leader>lG"] then
            opts.mappings.n["<Leader>lG"][1] = function() require("snacks.picker").lsp_workspace_symbols() end
          end
          if opts.mappings.n["<Leader>lR"] then
            opts.mappings.n["<Leader>lR"][1] = function() require("snacks.picker").lsp_references() end
          end
        elseif require("astrocore").is_available "telescope.nvim" then
          if opts.mappings.n.gd then
            opts.mappings.n.gd[1] = function() require("telescope.builtin").lsp_definitions { reuse_win = true } end
          end
          if opts.mappings.n.gI then
            opts.mappings.n.gI[1] = function() require("telescope.builtin").lsp_implementations { reuse_win = true } end
          end
          if opts.mappings.n.gy then
            opts.mappings.n.gy[1] = function() require("telescope.builtin").lsp_type_definitions { reuse_win = true } end
          end
          if opts.mappings.n["<Leader>lG"] then
            opts.mappings.n["<Leader>lG"][1] = function()
              vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
                if query then
                  -- word under cursor if given query is empty
                  if query == "" then query = vim.fn.expand "<cword>" end
                  require("telescope.builtin").lsp_workspace_symbols {
                    query = query,
                    prompt_title = ("Find word (%s)"):format(query),
                  }
                end
              end)
            end
          end
          if opts.mappings.n["<Leader>lR"] then
            opts.mappings.n["<Leader>lR"][1] = function() require("telescope.builtin").lsp_references() end
          end
        end
      end,
    },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local snack_opts = require("astrocore").plugin_opts "snacks.nvim"

        -- Snacks.indent mappings
        maps.n["<Leader>u|"] =
        { function() require("snacks").toggle.indent():toggle() end, desc = "Toggle indent guides" }

        -- Snacks.notifier mappings
        if vim.tbl_get(snack_opts, "notifier", "enabled") ~= false then
          maps.n["<Leader>uD"] = { function() require("snacks.notifier").hide() end, desc = "Dismiss notifications" }
        end

        -- Snacks.gitbrowse mappings
        if vim.tbl_get(snack_opts, "gitbrowse", "enabled") ~= false then
          if vim.fn.executable "git" == 1 then
            maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
            maps.n["<Leader>go"] = { function() require("snacks").gitbrowse() end, desc = "Git browse (open)" }
            maps.x["<Leader>go"] = { function() require("snacks").gitbrowse() end, desc = "Git browse (open)" }
          end
        end

        -- Snacks.picker
        if vim.tbl_get(snack_opts, "picker", "enabled") ~= false then
          maps.n["<Leader>f"] = vim.tbl_get(opts, "_map_sections", "f")
          if vim.fn.executable "git" == 1 then
            maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
            maps.n["<Leader>gb"] = { function() require("snacks").picker.git_branches() end, desc = "Git branches" }
            maps.n["<Leader>gc"] = {
              function() require("snacks").picker.git_log() end,
              desc = "Git commits (repository)",
            }
            maps.n["<Leader>gC"] = {
              function() require("snacks").picker.git_log { current_file = true, follow = true } end,
              desc = "Git commits (current file)",
            }
            maps.n["<Leader>gt"] = { function() require("snacks").picker.git_status() end, desc = "Git status" }
            maps.n["<Leader>gT"] = { function() require("snacks").picker.git_stash() end, desc = "Git stash" }
          end
          maps.n["<Leader>f<CR>"] =
          { function() require("snacks").picker.resume() end, desc = "Resume previous search" }
          maps.n["<Leader>f'"] = { function() require("snacks").picker.marks() end, desc = "Find marks" }
          maps.n["<Leader>fa"] = {
            function() require("snacks").picker.files { dirs = { vim.fn.stdpath "config" }, desc = "Config Files" } end,
            desc = "Find AstroNvim config files",
          }
          maps.n["<Leader>fb"] = { function() require("snacks").picker.buffers() end, desc = "Find buffers" }
          maps.n["<Leader>fc"] =
          { function() require("snacks").picker.grep_word() end, desc = "Find word under cursor" }
          maps.n["<Leader>fC"] = { function() require("snacks").picker.commands() end, desc = "Find commands" }
          maps.n["<Leader>ff"] = {
            function()
              require("snacks").picker.files {
                hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat ".git" or {}, "type") == "directory",
              }
            end,
            desc = "Find files",
          }
          maps.n["<Leader>fF"] = {
            function() require("snacks").picker.files { hidden = true, ignored = true } end,
            desc = "Find all files",
          }
          maps.n["<Leader>fg"] = { function() require("snacks").picker.git_files() end, desc = "Find git files" }
          maps.n["<Leader>fh"] = { function() require("snacks").picker.help() end, desc = "Find help" }
          maps.n["<Leader>fk"] = { function() require("snacks").picker.keymaps() end, desc = "Find keymaps" }
          maps.n["<Leader>fm"] = { function() require("snacks").picker.man() end, desc = "Find man" }
          maps.n["<Leader>fn"] =
          { function() require("snacks").picker.notifications() end, desc = "Find notifications" }
          maps.n["<Leader>fo"] = { function() require("snacks").picker.recent() end, desc = "Find old files" }
          maps.n["<Leader>fO"] = {
            function() require("snacks").picker.recent { filter = { cwd = true } } end,
            desc = "Find old files (cwd)",
          }
          maps.n["<Leader>fp"] = { function() require("snacks").picker.projects() end, desc = "Find projects" }
          maps.n["<Leader>fr"] = { function() require("snacks").picker.registers() end, desc = "Find registers" }
          maps.n["<Leader>fs"] = { function() require("snacks").picker.smart() end, desc = "Find buffers/recent/files" }
          maps.n["<Leader>ft"] = { function() require("snacks").picker.colorschemes() end, desc = "Find themes" }
          if vim.fn.executable "rg" == 1 then
            maps.n["<Leader>fw"] = { function() require("snacks").picker.grep() end, desc = "Find words" }
            maps.n["<Leader>fW"] = {
              function() require("snacks").picker.grep { hidden = true, ignored = true } end,
              desc = "Find words in all files",
            }
          end
          maps.n["<Leader>fu"] = { function() require("snacks").picker.undo() end, desc = "Find undo history" }
          maps.n["<Leader>lD"] = { function() require("snacks").picker.diagnostics() end, desc = "Search diagnostics" }
          maps.n["<Leader>ls"] = {
            function()
              local aerial_avail, aerial = pcall(require, "aerial")
              if aerial_avail and aerial.snacks_picker then
                aerial.snacks_picker()
              else
                require("snacks").picker.lsp_symbols()
              end
            end,
            desc = "Search symbols",
          }
        end

        maps.n["<Leader>."] = { function() require("snacks").picker.buffers() end, desc = "Find buffers" }
        maps.n["<Leader>,"] = { function() require("snacks").picker.grep() end, desc = "Find words" }
        maps.n["<Leader>/"] = { function() require("snacks").picker.lines() end, desc = "Find lines" }
        maps.n["<Leader>f/"] = { function() require("snacks").picker.search_history() end, desc = "Search history" }
        maps.n["<Leader>fH"] = { function() require("snacks").picker.highlights() end, desc = "Find highlights" }
        maps.n["<Leader>fj"] = { function() require("snacks").picker.jumps() end, desc = "Find jumps" }
        maps.n["<Leader>fD"] = { function() require("snacks").picker.diagnostics() end, desc = "All diagnostics" }
        maps.n["<Leader>fd"] =
        { function() require("snacks").picker.diagnostics_buffer() end, desc = "Buffer diagnostics" }
        maps.n["<Leader>:"] = { function() require("snacks").picker.command_history() end, desc = "Command history" }
        maps.n["<Leader>fi"] = { function() require("snacks").picker.icons() end, desc = "Find icons" }
        maps.n["<Leader>fl"] = { function() require("snacks").picker.loclist() end, desc = "Find loclist" }
        maps.n["<Leader>fq"] = { function() require("snacks").picker.quickfix() end, desc = "Find quickfix" }
        maps.n["<Leader>fA"] = { function() require("snacks").picker.autocmds() end, desc = "Find autocommands" }
        maps.n["<Leader><Leader>"] = {
          function()
            require("snacks").picker.files {
              hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat ".git" or {}, "type") == "directory",
            }
          end,
          desc = "Find files",
        }
        maps.n["<Leader>gg"] = { function() require("snacks").lazygit() end, desc = "Open Lazygit" }

        maps.n["<C-e>"] = {
          function()
            require("snacks").terminal.toggle(nil, {
              win = {
                position = "top",
                height = 0.5,
                title = "",
                wo = {
                  winbar = "",
                  statuscolumn = "",
                },
              },
            })
          end,
          desc = "Toggle Terminal",
        }
        maps.t["<C-e>"] = {
          function()
            require("snacks").terminal.toggle(nil, {
              win = {
                position = "top",
                height = 0.5,
                title = "",
                wo = {
                  winbar = "",
                  statuscolumn = "",
                },
              },
            })
          end,
          desc = "Toggle Terminal",
        }
      end,
    },
  },
}
