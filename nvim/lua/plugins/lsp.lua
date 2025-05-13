return {
    'neovim/nvim-lspconfig',
    opts = {
        setup = {
            jdtls = function()
                require('java').setup({
                    -- Your custom nvim-java configuration goes here
                    jdtls = {
                        version = "v1.46.1",
                    },
                })
            end,
        },
    },
}
