return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    { "folke/snacks.nvim" },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>e"] = { "<cmd>Yazi<cr>", desc = "Yazi" },
            ["<Leader>o"] = { "<cmd>Yazi cwd<cr>", desc = "Yazi Cwd" },
          },
        },
      },
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  init = function() vim.g.loaded_netrwPlugin = 1 end,
}
