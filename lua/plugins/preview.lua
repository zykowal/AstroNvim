return {
  "rmagatti/goto-preview",
  event = "BufRead",
  config = true,

  opts = {
    width = vim.o.columns,    -- Width of the floating window
    height = 16,              -- Height of the floating window
    default_mappings = false, -- Bind default mappings
    references = {            -- Configure the telescope UI for slowing the references cycling window.
      provider = "fzf_lua",   -- telescope|fzf_lua|snacks|mini_pick|default
    },
  },

  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["gpd"] =
        { function() require("goto-preview").goto_preview_definition() end, desc = "Goto Preview Definition" }
        maps.n["gpy"] = {
          function() require("goto-preview").goto_preview_type_definition() end,
          desc = "Goto Preview Type Definition",
        }
        maps.n["gpi"] =
        { function() require("goto-preview").goto_preview_implementation() end, desc = "Goto Preview Implementation" }
        maps.n["gpD"] =
        { function() require("goto-preview").goto_preview_declaration() end, desc = "Goto Preview Declaration" }
        maps.n["gpr"] =
        { function() require("goto-preview").goto_preview_references() end, desc = "Goto Preview References" }
      end,
    },
  },
}
