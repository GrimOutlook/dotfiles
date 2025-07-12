local function map(mode, lhs, rhs, opts)
    local options = { noremap=true, silent=true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- General Keymaps -------------------------------------------------------------
-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>', {desc = "Reload NeoVim Config"})

-- Fast saving with <leader> and space
map('n', '<leader><SPACE>', ':w<CR>', {desc = "Save"})

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa<CR>', {desc = "Quit"})

-- Navigate tabs using `,` and `.`
map('n', '<C-,>', '<CMD>tabprevious<CR>')
map('n', '<C-.>', '<CMD>tabnext<CR>')

-- Make normal j and k presses work with wrapped words
map('n', 'j', 'gj')
map('n', 'k', 'gk')


--------------------------------------------------------------------------------
-- Plugin Keymaps --------------------------------------------------------------
--------------------------------------------------------------------------------

-- Themery ---------------------------------------------------------------------
map('n', '<leader>ct', '<CMD>Themery<CR>', { desc = '[themery] Change Themes' })

-- wf (Which-key alternative) --------------------------------------------------
local which_key = require("wf.builtin.which_key")
--
-- Rnvimr ----------------------------------------------------------------------
map( "n", "<leader>on", "<CMD>RnvimrToggle<CR>", { desc = "Open Rnvimr file explorer" } )
--
-- Register
map( "n", "<leader>wr", function()
	local register = require("wf.builtin.register")
    register()
end, {  desc = "[wf.nvim] register" })

-- Bookmark
map( "n", "<leader>wbo", function()
local bookmark = require("wf.builtin.bookmark")
	bookmark({ nvim = "~/.config/nvim", })
end, {  desc = "[wf.nvim] bookmark" })

-- Buffer
map( "n", "<leader>wbu", function()
local buffer = require("wf.builtin.buffer")
	buffer()
end, {desc = "[wf.nvim] buffer"})

-- Mark
map( "n", "'", function()
local mark = require("wf.builtin.mark")
	mark()
end, { nowait = true, desc = "[wf.nvim] mark"})

-- Which Key
map( "n", "<space>",  
	which_key({text_insert_in_advance = " "})
, { desc = "[wf.nvim] which-key /", })

