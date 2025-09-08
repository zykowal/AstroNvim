return {
  "A7Lavinraj/fyler.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        maps.n["<Leader>o"] = { "<Cmd>Fyler<CR>", desc = "Fyler" }
      end,
    },
  },
  cmd = "Fyler",
  opts = {
    mappings = {
      ["q"] = "CloseView",
      ["o"] = "Select",
      ["<C-t>"] = "SelectTab",
      ["|"] = "SelectVSplit",
      ["\\"] = "SelectSplit",
      ["H"] = "GotoParent",
      ["="] = "GotoCwd",
      ["L"] = "GotoNode",
      ["#"] = "CollapseAll",
    },
    win = {
      -- Changes window border
      border = "single",
      -- Changes buffer options
      buf_opts = {},
      win_opts = {
        -- window options
        relativenumber = false, -- sets vim.opt.relativenumber
        number = false, -- sets vim.opt.number
      },
    },
  },
}
