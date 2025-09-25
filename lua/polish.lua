-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move cursor left" })

vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "Move to beginning of line" })
vim.keymap.set("i", "<C-e>", "<C-o>$", { desc = "Move to end of line" })

vim.keymap.set("i", "<C-d>", "<Delete>", { desc = "Delete character forward" })

vim.keymap.del("n", "<leader>n", { silent = true })
vim.keymap.del("n", "gra", { silent = true })
vim.keymap.del("n", "gri", { silent = true })
vim.keymap.del("n", "grn", { silent = true })
vim.keymap.del("n", "grr", { silent = true })
vim.keymap.del("n", "grt", { silent = true })

vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Show implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Show declaration" })
vim.keymap.set("n", "gh", function() vim.lsp.buf.typehierarchy "subtypes" end, { desc = "Show subtypes" })
vim.keymap.set("n", "gH", function() vim.lsp.buf.typehierarchy "supertypes" end, { desc = "Show supertypes" })

local function set_cursor_color()
  vim.opt.guicursor = {
    "n-v-c:block-Cursor/lCursor",
    "i-ci-ve:block-CursorInsert/lCursorInsert",
    "r-cr:block-CursorReplace/lCursorReplace",
    "o:block-CursorOther/lCursorOther",
    "sm:block-CursorSearch/lCursorSearch",
  }

  vim.api.nvim_set_hl(0, "Cursor", { bg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "CursorReplace", { bg = "#E06C75" })
  vim.api.nvim_set_hl(0, "CursorOther", { bg = "#C678DD" })
  vim.api.nvim_set_hl(0, "CursorSearch", { bg = "#FF00FF" })
end

set_cursor_color()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_cursor_color,
})
