local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
autocmd("VimEnter", {
    callback = function()
        require("dashboard").setup({})
    end
})
