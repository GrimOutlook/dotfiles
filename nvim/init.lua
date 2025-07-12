local vim = vim
local Plug = vim.fn['plug#']
vim.g.mapleader = " "

vim.call('plug#begin')

-- Themes
Plug('zaldih/themery.nvim')
Plug("ellisonleao/gruvbox.nvim")

-- Icons
-- Icons for dashboard
Plug('nvim-tree/nvim-web-devicons')
-- Icons for ranger
Plug 'echasnovski/mini.files'

-- Dashboard
Plug('nvimdev/dashboard-nvim')

-- Keymaps
Plug("Cassin01/wf.nvim", { ["tag"] = "*" })

-- File Manager
Plug('kevinhwang91/rnvimr')

vim.call('plug#end')

require "user.keymaps"

require "plugins.dashboard-nvim"
require "plugins.themery"

