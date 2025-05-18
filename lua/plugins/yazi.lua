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
    open_for_directories = true,
    open_multiple_tabs = true,
    floating_window_scaling_factor = 1,
    yazi_floating_window_border = "none",
    keymaps = {
      show_help = "<f1>",
      open_file_in_vertical_split = "<c-\\>",
      open_file_in_horizontal_split = "<c-_>",
      change_working_directory = "<c-e>",
    },
    integrations = {
      grep_in_directory = "snacks.picker",
      grep_in_selected_files = "snacks.picker",
    },
  },
  init = function() vim.g.loaded_netrwPlugin = 1 end,
}
