local vim = vim
local Plug = vim.fn['plug#']
vim.g.mapleader = " "

vim.call('plug#begin')

-- Themes
Plug('zaldih/themery.nvim')
Plug("ellisonleao/gruvbox.nvim")

-- Icons
Plug('nvim-tree/nvim-web-devicons')

-- Dashboard
Plug('nvimdev/dashboard-nvim')

-- Keymaps
Plug("Cassin01/wf.nvim", { ["tag"] = "*" })

vim.call('plug#end')

require "user.keymaps"

require "plugins.dashboard-nvim"
require "plugins.themery"

