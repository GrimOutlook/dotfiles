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

-- Exit insert mode
maps("i", "jk", "<ESC>")

-- Window Navigation
vim.keymap.set("n", "<M-h>", "<CMD>wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<M-j>", "<CMD>wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<M-h>", "<CMD>wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<M-l>", "<CMD>wincmd l<CR>", { noremap = true })

-- Tab Navigation
vim.keymap.set("n", "<M-C-H>", "<CMD>tabprevious<CR>", { noremap = true })
vim.keymap.set("n", "<M-C-L>", "<CMD>tabnext<CR>", { noremap = true })

-- Resize Windows
maps("n", "<C-Left>", "<C-w><")
maps("n", "<C-Right>", "<C-w>>")
maps("n", "<C-Up>", "<C-w>+")
maps("n", "<C-Down>", "<C-w>-")

-- Rename symbol
maps("n", "<leader>r", vim.lsp.buf.rename)

maps("n", "<leader>t", "<CMD>ToggleTerm<CR>")
-- TODO Why tf doesn't this work?
vim.keymap.set("n", "<c-/>", "<CMD>ToggleTerm<CR>")

-- Snacks
maps("n", "<leader>j", function()
	Snacks.picker.jumps()
end)
