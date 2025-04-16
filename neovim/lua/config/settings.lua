-- Most of these settings are stolen from here:
-- https://gist.github.com/lalitmee/c379ee6b5163ac3670cfbca9a356b6bb
-- https://dev.to/slydragonn/ultimate-neovim-setup-guide-lazynvim-plugin-manager-23b7
local global = vim.g
local o = vim.opt
local fn = vim.fn

global.mapleader = " "

-- LSP Server to use for Rust.
-- Set to "bacon-ls" to use bacon-ls instead of rust-analyzer.
-- only for diagnostics. The rest of LSP support will still be
-- provided by rust-analyzer.
global.lazyvim_rust_diagnostics = "rust-analyzer"

-- Fixes an error when using neovim-colorizer
o.termguicolors = true

o.linebreak = true -- lines wrap at words rather than random characters
o.number = true
o.relativenumber = true
o.showbreak = [[↪ ]] -- Options include -> '…', '↳ ', '→','↪ '
o.colorcolumn = "+1" -- Set the colour column to highlight one column after the 'textwidth'
o.textwidth = 80
o.formatoptions = "1qcrn2tjlv"

o.tabstop = 8 -- Tab characters will appear 8 character wide.
o.softtabstop = 0 -- Prevent tabs from being anything other than 8 characters
  -- wide
o.shiftwidth = 4 -- Tabs should be 4 spaces wide by default
o.expandtab = true -- When pressing tab, insert spaces up to a shift width wide.
o.smarttab = true -- Pressing tab goes to the next indent, rather than always
  -- being 4 characters wide.

-- Emoji {{{

-- emoji is true by default but makes (n)vim treat all emoji as double width
-- which breaks rendering so we turn this off.
-- CREDIT: https://www.youtube.com/watch?v=F91VWOelFNE
vim.o.emoji = false

-- }}}
--
-- BACKUP AND SWAPS {{{

vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
if fn.isdirectory(vim.o.undodir) == 0 then
  fn.mkdir(vim.o.undodir, 'p')
end
vim.o.undofile = true

-- }}}
--
--
-- Match and search {{{

vim.o.showmatch = true
vim.o.magic = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.wrapscan = true -- Searches wrap around the end of the file
vim.o.scrolloff = 9
vim.o.sidescrolloff = 10
vim.o.sidescroll = 1

-- }}}

