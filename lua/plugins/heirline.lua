return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.winbar = nil
    local conditions = require "heirline.conditions"
    local utils = require "heirline.utils"
    local status = require "astroui.status"
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
          i = "green",
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
    local Nav = {
      -- %l = current line number
      -- %L = number of lines in the buffer
      -- %c = column number
      -- %p = percentage through file of displayed window
      provider = "%8(%l:%c%) %p%% ",
    }

    local FileNameBlock = {
      -- let's first set up some attributes needed by this component and its children

      init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
    }
    -- We can now define some children separately and add them later

    local FileIcon = {
      init = function(self)
        local filename = self.filename

        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
          require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
      end,
      provider = function(self) return self.icon and (self.icon .. " ") end,
      hl = function(self) return { fg = self.icon_color } end,
    }

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
    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then return { fg = "white", bold = true, force = true } end
      end,
    }

    -- let's add the children to our FileNameBlock component
    FileNameBlock = utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName), { provider = "%< " })

    local Spacer = { provider = " " }
    local function rpad(child)
      return {
        condition = child.condition,
        child,
        Spacer,
      }
    end
    local function OverseerTasksForStatus(status)
      return {
        condition = function(self) return self.tasks[status] end,
        provider = function(self) return string.format("%s%d", self.symbols[status], #self.tasks[status]) end,
        hl = function(self)
          return {
            fg = utils.get_highlight(string.format("Overseer%s", status)).fg,
          }
        end,
      }
    end

    local Overseer = {
      condition = function() return package.loaded.overseer end,
      init = function(self)
        local tasks = require("overseer.task_list").list_tasks { unique = true }
        local tasks_by_status = require("overseer.util").tbl_group_by(tasks, "status")
        self.tasks = tasks_by_status
      end,
      static = {
        symbols = {
          ["CANCELED"] = " ",
          ["FAILURE"] = "󰅚 ",
          ["SUCCESS"] = "󰄴 ",
          ["RUNNING"] = "󰑮 ",
        },
      },

      rpad(OverseerTasksForStatus "CANCELED"),
      rpad(OverseerTasksForStatus "RUNNING"),
      rpad(OverseerTasksForStatus "SUCCESS"),
      rpad(OverseerTasksForStatus "FAILURE"),
    }

    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.builder(ViMode),
      status.component.git_branch(),
      status.component.builder(FileNameBlock),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.builder(Overseer),
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.builder(Nav),
    }
  end,
}
