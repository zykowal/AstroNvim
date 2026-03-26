return {
  "rebelot/heirline.nvim",
  event = "BufEnter",
  opts = function(_, opts)
    local status = require "astroui.status"
    local conditions = require "heirline.conditions"
    local utils = require "heirline.utils"

    local ViMode = {
      -- get vim current mode, this information will be required by the provider
      -- and the highlight functions, so we compute it only once per component
      -- evaluation and store it as a component attribute
      padding = { left = 1, right = 1 },
      init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
      end,
      -- Now we define some dictionaries to map the output of mode() to the
      -- corresponding string and color. We can put these into `static` to compute
      -- them at initialisation time.
      static = {
        mode_names = { -- change the strings if you like it vvvvverbose!
          n = "N",
          no = "N?",
          nov = "N?",
          noV = "N?",
          ["no\22"] = "N?",
          niI = "Ni",
          niR = "Nr",
          niV = "Nv",
          nt = "Nt",
          v = "V",
          vs = "Vs",
          V = "V_",
          Vs = "Vs",
          ["\22"] = "^V",
          ["\22s"] = "^V",
          s = "S",
          S = "S_",
          ["\19"] = "^S",
          i = "I",
          ic = "Ic",
          ix = "Ix",
          R = "R",
          Rc = "Rc",
          Rx = "Rx",
          Rv = "Rv",
          Rvc = "Rv",
          Rvx = "Rv",
          c = "C",
          cv = "Ex",
          r = "...",
          rm = "M",
          ["r?"] = "?",
          ["!"] = "!",
          t = "T",
        },
        mode_colors = {
          n = "red",
          i = "gold",
          v = "cyan",
          V = "cyan",
          ["\22"] = "cyan",
          c = "orange",
          s = "purple",
          S = "purple",
          ["\19"] = "purple",
          R = "orange",
          r = "orange",
          ["!"] = "red",
          t = "red",
        },
      },
      -- We can now access the value of mode() that, by now, would have been
      -- computed by `init()` and use it to index our strings dictionary.
      -- note how `static` fields become just regular attributes once the
      -- component is instantiated.
      -- To be extra meticulous, we can also add some vim statusline syntax to
      -- control the padding and make sure our string is always at least 2
      -- characters long. Plus a nice Icon.
      provider = function(self) return "  %2(" .. self.mode_names[self.mode] .. "%)" end,
      -- Same goes for the highlight. Now the foreground will change according to the current mode.
      hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = self.mode_colors[mode], bold = true }
      end,
      -- Re-evaluate the component only on ModeChanged event!
      -- Also allows the statusline to be re-evaluated when entering operator-pending mode
      update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function() vim.cmd "redrawstatus" end),
      },
    }

    local FileNameBlock = {
      -- let's first set up some attributes needed by this component and its children

      init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
    }
    -- We can now define some children separately and add them later

    local FileName = {
      provider = function(self)
        -- first, trim the pattern relative to the current directory. For other
        -- options, see :h filename-modifers
        local filename = vim.fn.fnamemodify(self.filename, ":t")
        if filename == "" then return "[No Name]" end
        -- now, if the filename would occupy more than 1/4th of the available
        -- space, we trim the file path to its initials
        -- See Flexible Components section below for dynamic truncation
        if not conditions.width_percent_below(#filename, 0.25) then filename = vim.fn.pathshorten(filename) end
        return filename
      end,
    }

    local FileFlags = {
      {
        condition = function() return vim.bo.modified end,
        provider = "[+]",
      },

      {
        condition = function() return not vim.bo.modifiable or vim.bo.readonly end,
        provider = " ",
      },
    }

    -- let's add the children to our FileNameBlock component
    FileNameBlock = utils.insert(FileNameBlock, FileName, FileFlags, { provider = "%< " })

    local FileInfo = {
      provider = function()
        local ft = vim.bo.filetype
        local enc = vim.bo.fileencoding or vim.bo.encoding
        local fmt = vim.bo.fileformat
        return string.format(" %s | %s | %s ", ft, enc, fmt)
      end,
    }

    local FileSize = {
      provider = function()
        -- stackoverflow, compute human readable file size
        local suffix = { "b", "k", "M", "G", "T", "P", "E" }
        local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
        fsize = (fsize < 0 and 0) or fsize
        if fsize < 1024 then return fsize .. suffix[1] end
        local i = math.floor((math.log(fsize) / math.log(1024)))
        return string.format("%.3g%s", fsize / math.pow(1024, i), suffix[i + 1])
      end,
    }

    local Ruler = {
      -- %l = current line number
      -- %L = number of lines in the buffer
      -- %c = column number
      -- %P = percentage through file of displayed window
      -- provider = "%7(%l/%3L%):%2c %P",
      provider = "%10(%3l/%3L:%3c%) %3p%% ",
    }

    local LSPActive = {
      condition = conditions.lsp_attached,
      update = { "LspAttach", "LspDetach" },

      -- You can keep it simple,
      -- provider = " [LSP]",

      -- Or complicate things a bit and get the servers names
      provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_clients { bufnr = 0 }) do
          table.insert(names, server.name)
        end
        return " [" .. table.concat(names, " ") .. "]"
      end,
    }

    local Space = { provider = " " }

    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      ViMode,
      Space,
      Space,
      FileNameBlock,
      Space,
      status.component.git_branch(),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      LSPActive,
      status.component.virtual_env(),
      FileInfo,
      FileSize,
      Space,
      Ruler,
    }

    opts.winbar = nil
    opts.tabline = nil

    opts.statuscolumn = { -- statuscolumn
      init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
      status.component.signcolumn(),
      status.component.numbercolumn(),
    }
  end,
}
