return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>e"] = { function() require("oil").open() end, desc = "Open folder in Oil" },
            ["<Leader>o"] = { function() require("oil").open(vim.fn.getcwd()) end, desc = "Open folder(cwd) in Oil" },
          },
        },
        autocmds = {
          oil_settings = {
            {
              event = "FileType",
              desc = "Disable view saving for oil buffers",
              pattern = "oil",
              callback = function(args) vim.b[args.buf].view_activated = false end,
            },
            {
              event = "User",
              pattern = "OilActionsPost",
              desc = "Close buffers when files are deleted in Oil",
              callback = function(args)
                if args.data.err then return end
                for _, action in ipairs(args.data.actions) do
                  if action.type == "delete" then
                    local _, path = require("oil.util").parse_url(action.url)
                    local bufnr = vim.fn.bufnr(path)
                    if bufnr ~= -1 then require("astrocore.buffer").wipe(bufnr, true) end
                  end
                end
              end,
            },
          },
        },
      },
    },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<C-r>"] = "actions.refresh",
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["<C-v>"] = { "actions.select", opts = { vertical = true } },
      ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["q"] = { "actions.close", mode = "n" },
      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["="] = { "actions.select", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    use_default_keymaps = false,
  },
}
