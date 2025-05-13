return {
  'nvim-java/nvim-java',
  config = false,
  dependencies = {
    {
      'neovim/nvim-lspconfig',
        config = function()
            require('lspconfig').jdtls.setup({})
        end
      opts = {
        servers = {
          jdtls = {
            -- Your custom jdtls settings goes here
          },
        },
        setup = {
          jdtls = function()
            require('java').setup({
              -- Your custom nvim-java configuration goes here
            })
          end,
        },
      },
    },
  },
}
