-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
require("config.options")

require("config.lazy")

require("config.keymaps")
require("config.autocmds")
require("config.commands")
