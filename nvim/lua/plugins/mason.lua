local ensure_installed = {
    "ast_grep",
    "basedpyright",
    "bashls",
    "buf_ls",
    "clangd",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "eslint",
    "harper_ls",
    "html",
    "hyprls",
    "jsonls",
    "kotlin_language_server",
    "lemminx",
    "lua_ls",
    "markdown_oxide",
    "neocmake",
    "nginx_language_server",
    "nil_ls",
    "powershell_es",
    "rust_analyzer",
    "sqls",
    "tailwindcss",
    "taplo",
    "typos_lsp",
    "yamlls",
}
return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = ensure_installed,
            })

            require("mason-tool-installer").setup({
                ensure_installed = ensure_installed,
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            local nvim_lsp = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            local protocol = require("vim.lsp.protocol")

            local on_attach = function(client, bufnr)
                -- format on save
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("Format", { clear = true }),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end
            ---
            -- LSP servers
            ---
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local default_handler = function(server)
                -- See :help lspconfig-setup
                nvim_lsp[server].setup({
                    capabilities = capabilities,
                })
            end

            mason_lspconfig.setup_handlers({
                default_handler,
                ["lua_ls"] = function()
                    nvim_lsp["lua_ls"].setup({
                        settings = {
                            completions = {
                                completeFunctionCalls = true,
                            },
                        },
                    })
                end,
            })

            vim.keymap.set("n", "<S-f>", vim.diagnostic.open_float)
            vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, { desc = "Goto prev diagnostic" })
            vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count= 1, float=true}) end, { desc = "Goto next diagnostic" })
            vim.keymap.set("n", "<C-a>", function() vim.diagnostic.jump({count= 1, float=true}) end, { desc = "Goto next diagnostic" })
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
            vim.keymap.set(
                "n",
                "<C-n>",
                function()
                    if vim.diagnostic.jump({count=1, float=true}) then
                        vim.lsp.buf.code_action()
                    end
                end,
                { desc = "Show next diagnostic and fix?" }
            )
            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<space>a", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<C-M-f>", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })
        end,
    },
}
