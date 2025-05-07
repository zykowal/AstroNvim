return {
  "max397574/better-escape.nvim",
  enabled = true,
  event = "VeryLazy",
  config = function()
    require("better_escape").setup {
      default_mappings = false,
      timeout = 300,
      mappings = {
        i = {
          j = {
            k = "<Esc>",
          },
        },
        c = {
          j = {
            k = "<Esc>",
          },
        },
        t = {
          j = {
            k = "<Esc>",
          },
        },
        v = {
          j = {
            k = "<Esc>",
          },
        },
        s = {
          j = {
            k = "<Esc>",
          },
        },
      },
    }
  end,
}
