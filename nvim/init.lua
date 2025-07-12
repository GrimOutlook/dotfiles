local vim = vim
local Plug = vim.fn['plug#']
vim.g.mapleader = " "

vim.call('plug#begin')

-- Themes
Plug('zaldih/themery.nvim')
Plug("ellisonleao/gruvbox.nvim")

-- Icons
-- Icons for dashboard and fzf-lua
Plug('nvim-tree/nvim-web-devicons')
-- Icons for ranger
Plug 'echasnovski/mini.files'
-- Icons for which-key
Plug 'echasnovski/mini.icons'

-- Dashboard
Plug('nvimdev/dashboard-nvim')

-- Keymaps
Plug("folke/which-key.nvim")

-- File Manager
Plug('kevinhwang91/rnvimr')

-- Etc...
Plug("folke/snacks.nvim")

vim.call('plug#end')

require "user.keymaps"
require "user.autocmds"
require "user.options"

require "plugins.dashboard-nvim"
require "plugins.themery"
require "plugins.which-key"
