return {
        "mason-org/mason.nvim",
        version = "1.11.0",
        config = function(_, opts)
		local conf = vim.tbl_deep_extend('keep', opts, {
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗',
				},
			},
		})
		-- ^^^^^ Here we are basically merge you configuration with OPTS
		-- OPTS contains configurations defined elsewhere like nvim-java

		require('mason').setup(conf)
	end,
}
