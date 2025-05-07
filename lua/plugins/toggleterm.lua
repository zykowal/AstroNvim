return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function(_, opts)
    require("toggleterm").setup(opts)
    local Terminal = require("toggleterm.terminal").Terminal

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    end

    vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

    local terminal_count = 1

    function _G.open_new_h_terminal()
      terminal_count = terminal_count + 1
      local new_terminal = Terminal:new { count = terminal_count, direction = "horizontal" }
      new_terminal:toggle()
    end
    vim.api.nvim_set_keymap(
      "n",
      "<leader>tH",
      "<cmd>lua open_new_h_terminal()<CR>",
      { noremap = true, silent = true, desc = "Toggleterm horizontal terminal" }
    )

    function _G.open_new_v_terminal()
      terminal_count = terminal_count + 1
      local new_terminal = Terminal:new { count = terminal_count, direction = "vertical" }
      new_terminal:toggle()
    end
    vim.api.nvim_set_keymap(
      "n",
      "<leader>tV",
      "<cmd>lua open_new_v_terminal()<CR>",
      { noremap = true, silent = true, desc = "Toggleterm vertical terminal" }
    )
  end,
}
