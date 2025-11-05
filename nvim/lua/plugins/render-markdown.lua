local util = require("utilities")
local plugin = "MeanderingProgrammer/render-markdown.nvim"

-- NOTE: Required commands, treesitter parsers, and dependencies found [here](https://github.com/MeanderingProgrammer/render-markdown.nvim?tab=readme-ov-file#requirements)
local required_commands = {
  {
    cmd = "utftex",
    provider = "libtexprintf",
    optional = true,
    purpose = "Used to transform latex strings to appropriate unicode",
  },
  {
    cmd = "latex2text",
    provider = "pylatexenc",
    optional = true,
    purpose = "Used to transform latex strings to appropriate unicode",
  },
}

return {
  plugin,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "markdown", "markdown-inline", "html", "latex", "yaml" } },
    },
  },
  opts = function()
    util.commandsAreAvailable(required_commands, plugin)
  end,
}
