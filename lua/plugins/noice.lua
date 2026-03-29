return {
  "folke/noice.nvim",
  event = "BufReadPost",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = function(_, opts)
    local utils = require "astrocore"
    return utils.extend_tbl(opts, {
      views = {
        hover = {
          scrollbar = false,
        },
      },
      lsp = {
        signature = {
          enabled = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = false,
        },
      },
      presets = {
        bottom_search = false,                             -- use a classic bottom cmdline for search
        command_palette = false,                           -- position the cmdline and popupmenu together
        long_message_to_split = true,                      -- long messages will be sent to a split
        inc_rename = utils.is_available "inc-rename.nvim", -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,                             -- add a border to hover docs and signature help
      },
    })
  end,
  specs = {
    {
      "AstroNvim/astrolsp",
      optional = true,
      ---@param opts AstroLSPOpts
      opts = function(_, opts)
        local noice_opts = require("astrocore").plugin_opts "noice.nvim"
        -- disable the necessary handlers in AstroLSP
        if not opts.defaults then opts.defaults = {} end
        -- TODO: remove lsp_handlers when dropping support for AstroNvim v4
        if not opts.lsp_handlers then opts.lsp_handlers = {} end
        if vim.tbl_get(noice_opts, "lsp", "hover", "enabled") ~= false then
          opts.defaults.hover = false
          opts.lsp_handlers["textDocument/hover"] = false
        end
        if vim.tbl_get(noice_opts, "lsp", "signature", "enabled") ~= false then
          opts.defaults.signature_help = false
          opts.lsp_handlers["textDocument/signatureHelp"] = false
          if not opts.features then opts.features = {} end
          opts.features.signature_help = false
        end
      end,
    },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { noice = true } },
    },
  },
}
