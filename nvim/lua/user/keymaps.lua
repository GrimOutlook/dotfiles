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

-- Snacks Terminal -------------------------------------------------------------
map("n", "<leader>ot", function()
    require("snacks").terminal.toggle(nil, { win = {position = "float"}})
end, { desc = "Open terminal" })
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<C-Q>', [[<CMD>lua Snacks.terminal.toggle()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<CMD>lua Snacks.terminal.toggle()<CR><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<CMD>lua Snacks.terminal.toggle()<CR><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<CMD>lua Snacks.terminal.toggle()<CR><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<CMD>lua Snacks.terminal.toggle()<CR><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
