return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  version = "*",
  cmd = "Yazi",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>e"] = { "<Cmd>Yazi<CR>", desc = "Explorer" },
            ["<Leader>o"] = { "<Cmd>Yazi cwd<CR>", desc = "Explorer (Cwd)" },
          },
          v = {
            ["<Leader>e"] = { "<Cmd>Yazi<CR>", desc = "Explorer" },
          },
        },
      },
    },
  },
  opts = function()
    local opts = {
      open_for_directories = true,
      open_multiple_tabs = true,
      floating_window_scaling_factor = 0.8,
      keymaps = {
        show_help = "<F1>",
        open_file_in_vertical_split = "<c-v>",
        open_file_in_horizontal_split = "<c-s>",
        change_working_directory = "<c-e>",
      },
    }

    if pcall(require, "snacks") then
      opts.integrations = {
        grep_in_directory = "snacks.picker",
        grep_in_selected_files = "snacks.picker",
      }
    end

    return opts
  end,
}
