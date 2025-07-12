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

-- Navigate tabs with Ctrl + , and Ctrl + .
map('n', '<C-,>', 'tabprev')
map('n', '<C-.>', 'tabnext')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>', {desc = "Reload NeoVim Config"})

-- Fast saving with <leader> and space
map('n', '<leader><SPACE>', ':w<CR>', {desc = "Save"})

-- Close current buffer
map('n', '<leader>q', ':bd<CR>', {desc = "Quit"})

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>Q', ':qa<CR>', {desc = "Quit"})

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
  map('t', '<esc>', [[<Cmd>ToggleTerm<CR>]], opts)
  map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
-- Only apply these mappings to toggleterm
vim.cmd('autocmd! TermOpen term://*toggleterm*# lua set_terminal_keymaps()')

-- Telescope Pickers -----------------------------------------------------------
local builtin = require("telescope.builtin")
-- General
map("n", "<leader>tf", builtin.find_files, { desc = "[telescope] Files" })
map("n", "<leader>ti", builtin.git_files, { desc = "[telescope] Git Files" })
map("n", "<leader>tg", builtin.current_buffer_fuzzy_find, { desc = "[telescope] Grep In Buffer" })
map("n", "<leader>tG", builtin.live_grep, { desc = "[telescope] Grep (CWD)" })
map("n", "<leader>tb", builtin.buffers, { desc = "[telescope] Buffers" })
map("n", "<leader>tR", builtin.oldfiles, { desc = "[telescope] Recent Files (Global)" })
map("n", "<leader>tr", function() builtin.oldfiles({cwd_only = true}) end, { desc = "[telescope] Recent Files (CWD)" })
map("n", "<leader>tm", builtin.marks, { desc = "[telescope] Marks" })
map("n", "<leader>tp", builtin.registers, { desc = "[telescope] Registers" })
map("n", "<leader>tj", builtin.registers, { desc = "[telescope] Jumplist" })
map("n", "<leader>tl", builtin.registers, { desc = "[telescope] Location List" })
map("n", "<leader>tp", builtin.registers, { desc = "[telescope] Pickers" })
-- General Extended
map("n", "<leader>tT", builtin.colorscheme, { desc = "[telescope] Themes" })
map("n", "<leader>tM", builtin.man_pages, { desc = "[telescope] Man Pages" })
map("n", "<leader>tK", builtin.keymaps, { desc = "[telescope] Keymaps" })
map("n", "<leader>tc", builtin.commands, { desc = "[telescope] Commands" })
map("n", "<leader>tA", builtin.autocommands, { desc = "[telescope] Autocommands" })
map("n", "<leader>tO", builtin.vim_options, { desc = "[telescope] Vim Options" })
map("n", "<leader>tH", builtin.help_tags, { desc = "[telescope] Help" })
map("n", "<leader>tC", builtin.command_history, { desc = "[telescope] Command History" })
map("n", "<leader>t/", builtin.grep_string, { desc = "[telescope] Grep String" })
map("n", "<leader>tS", builtin.search_history, { desc = "[telescope] Search History" })
-- Issues
map("n", "<leader>tq", builtin.quickfix, { desc = "[telescope] Quickfix" })
map("n", "<leader>tQ", builtin.quickfixhistory, { desc = "[telescope] Quickfix History" })
map("n", "<leader>tx", builtin.diagnostics, { desc = "[telescope] Diagnostics" })
-- Git Pickers
map("n", "<leader>gc", builtin.git_bcommits, { desc = "[telescope] Git Commits (Buffer)" })
map("n", "<leader>gC", builtin.git_commits, { desc = "[telescope] Git Commits (All)" })
map("n", "<leader>gb", builtin.git_branches, { desc = "[telescope] Git Branches" })
map("n", "<leader>gS", builtin.git_status, { desc = "[telescope] Git Status" })
-- LSP
map("n", "<leader>gt", builtin.treesitter, { desc = "[telescope] Symbols" })
map("n", "<leader>gr", builtin.lsp_references, { desc = "[telescope] Goto Reference" })
map("n", "<leader>gi", builtin.lsp_implementations, { desc = "[telescope] Goto Implementations" })
map("n", "<leader>gd", builtin.lsp_definitions, { desc = "[telescope] Goto Definition" })
map("n", "<leader>gt", builtin.lsp_type_definitions, { desc = "[telescope] Goto Type Definition" })
map("n", "<leader>gw", builtin.lsp_document_symbols, { desc = "[telescope] LSP Document Symbols" })
map("n", "<leader>gW", builtin.lsp_workspace_symbols, { desc = "[telescope] LSP Workspace Symbols" })

