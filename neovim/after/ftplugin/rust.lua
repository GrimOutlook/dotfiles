local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
vim.keymap.set(
	"n",
	"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
	function()
		vim.cmd.RustLsp({ "hover", "actions" })
	end,
	{ silent = true, buffer = bufnr }
)
vim.keymap.set("n", "E", function()
	vim.cmd.RustLsp({ "explainError", "current" })
end, { silent = true, buffer = bufnr })
vim.keymap.set("n", "M-E", function()
	vim.cmd.RustLsp({ "explainError", "cycle" })
end, { silent = true, buffer = bufnr })
vim.keymap.set("n", "D", function()
	vim.cmd.RustLsp({ "renderDiagnostic", "current" })
end, { silent = true, buffer = bufnr })
vim.keymap.set("n", "M-D", function()
	vim.cmd.RustLsp({ "renderDiagnostic", "cycle" })
end, { silent = true, buffer = bufnr })
vim.keymap.set("n", "M", function()
	vim.cmd.RustLsp("expandMacro")
end, { silent = true, buffer = bufnr })

vim.o.textwidth = 80
vim.o.formatoptions = "1qcrn2tjlv"
