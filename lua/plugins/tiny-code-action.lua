return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    {
      "AstroNvim/astrolsp",
      optional = true,
      ---@type AstroLSPOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>la"] = {
              ---@diagnostic disable-next-line: missing-parameter
              function() require("tiny-code-action").code_action() end,
              desc = "LSP code action",
              cond = "testDocument/codeAction",
            },
          },
          v = {
            ["<Leader>la"] = {
              ---@diagnostic disable-next-line: missing-parameter
              function() require("tiny-code-action").code_action() end,
              desc = "LSP code action",
              cond = "testDocument/codeAction",
            },
          },
        },
      },
    },
    { "nvim-lua/plenary.nvim" },
  },
  event = "LspAttach",
  opts = {
    -- `delta`, `vim`, `difftastic`
    backend = "difftastic",
    picker = {
      "snacks",
      opts = {
        layout = "default",
      },
    },
  },
}
