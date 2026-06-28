-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("x", "H", "^")
vim.keymap.set("x", "L", "$")
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "Move to beginning of line" })
vim.keymap.set("i", "<C-e>", "<C-o>$", { desc = "Move to end of line" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "<C-Up>", "<Cmd>resize -2<CR>", { desc = "Resize split up" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize +2<CR>", { desc = "Resize split down" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize split left" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize split right" })

vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })

vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>;", "q:", { desc = "Command line" })

vim.keymap.set("n", "<C-q>", "<cmd>:copen<CR>", { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>lq", function() vim.diagnostic.setqflist() end, { desc = "Open qflist" })
vim.keymap.set("n", "<leader>ll", function() vim.diagnostic.setloclist() end, { desc = "Open loclist" })

vim.keymap.del({ "n", "x" }, "gra", { silent = true })
vim.keymap.del("n", "grx", { silent = true })
vim.keymap.del("n", "gri", { silent = true })
vim.keymap.del("n", "grn", { silent = true })
vim.keymap.del("n", "grr", { silent = true })
vim.keymap.del("n", "grt", { silent = true })

require('vim._core.ui2').enable()
