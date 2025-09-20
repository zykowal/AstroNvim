return {
  {
    "folke/which-key.nvim",
    opts = { preset = "helix" },
  },

  {
    "NMAC427/guess-indent.nvim",
    enabled = false,
  },

  {
    "s1n7ax/nvim-window-picker",
    enabled = false,
  },

  {
    "astrotheme",
    enabled = false,
  },

  {
    "mrjones2014/smart-splits.nvim",
    enabled = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  -- use cargo check instead of cargo clippy
  -- {
  --   "AstroNvim/astrolsp",
  --   opts = {
  --     config = {
  --       rust_analyzer = {
  --         settings = {
  --           ["rust-analyzer"] = {
  --             check = { command = "check", extraArgs = {} },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
}
