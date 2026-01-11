return {
  {
    "sindrets/diffview.nvim",
    event = "User AstroGitFile",
    cmd = { "DiffviewOpen" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { winbar_info = true },
        file_history = { winbar_info = true },
      },
      file_panel = {
        listing_style = "list",
      },
      hooks = { diff_buf_read = function(bufnr) vim.b[bufnr].view_activated = false end },
    },
    specs = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>go"] = {
                "<CMD>DiffviewOpen<CR>",
                desc = "DiffviewOpen",
              },
              ["<Leader>gq"] = {
                "<CMD>DiffviewClose<CR>",
                desc = "DiffviewClose",
              },
              ["<Leader>gf"] = {
                "<CMD>DiffviewFileHistory<CR>",
                desc = "DiffviewFileHistory",
              },
            },
          },
        },
      },
    },
  },
  {
    "linrongbin16/gitlinker.nvim",
    event = "BufRead",
    dependencies = {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local prefix = "<Leader>g"
        opts.mappings.n[prefix .. "y"] = { "<Cmd>GitLink<CR>", desc = "Git link copy" }
        opts.mappings.n[prefix .. "O"] = { "<Cmd>GitLink!<CR>", desc = "Git link open" }
        opts.mappings.v[prefix .. "y"] = { "<Cmd>GitLink<CR>", desc = "Git link copy" }
        opts.mappings.v[prefix .. "O"] = { "<Cmd>GitLink!<CR>", desc = "Git link open" }
      end,
    },
    opts = {},
  },
}
