-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move cursor left" })

vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "Move to beginning of line" })
vim.keymap.set("i", "<C-e>", "<C-o>$", { desc = "Move to end of line" })

vim.keymap.set("i", "<C-d>", "<Delete>", { desc = "Delete character forward" })
