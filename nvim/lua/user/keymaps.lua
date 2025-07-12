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

-- Paste from nvim's system keyboard
-- NOTE: Fixes the problem with alacrity/nvim pasting incorrectly when there
-- are newlines which is only seen on some of my systems
-- NOTE: IT HAS TO DO WITH C-S-v NOT C-V.
map('n', '<C-v>', '"+p')
map('i', '<C-v>', '<ESC>"+pi')

--------------------------------------------------------------------------------
-- Plugin Keymaps --------------------------------------------------------------
--------------------------------------------------------------------------------

-- Themery ---------------------------------------------------------------------
map('n', '<leader>ct', '<CMD>Themery<CR>', { desc = '[themery] Change Themes' })

-- Which-Key -------------------------------------------------------------------
map('n', '<leader>?', function()
        require("which-key").show({ global = false })
    end,
    { desc = '[which-key] Buffer Local Keymaps' }
)

-- Rnvimr ----------------------------------------------------------------------
map( "n", "<leader>on", "<CMD>RnvimrToggle<CR>", { desc = "Open Rnvimr file explorer" } )

-- ToggleTerm ------------------------------------------------------------------
map("n", "<leader>ot", "<CMD>ToggleTerm<CR>", { desc = "Open terminal" })

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<Cmd>ToggleTerm<CR>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- Only apply these mappings to toggleterm
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
