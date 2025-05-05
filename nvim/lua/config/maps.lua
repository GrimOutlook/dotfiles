vim.g.mapsleader = " "

local function map_call(mode, lhs, rhs, silent)
	vim.keymap.set(mode, lhs, rhs, { silent = silent })
end
local function maps(mode, lhs, rhs)
	map_call(mode, lhs, rhs, true)
end
local function map(mode, lhs, rhs)
	map_call(mode, lhs, rhs, false)
end

-- Save
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>", { silent = true, desc = "Save current buffer" })

-- Disable Arrow Navigation to convince puny brain to use correct keys
maps("n", "<Left>", "<CMD>echo 'Use h'<CR>")
maps("n", "<Right>", "<CMD>echo 'Use l'<CR>")
maps("n", "<Up>", "<CMD>echo 'Use k'<CR>")
maps("n", "<Down>", "<CMD>echo 'Use j'<CR>")
maps("i", "<Left>", "<CMD>echo 'Use h'<CR>")
maps("i", "<Right>", "<CMD>echo 'Use l'<CR>")
maps("i", "<Up>", "<CMD>echo 'Use k'<CR>")
maps("i", "<Down>", "<CMD>echo 'Use j'<CR>")
maps("v", "<Left>", "<CMD>echo 'Use h'<CR>")
maps("v", "<Right>", "<CMD>echo 'Use l'<CR>")
maps("v", "<Up>", "<CMD>echo 'Use k'<CR>")
maps("v", "<Down>", "<CMD>echo 'Use j'<CR>")

-- Resize Windows
maps("n", "<C-Left>", "<C-w><")
maps("n", "<C-Right>", "<C-w>>")
maps("n", "<C-Up>", "<C-w>+")
maps("n", "<C-Down>", "<C-w>-")

-- Rename symbol
maps("n", "<leader>r", vim.lsp.buf.rename)
-- Clear search highlighting
maps("n", "<M-c>", "<CMD>nohlsearch<CR>")

maps("n", "<leader>t", "<CMD>ToggleTerm<CR>")
-- TODO Why tf doesn't this work?
vim.keymap.set("n", "<c-/>", "<CMD>ToggleTerm<CR>")

-- Duplicate the line and comment the line that it was duplicated from.
vim.keymap.set("n", "ycc", "yygccp", { remap = true })
-- Search within visual selection - this is magic
vim.keymap.set("x", "/", "<Esc>/\\%V")

-- Barbar ----------------------------------------------------------------------
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map('n', '<C-p>',   '<Cmd>BufferPick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
