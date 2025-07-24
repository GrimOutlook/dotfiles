local bufnr = vim.api.nvim_get_current_buf()
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
