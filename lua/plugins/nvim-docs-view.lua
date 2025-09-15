return {
  "amrbashir/nvim-docs-view",
  lazy = true,
  cmd = "DocsViewToggle",
  opts = {
    position = "bottom",
    update_mode = "manual",
  },
  dependencies = {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      function ToggleAndUpdateDocsView()
        vim.cmd "DocsViewToggle"
        vim.cmd "DocsViewUpdate"
      end

      vim.api.nvim_create_user_command("ToggleAndUpdateDocsView", ToggleAndUpdateDocsView, {})

      local maps = opts.mappings
      maps.n["gk"] = { "<CMD>ToggleAndUpdateDocsView<CR>", desc = "Docs View" }
    end,
  },
}
