return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				-- "astgrep",
				-- "codelldb",
				-- "codespell",
				-- "cspell",
				"cssls",
				-- "dotenv-linter",
				"eslint",
				-- "google-java-format",
				"html",
				"jsonls",
				-- "markdownlint",
				-- "mdformat",
				-- "misspell",
				-- "prettierd",
				"pyright",
				-- "rust-analyzer",
				-- "shellcheck",
				-- "shellharden",
				"tailwindcss",
				-- "tex-fmt",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
			},
		})
	end,
}
