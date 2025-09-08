return {
  "amrbashir/nvim-docs-view",
  lazy = true,
  cmd = "DocsViewToggle",
  opts = {
    position = "bottom",
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["gk"] = { "<CMD>DocsViewToggle<CR>", desc = "Docs View" },
          },
        },
      },
    },
  },
}
