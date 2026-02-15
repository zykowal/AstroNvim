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
              ["<Leader>gO"] = {
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
}
