-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
vim.cmd [[
    silent! nunmap gr
    silent! nunmap grr
    silent! nunmap grn
    silent! nunmap gri
    silent! nunmap gra
    
    silent! vunmap gr
    silent! vunmap grc
    silent! vunmap grm
    silent! vunmap grn
    silent! xunmap gr
    silent! xunmap grc
    silent! xunmap grm
    silent! xunmap grn
  ]]

vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, { desc = "Show the references of current symbol" })
vim.keymap.set(
  "n",
  "gI",
  function() vim.lsp.buf.implementation() end,
  { desc = "Show the implementation of current symbol" }
)
