return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  specs = {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      local Terminal = require("toggleterm.terminal").Terminal
      maps.n["<C-e>"] = {
        "<Cmd>ToggleTerm size=" .. math.floor(vim.o.lines * 0.5) .. " direction=horizontal<CR>",
        desc = "ToggleTerm horizontal split",
      }
      maps.n["<C-y>"] = {
        "<Cmd>ToggleTerm size=" .. math.floor(vim.o.columns * 0.5) .. " direction=vertical<CR>",
        desc = "ToggleTerm vertical split",
      }

      if vim.fn.executable "btop" == 1 then
        maps.n["<Leader>tb"] = {
          callback = function() require("astrocore").toggle_term_cmd { cmd = "btop", direction = "float" } end,
          desc = "ToggleTerm btop",
        }
      end

      local terminal_count = 1

      function _G.open_new_h_terminal()
        terminal_count = terminal_count + 1
        local new_terminal = Terminal:new { count = terminal_count, direction = "horizontal" }
        new_terminal:toggle()
      end

      maps.n["<leader>tH"] = {
        "<cmd>lua open_new_h_terminal()<CR>",
        desc = "Toggleterm horizontal terminal",
      }

      function _G.open_new_v_terminal()
        terminal_count = terminal_count + 1
        local new_terminal = Terminal:new { count = terminal_count, direction = "vertical" }
        new_terminal:toggle()
      end

      maps.n["<leader>tV"] = {
        "<cmd>lua open_new_v_terminal()<CR>",
        desc = "Toggleterm vertical terminal",
      }
    end,
  },
}
