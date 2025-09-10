return {
  "cbochs/grapple.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "AstroNvim/astroui", opts = { icons = { Grapple = "󰛢" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "go"
        maps.n[prefix] = { desc = require("astroui").get_icon("Grapple", 1, true) .. "Grapple" }
        maps.n[prefix .. "a"] = { "<Cmd>Grapple tag<CR>", desc = "Add file" }
        maps.n[prefix .. "d"] = { "<Cmd>Grapple untag<CR>", desc = "Remove file" }
        maps.n[prefix .. "l"] = { "<Cmd>Grapple toggle_tags<CR>", desc = "Toggle a file" }
        maps.n[prefix .. "e"] = { "<Cmd>Grapple toggle_scopes<CR>", desc = "Select from tags" }
        maps.n[prefix .. "s"] = { "<Cmd>Grapple toggle_loaded<CR>", desc = "Select a project scope" }
        maps.n[prefix .. "x"] = { "<Cmd>Grapple reset<CR>", desc = "Clear tags from current project" }
      end,
    },
  },
  cmd = { "Grapple" },
}
