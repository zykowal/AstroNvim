return {
  "Saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-l>"] = { "accept", "fallback" },
    },
    cmdline = {
      keymap = {
        ["<Tab>"] = { "show", "accept" },
        ["<S-Tab>"] = { "show_and_insert", "select_prev" },

        ["<C-N>"] = { "select_next", "show" },
        ["<C-P>"] = { "select_prev", "show" },
        ["<C-J>"] = { "select_next", "fallback" },
        ["<C-K>"] = { "select_prev", "fallback" },

        ["<C-Y>"] = { "select_and_accept" },
        ["<C-E>"] = { "cancel" },
      },
      completion = { menu = { auto_show = true } },
    },
    completion = {
      menu = {
        border = "none",
        scrollbar = false,
        draw = {
          columns = { { "label", gap = 1 }, { "label_description", gap = 1 }, { "kind", gap = 1 } },
        },
      },
      documentation = {
        window = {
          border = "rounded",
          scrollbar = false,
        },
      },
    },
    signature = {
      window = {
        border = "none",
      },
    },
  },
}
