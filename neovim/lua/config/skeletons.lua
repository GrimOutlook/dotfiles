vim.api.nvim_create_autocmd({ "BufNewFile" }, {
	pattern = { "*.bash" },
	desc = "Adds Bash she-bang to new bash file",
	command = "norm i#!/usr/bin/env -S bash -l\nset -euo pipefail\n",
})
