return {
  "AstroNvim/astrocore",
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = false, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        smoothscroll = true, -- sets vim.opt.smoothscroll
        expandtab = true, -- sets vim.opt.expandtab
        ignorecase = true, -- sets vim.opt.ignorecase
        smartcase = true, -- sets vim.opt.smartcase
        incsearch = true, -- sets vim.opt.incsearch
        termguicolors = true, -- sets vim.opt.termguicolors
        background = "dark", -- sets vim.opt.background
        spelllang = "en", -- sets vim.opt.spelllang
        laststatus = 3, -- sets vim.opt.laststatus
        autoindent = true,
        smartindent = true,
        swapfile = false,
        backup = false,
        undofile = true,
        scrolloff = 8,
        sidescrolloff = 8,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        L = { "$" },
        H = { "^" },
      },
      v = {
        L = { "$" },
        H = { "^" },
      },
    },
  },
}
