local M = {}

---@param command Command Command to check if available
---@param plugin string Name of the plugin that this command is used for
---
---@class Command
---@field cmd string Shell command to be checked
---@field optional boolean If the command is required for the plugin to perform it's main purpose
---@field provider string Name of the package that provides the command
---@field purpose string What the command is used for
function M.commandIsAvailable(command, plugin)
  if vim.fn.executable(command.cmd) == 1 then
    return
  end

  if command.optional == true then
    vim.notify(
      "Optional command `"
        .. command.cmd
        .. "` for "
        .. plugin
        .. " is not found or not executable.\n"
        .. plugin
        .. " plugin may not function fully.\n\n"
        .. "Purpose of command: "
        .. command.purpose
        .. "\nCommand Provider: "
        .. command.provider,
      vim.log.levels.WARN
    )
  else
    vim.notify(
      "Required command `"
        .. command.cmd
        .. "` for "
        .. plugin
        .. " is not found or not executable.\n"
        .. plugin
        .. " plugin WILL NOT function properly.\n\n"
        .. "Purpose of command: "
        .. command.purpose
        .. "\nCommand Provider: "
        .. command.provider,
      vim.log.levels.ERROR
    )
  end
end

function M.commandsAreAvailable(commands, plugin)
  for _, command in ipairs(commands) do
    M.commandIsAvailable(command, plugin)
  end
end

function M.openSearchAndReplace()
  local snacks = require("snacks")

  snacks.layout.new({
    fullscreen = false,
    minimal = false,
    wins = {
      search = snacks.win({
        show = false,
        enter = false,
        height = 1,
        ft = "regex",
        on_buf = function(win)
          -- HACK: this is needed to prevent Neovim from stopping insert mode,
          -- for any other picker input we are leaving.
          local buf = vim.api.nvim_get_current_buf()
          if buf ~= win.buf and vim.bo[buf].filetype == "snacks_picker_input" then
            vim.bo[buf].buftype = "nofile"
          end
          vim.fn.prompt_setprompt(win.buf, "")
          vim.bo[win.buf].modified = false
          local text = "test"
          vim.api.nvim_buf_set_lines(win.buf, 0, -1, false, { text })
          vim.bo[win.buf].modified = false
        end,
        on_win = function()
          -- require("snacks.core.insert").highlights()
        end,
        bo = {
          filetype = "snacks_picker_input",
          buftype = "prompt",
        },
        wo = {
          -- statuscolumn = require("snacks.core.insert").statuscolumn(),
          cursorline = false,
          winhighlight = Snacks.picker.highlight.winhl("SnacksPickerInput"),
        },
      }),
      replace = snacks.win({
        show = false,
        enter = false,
        height = 1,
        ft = "regex",
        on_buf = function(win)
          -- HACK: this is needed to prevent Neovim from stopping insert mode,
          -- for any other picker input we are leaving.
          local buf = vim.api.nvim_get_current_buf()
          if buf ~= win.buf and vim.bo[buf].filetype == "snacks_picker_input" then
            vim.bo[buf].buftype = "nofile"
          end
          vim.fn.prompt_setprompt(win.buf, "")
          vim.bo[win.buf].modified = false
          local text = "test"
          vim.api.nvim_buf_set_lines(win.buf, 0, -1, false, { text })
          vim.bo[win.buf].modified = false
        end,
        on_win = function()
          -- require("snacks.core.insert").highlights()
        end,
        bo = {
          filetype = "snacks_picker_input",
          buftype = "prompt",
        },
        wo = {
          -- statuscolumn = require("snacks.core.insert").statuscolumn(),
          cursorline = false,
          winhighlight = Snacks.picker.highlight.winhl("SnacksPickerInput"),
        },
      }),
    },
    layout = {
      box = "horizontal",
      width = 0.8,
      min_width = 120,
      height = 0.8,
      {
        box = "vertical",
        border = true,
        title = "{title} {live} {flags}",
        { win = "search", height = 1, border = "bottom" },
        { win = "replace", height = 1, border = "bottom" },
        -- { win = "list", border = "none" },
      },
      -- { win = "preview", title = "{preview}", border = true, width = 0.5 },
    },
  })
end

return M
