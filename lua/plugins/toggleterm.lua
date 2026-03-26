return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  opts = {
    float_opts = {
      border = "none",
    },
  },
  specs = {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      local Terminal = require("toggleterm.terminal").Terminal
      maps.n["<C-e>"] = {
        "<Cmd>ToggleTerm size=" .. math.floor(vim.o.lines * 0.5) .. " direction=horizontal<CR>",
        desc = "ToggleTerm horizontal split",
      }
      maps.t["<C-e>"] = {
        "<Cmd>ToggleTerm size=" .. math.floor(vim.o.lines * 0.5) .. " direction=horizontal<CR>",
        desc = "ToggleTerm horizontal split",
      }

      local terminal_count = 1

      maps.t["<C-y>"] = {
        function()
          terminal_count = terminal_count + 1
          local new_terminal = Terminal:new { count = terminal_count, direction = "horizontal" }
          new_terminal:toggle()
        end,
        desc = "ToggleTerm horizontal split",
      }

      if vim.fn.executable "btop" == 1 then
        maps.n["<Leader>tb"] = {
          callback = function() require("astrocore").toggle_term_cmd { cmd = "btop", direction = "float" } end,
          desc = "ToggleTerm btop",
        }
      end
    end,
  },
}
