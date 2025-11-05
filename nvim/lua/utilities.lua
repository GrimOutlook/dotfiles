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
return M
