local vim = vim
local Plug = vim.fn['plug#']
vim.g.mapleader = " "

vim.call('plug#begin')

-- Themes
Plug("ellisonleao/gruvbox.nvim")

-- Icons
-- Icons for dashboard and fzf-lua
Plug('nvim-tree/nvim-web-devicons')
-- Icons for ranger
Plug 'echasnovski/mini.files'
-- Icons for which-key
Plug 'echasnovski/mini.icons'

-- Dashboard
Plug('goolord/alpha-nvim')

-- Keymaps
Plug("folke/which-key.nvim")

-- File Manager
Plug('kevinhwang91/rnvimr')

-- LSP
Plug("mason-org/mason.nvim")
Plug("mason-org/mason-lspconfig.nvim")
Plug("neovim/nvim-lspconfig")

-- Snippets
Plug('rafamadriz/friendly-snippets')

-- CMP
Plug("saghen/blink.cmp", {["version"] = '1.*'})

Plug('L3MON4D3/LuaSnip', {['tag']= 'v2.*', ['do']= 'make install_jsregexp'} )

-- Terminal
Plug('akinsho/toggleterm.nvim', {['tag'] = '*'})

-- Pickers/Finders
Plug("nvim-telescope/telescope.nvim", { ['tag'] = '0.1.8' } )
-- Dependency for above
Plug("nvim-lua/plenary.nvim")
-- Project Picker
Plug('ahmedkhalf/project.nvim')

-- Task tracking
Plug('Hashino/doing.nvim')

-- Statusline
Plug('nvim-lualine/lualine.nvim')

vim.call('plug#end')

require "user.keymaps"
require "user.autocmds"
require "user.options"

require "plugins.alpha"
require "plugins.blink"
require "plugins.lualine"
require "plugins.mason" -- This must come before mason-lspconfig
require "plugins.mason-lspconfig"
require "plugins.projects"
require "plugins.toggleterm"
require "plugins.which-key"

vim.cmd('colorscheme gruvbox')
