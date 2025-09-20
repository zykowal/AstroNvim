return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/notes",
        syntax = "markdown",
        ext = ".md",
      },
    }

    vim.g.vimwiki_key_mappings = { all_maps = 0 }
    vim.g.vimwiki_folding = "expr"
  end,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<leader>ni"] = { "<cmd>VimwikiIndex<CR>", desc = "Vimwiki Index" },
            ["<leader>nd"] = { "<cmd>VimwikiMakeDiaryNote<CR>", desc = "Diary Note" },
            ["<leader>nx"] = { "<cmd>VimwikiDeleteFile<CR>", desc = "Delete current wiki" },
            ["<leader>nr"] = { "<cmd>VimwikiRenameFile<CR>", desc = "Rename current wiki" },
            ["<leader>nl"] = { "<cmd>VimwikiFollowLink<CR>", desc = "Follow Link" },
            ["<leader>nh"] = { "<cmd>VimwikiGoBackLink<CR>", desc = "Go Back Link" },
          },
        },
      },
    },
  },
}
