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
maps("n", "<leader>w", "<CMD>update<CR>")

-- Quit
maps("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
maps("i", "jk", "<ESC>")

-- Window Navigation
maps("n", "<C-h>", "<C-w>h")
maps("n", "<C-l>", "<C-w>l")
maps("n", "<C-k>", "<C-w>k")
maps("n", "<C-j>", "<C-w>j")

-- Tab Navigation
maps("n", "<C-H>", "<CMD>tabprevious<CR>")
maps("n", "<C-L>", "<CMD>tabnext<CR>")

-- Resize Windows
maps("n", "<C-Left>", "<C-w><")
maps("n", "<C-Right>", "<C-w>>")
maps("n", "<C-Up>", "<C-w>+")
maps("n", "<C-Down>", "<C-w>-")

-- Rename symbol
maps("n", "<leader>r", vim.lsp.buf.rename)

-- Snacks
maps("n", "<leader>j", function()
	Snacks.picker.jumps()
end)
