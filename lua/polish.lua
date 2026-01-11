vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("x", "H", "^")
vim.keymap.set("x", "L", "$")

vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "Move to beginning of line" })
vim.keymap.set("i", "<C-e>", "<C-o>$", { desc = "Move to end of line" })
vim.keymap.set("i", "<C-d>", "<Delete>", { desc = "Delete character forward" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.del("n", "gra", { silent = true })
vim.keymap.del("n", "gri", { silent = true })
vim.keymap.del("n", "grn", { silent = true })
vim.keymap.del("n", "grr", { silent = true })
vim.keymap.del("n", "grt", { silent = true })

-- gitsigns
vim.keymap.set("n", "<leader>gB", "<Cmd>Gitsigns blame<CR>", { desc = "View Full Git blame" })
vim.keymap.set(
  "n",
  "<leader>gT",
  function() require("gitsigns").toggle_current_line_blame() end,
  { desc = "Toggle Git line blame" }
)
