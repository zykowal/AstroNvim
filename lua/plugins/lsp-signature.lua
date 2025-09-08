return {
  "ray-x/lsp_signature.nvim",
  event = "User AstroFile",
  main = "lsp_signature",
  opts = {
    hint_enable = false, -- disable hints as it will crash in some terminal
  },
  specs = {
    { "AstroNvim/astrolsp", optional = true, opts = { features = { signature_help = true } } },
  },
}
