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

-- LSP
Plug("mason-org/mason.nvim")
Plug("mason-org/mason-lspconfig.nvim")
Plug("neovim/nvim-lspconfig")

-- Terminal
Plug('akinsho/toggleterm.nvim', {['tag'] = '*'})

-- Pickers/Finders
Plug("nvim-telescope/telescope.nvim", { ['tag'] = '0.1.8' } )
-- Dependency for above
Plug("nvim-lua/plenary.nvim")

vim.call('plug#end')

require "user.keymaps"
require "user.autocmds"
require "user.options"

require "plugins.dashboard-nvim"
require "plugins.mason" -- This must come before mason-lspconfig
require "plugins.mason-lspconfig"
require "plugins.themery"
require "plugins.toggleterm"
require "plugins.which-key"

