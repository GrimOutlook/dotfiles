-- Options are automatically loaded before lazy.nvim start up
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local o = vim.o
local bo = vim.bo --> buffer only use bo
local wo = vim.wo --> window only use wo

o.linebreak = true -- Lines wrap at words rather than random characters
o.showbreak = [[↪ ]] -- Options include -> '…', '↳ ', '→','↪ '
o.colorcolumn = "+1" -- Set the color column to highlight one column after the 'textwidth'
o.textwidth = 80
o.formatoptions = "1qcrn2tjlv"
o.diffopt = "iwhite,internal,filler,hiddenoff,closeoff,indent-heuristic,linematch:60,algorithm:histogram"
