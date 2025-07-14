-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
require("config.options")

require("config.lazy")

require("config.keymaps")
require("config.autocmds")

-- -- LSP
-- Plug("mason-org/mason.nvim")
-- Plug("mason-org/mason-lspconfig.nvim")
-- Plug("neovim/nvim-lspconfig")
-- Plug("mrcjkb/rustaceanvim")
--
-- -- Snippets
-- Plug("rafamadriz/friendly-snippets")
-- Plug("L3MON4D3/LuaSnip", { ["tag"] = "v2.*", ["do"] = "make install_jsregexp" })
--
-- -- CMP
-- Plug("saghen/blink.cmp", { ["version"] = "1.*" })
--
-- -- Terminal
-- Plug()
--
-- -- Dependency for above
-- Plug("nvim-lua/plenary.nvim")
-- -- Project Picker
-- Plug("ahmedkhalf/project.nvim")
--
-- -- Task tracking
-- Plug()
--
-- -- Statusline
-- Plug("nvim-lualine/lualine.nvim")
--
-- -- Debugging
-- Plug("mfussenegger/nvim-dap")
-- Plug("rcarriga/nvim-dap-ui")
-- Plug("theHamsta/nvim-dap-virtual-text")
-- -- Lua adapter
-- Plug("jbyuki/one-small-step-for-vimkind")
