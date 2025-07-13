local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- General Keymaps -------------------------------------------------------------
-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Navigate tabs with Ctrl + , and Ctrl + .
map("n", "<C-,>", "<CMD>tabprevious<CR>")
map("n", "<C-.>", "<CMD>tabnext<CR>")

-- Reload configuration without restart nvim
map("n", "<leader><space>r", ":so %<CR>", { desc = "Reload NeoVim Config" })

-- Fast saving with <leader> and w
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
-- Fast saving all files with <leader> and W
map("n", "<leader>W", ":wa<CR>", { desc = "Save All" })

-- Close current buffer
map("n", "<leader>q", ":bd<CR>", { desc = "Close Buffer" })

-- Close all windows and exit from Neovim with <leader> and q
map("n", "<leader>Q", ":qa<CR>", { desc = "Quit Nvim" })

-- Make normal j and k presses work with wrapped words
map("n", "j", "gj")
map("n", "k", "gk")

-- Paste from nvim's system keyboard
-- NOTE: Fixes the problem with alacrity/nvim pasting incorrectly when there
-- are newlines which is only seen on some of my systems
-- NOTE: IT HAS TO DO WITH C-S-v NOT C-V.
map("n", "<C-v>", '"+p')
map("i", "<C-v>", '<ESC>"+pi')

map("n", "<esc>", "<CMD>nohlsearch<CR>")

--------------------------------------------------------------------------------
-- Plugin Keymaps --------------------------------------------------------------
--------------------------------------------------------------------------------

-- Which-Key -------------------------------------------------------------------
map("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "[which-key] Buffer Local Keymaps" })

-- Rnvimr ----------------------------------------------------------------------
map("n", "<leader>e", "<CMD>RnvimrToggle<CR>", { desc = "Open Rnvimr file explorer" })

-- ToggleTerm ------------------------------------------------------------------
map("n", "<leader>c", "<CMD>ToggleTerm<CR>", { desc = "Open terminal" })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  map("t", "<esc>", [[<Cmd>ToggleTerm<CR>]], opts)
  map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end
-- Only apply these mappings to toggleterm
vim.cmd("autocmd! TermOpen term://*toggleterm*# lua set_terminal_keymaps()")

-- Telescope Pickers -----------------------------------------------------------
-- local builtin = require("telescope.builtin")
-- -- General
-- map("n", "<leader>f", builtin.find_files, { desc = "[telescope] Files" })
-- map("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "[telescope] Grep In Buffer" })
-- map({ "n", "v" }, "<leader>`", builtin.grep_string, { desc = "[telescope] Grep String" })
-- map("n", "<leader>r", function()
--   builtin.oldfiles({ cwd_only = true })
-- end, { desc = "[telescope] Recent Files (CWD)" })
-- map("n", "<leader>m", builtin.marks, { desc = "[telescope] Marks" })
-- map("n", '<leader>"', builtin.registers, { desc = "[telescope] Registers" })
-- map("n", "<leader><space>ti", builtin.git_files, { desc = "[telescope] Git Files" })
-- map("n", "<leader><space>tG", builtin.live_grep, { desc = "[telescope] Grep (CWD)" })
-- map("n", "<leader><space>tb", builtin.buffers, { desc = "[telescope] Buffers" })
-- map("n", "<leader><space>tR", builtin.oldfiles, { desc = "[telescope] Recent Files (Global)" })
-- map("n", "<leader><space>tj", builtin.jumplist, { desc = "[telescope] Jumplist" })
-- map("n", "<leader><space>tl", builtin.loclist, { desc = "[telescope] Location List" })
-- map("n", "<leader><space>tp", builtin.pickers, { desc = "[telescope] Pickers" })
-- -- General Extended
-- map("n", "<leader><space>tT", builtin.colorscheme, { desc = "[telescope] Themes" })
-- map("n", "<leader><space>tM", builtin.man_pages, { desc = "[telescope] Man Pages" })
-- map("n", "<leader><space>tK", builtin.keymaps, { desc = "[telescope] Keymaps" })
-- map("n", "<leader><space>tc", builtin.commands, { desc = "[telescope] Commands" })
-- map("n", "<leader><space>tA", builtin.autocommands, { desc = "[telescope] Autocommands" })
-- map("n", "<leader><space>tO", builtin.vim_options, { desc = "[telescope] Vim Options" })
-- map("n", "<leader><space>tH", builtin.help_tags, { desc = "[telescope] Help" })
-- map("n", "<leader><space>tC", builtin.command_history, { desc = "[telescope] Command History" })
-- map("n", "<leader><space>tS", builtin.search_history, { desc = "[telescope] Search History" })
-- -- Issues
-- map("n", "<leader>a", builtin.quickfix, { desc = "[telescope] Quickfix" })
-- map("n", "<leader><space>tQ", builtin.quickfixhistory, { desc = "[telescope] Quickfix History" })
-- map("n", "<leader>x", builtin.diagnostics, { desc = "[telescope] Diagnostics" })
-- -- Git Pickers
-- map("n", "<leader><space>gc", builtin.git_bcommits, { desc = "[telescope] Git Commits (Buffer)" })
-- map("n", "<leader><space>gC", builtin.git_commits, { desc = "[telescope] Git Commits (All)" })
-- map("n", "<leader><space>gb", builtin.git_branches, { desc = "[telescope] Git Branches" })
-- map("n", "<leader><space>gS", builtin.git_status, { desc = "[telescope] Git Status" })
-- -- LSP
-- map("n", "<leader>gt", builtin.treesitter, { desc = "[telescope] Symbols" })
-- map("n", "<leader>gr", builtin.lsp_references, { desc = "[telescope] Goto Reference" })
-- map("n", "<leader>gi", builtin.lsp_implementations, { desc = "[telescope] Goto Implementations" })
-- map("n", "<leader>gd", builtin.lsp_definitions, { desc = "[telescope] Goto Definition" })
-- map("n", "<leader>gt", builtin.lsp_type_definitions, { desc = "[telescope] Goto Type Definition" })
-- map("n", "<leader>gw", builtin.lsp_document_symbols, { desc = "[telescope] LSP Document Symbols" })
-- map("n", "<leader>gW", builtin.lsp_workspace_symbols, { desc = "[telescope] LSP Workspace Symbols" })

-- Debuggers
vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { noremap = true })
vim.keymap.set("n", "<leader>dc", require("dap").continue, { noremap = true })
vim.keymap.set("n", "<leader>do", require("dap").step_over, { noremap = true })
vim.keymap.set("n", "<leader>di", require("dap").step_into, { noremap = true })

vim.keymap.set("n", "<leader>dl", function()
  require("osv").launch({ port = 8086 })
end, { noremap = true })

vim.keymap.set("n", "<leader>dw", function()
  local widgets = require("dap.ui.widgets")
  widgets.hover()
end)

vim.keymap.set("n", "<leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)
