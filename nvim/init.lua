local vim = vim
local Plug = vim.fn['plug#']
vim.g.mapleader = " "

vim.call('plug#begin')

Plug("Cassin01/wf.nvim", { ["tag"] = "*" })

vim.call('plug#end')

require "plugins.wf"

