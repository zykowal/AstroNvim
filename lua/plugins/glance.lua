return {
  "dnlhc/glance.nvim",
  cmd = "Glance",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["gpd"] = { "<CMD>Glance definitions<CR>", desc = "Glance definitions" },
            ["gpr"] = { "<CMD>Glance references<CR>", desc = "Glance references" },
            ["gpy"] = { "<CMD>Glance type_definitions<CR>", desc = "Glance type definitions" },
            ["gpi"] = { "<CMD>Glance implementations<CR>", desc = "Glance implementations" },
          },
        },
      },
    },
  },
  opts = function()
    local glance = require "glance"
    local actions = glance.actions
    return {
      height = 25,
      border = {
        enable = true,
      },
      mappings = {
        list = {
          ["<leader>l"] = false,
          ["<C-h>"] = actions.enter_win "preview",
        },
        preview = {
          ["<leader>l"] = false,
          ["<C-l>"] = actions.enter_win "list",
          ["q"] = actions.close,
        },
      },
      use_trouble_qf = true,
    }
  end,
}
