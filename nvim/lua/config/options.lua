local g = vim.g
local o = vim.opt

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = " "
g.maplocalleader = "\\"
o.clipboard = "unnamedplus" -- Copy/paste to system clipboard
o.swapfile = false -- Don't use swapfile
o.completeopt = "menuone,noinsert,noselect" -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
o.number = true -- Show line number
o.showmatch = true -- Highlight matching parenthesis
o.foldmethod = "marker" -- Enable folding (default 'foldmarker')
o.colorcolumn = "80" -- Line lenght marker at 80 columns
o.splitright = true -- Vertical split to the right
o.splitbelow = true -- Horizontal split to the bottom
o.ignorecase = true -- Ignore case letters when search
o.smartcase = true -- Ignore lowercase for the whole pattern
o.linebreak = true -- Wrap on word boundary
o.termguicolors = true -- Enable 24-bit RGB colors
o.laststatus = 3 -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
o.expandtab = true -- Use spaces instead of tabs
o.shiftwidth = 4 -- Shift 4 spaces when tab
o.tabstop = 8 -- 1 tab == 4 spaces
o.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
o.hidden = true -- Enable background buffers
o.history = 100 -- Remember N lines in history
o.synmaxcol = 240 -- Max column for syntax highlight
o.updatetime = 250 -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
o.shortmess:append("sI")

-- Disable builtin plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
