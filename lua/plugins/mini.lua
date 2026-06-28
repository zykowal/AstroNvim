return {
  "echasnovski/mini.ai",
  event = "User AstroFile",
  opts = {
    n_lines = 500,
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  },
}
