local vim = vim
local Plug = vim.fn['plug#']
vim.g.mapleader = " "

vim.call('plug#begin')

-- Themes
Plug('zaldih/themery.nvim')
Plug("ellisonleao/gruvbox.nvim")

-- Keymaps
Plug("Cassin01/wf.nvim", { ["tag"] = "*" })

vim.call('plug#end')

require "plugins.wf"
require "plugins.themery"

require "user.keymaps"
