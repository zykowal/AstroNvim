return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
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
    filetypes = {},
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        guicursor = "a:block", -- sets vim.opt.guicursor
        tabclose = "uselast", -- go to last used tab when closing the current tab
        backspace = vim.list_extend(vim.opt.backspace:get(), { "nostop" }), -- don't stop backspace at insert
        breakindent = true, -- wrap indent to match  line start
        clipboard = "unnamedplus", -- connection to the system clipboard
        cmdheight = 0, -- hide command line unless needed
        completeopt = { "menu", "menuone", "noselect" }, -- Options for insert mode completion
        confirm = true, -- raise a dialog asking if you wish to save the current file(s)
        copyindent = true, -- copy the previous indentation on autoindenting
        cursorline = false, -- highlight the text line of the cursor
        diffopt = vim.list_extend(vim.opt.diffopt:get(), { "algorithm:histogram", "linematch:60" }), -- enable linematch diff algorithm
        expandtab = true, -- enable the use of space in tab
        fillchars = { eob = " " }, -- disable `~` on nonexistent lines
        ignorecase = true, -- case insensitive searching
        infercase = true, -- infer cases in keyword completion
        jumpoptions = {}, -- apply no jumpoptions on startup
        laststatus = 3, -- global statusline
        linebreak = true, -- wrap lines at 'breakat'
        preserveindent = true, -- preserve indent structure as much as possible
        pumheight = 10, -- height of the pop up menu
        shiftround = true, -- round indentation with `>`/`<` to shiftwidth
        shiftwidth = 0, -- number of space inserted for indentation; when zero the 'tabstop' value will be used
        showmode = false, -- disable showing modes in command line
        smartcase = true, -- case sensitive searching
        smarttab = true,
        smartindent = true,
        splitbelow = true, -- splitting a new window below the current one
        splitright = true, -- splitting a new window at the right of the current one
        tabstop = 2, -- number of space in a tab
        termguicolors = true, -- enable 24-bit RGB color in the TUI
        title = true, -- set terminal title to the filename and path
        undofile = true, -- enable persistent undo
        updatetime = 250, -- length of time to wait before triggering the plugin
        virtualedit = "block", -- allow going past end of line in visual block mode
        writebackup = false, -- disable making a backup before overwriting a file
        inccommand = "split",
        scrolloff = 999,
        sidescrolloff = 8,
        grepprg = "rg --vimgrep",
        lazyredraw = false,
        errorbells = false, -- Disable error sounds
        autochdir = false, -- Don't change directory automatically
        swapfile = false,
        backup = false,
        background = "dark",
        foldenable = true,
        foldlevel = 99,
        foldlevelstart = 99,
        winborder = "rounded",
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
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
