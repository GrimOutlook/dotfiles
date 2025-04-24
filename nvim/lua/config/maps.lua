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

-- Quit
maps("n", "<leader>q", "<CMD>q<CR>")

-- Tab Navigation
vim.keymap.set("n", "<M-S-H>", "<CMD>tabprevious<CR>", { noremap = true })
vim.keymap.set("n", "<M-S-L>", "<CMD>tabnext<CR>", { noremap = true })

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
-- Clear search hightlighting
-- TODO: Why isn't this working?
maps("n", "M-S-/", "<CMD>nohlsearch<CR>")

maps("n", "<leader>t", "<CMD>ToggleTerm<CR>")
-- TODO Why tf doesn't this work?
vim.keymap.set("n", "<c-/>", "<CMD>ToggleTerm<CR>")

-- Duplicate the line and comment the line that it was duplicated from.
vim.keymap.set("n", "ycc", "yygccp", { remap = true })
-- Search within visual selection - this is magic
vim.keymap.set("x", "/", "<Esc>/\\%V")

-- Snacks
maps("n", "<leader>j", function()
	Snacks.picker.jumps()
end)
