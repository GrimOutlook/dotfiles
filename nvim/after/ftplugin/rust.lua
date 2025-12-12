local bufnr = vim.api.nvim_get_current_buf()

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  group = vim.api.nvim_create_augroup("Rust_disable_single_quote", { clear = true }),
  callback = function()
    require("plugins.mini-pairs").unmap("i", "'", "''")
  end,
  desc = "Disable single quote Rust",
})

vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({ "hover", "actions" })
  end,
  { silent = true, buffer = bufnr }
)

-- Navigate to related error
vim.keymap.set("n", "<leader>cl", function()
  vim.cmd.RustLsp("relatedDiagnostics")
end, { silent = true, buffer = bufnr })
