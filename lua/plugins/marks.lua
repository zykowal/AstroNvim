return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  dependencies = {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      maps.n["ml"] = { "<Cmd>MarksQFListAll<CR>", desc = "List marks" }
    end,
  },
  opts = {
    excluded_filetypes = {
      "qf",
      "NvimTree",
      "toggleterm",
      "TelescopePrompt",
      "alpha",
      "netrw",
      "neo-tree",
      "snacks",
      "snacks_dashboard",
      "codecompanion",
    },
    default_mappings = true,
    mappings = {
      set_next = "mm",
      delete_buf = "mc",
      toggle = false,
    },
  },
}
