return {
    "stevearc/conform.nvim",
    dependencies = { "mason-org/mason.nvim" },
    lazy = false,
    keys = {
        {
            "<leader>Tf",
            function()
                -- If autoformat is currently disabled for this buffer,
                -- then enable it, otherwise disable it
                if vim.b.disable_autoformat then
                    vim.cmd("FormatEnable")
                    vim.notify("Enabled autoformat for current buffer")
                else
                    vim.cmd("FormatDisable!")
                    vim.notify("Disabled autoformat for current buffer")
                end
            end,
            desc = "Toggle autoformat for current buffer",
        },
        {
            "<leader>TF",
            function()
                -- If autoformat is currently disabled globally,
                -- then enable it globally, otherwise disable it globally
                if vim.g.disable_autoformat then
                    vim.cmd("FormatEnable")
                    vim.notify("Enabled autoformat globally")
                else
                    vim.cmd("FormatDisable")
                    vim.notify("Disabled autoformat globally")
                end
            end,
            desc = "Toggle autoformat globally",
        },
    },

    ---@type conform.setupOpts
    opts = {
        log_level = vim.log.levels.DEBUG,
        format_on_save = function(bufnr)
            vim.api.nvim_create_user_command("FormatDisable", function(args)
                if args.bang then
                    -- FormatDisable! will disable formatting just for this buffer
                    vim.b.disable_autoformat = true
                else
                    vim.g.disable_autoformat = true
                end
            end, {
                desc = "Disable autoformat-on-save",
                bang = true,
            })
            vim.api.nvim_create_user_command("FormatEnable", function()
                vim.b.disable_autoformat = false
                vim.g.disable_autoformat = false
            end, {
                desc = "Re-enable autoformat-on-save",
            })

            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 500, lsp_format = "fallback" }
        end,

        default_format_opts = {
            timeout_ms = 3000,
            async = false,           -- not recommended to change
            quiet = false,           -- not recommended to change
            lsp_format = "fallback", -- not recommended to change
        },

        formatters_by_ft = {
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            java = { "google-java-format" },
            groovy = { lsp_format = "prefer" },
            gradle = { lsp_format = "prefer" },
            lua = { "stylua" },
            python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            sh = { "shfmt", lsp_format = "fallback" },
        },
        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
        formatters = {
            injected = { options = { ignore_errors = true } },
            -- # Example of using dprint only when a dprint.json file is present
            -- dprint = {
            --   condition = function(ctx)
            --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
            --   end,
            -- },
            --
            -- # Example of using shfmt with extra args
            -- shfmt = {
            --   prepend_args = { "-i", "2", "-ci" },
            -- },
            -- -- TODO: Maybe fiddle with this later. Being a POS currently.
            -- ["npm-groovy-lint"] = {
            --   prepend_args = {
            --     "--config",
            --     vim.fn.expand("$HOME") .. "/.dotfiles/misc/groovylintrc.json",
            --     "--failon",
            --     "none",
            --     "--nolintafter",
            --     "--javaexecutable",
            --     "/usr/lib/jvm/java-17-openjdk/bin/java",
            --   },
            --   args = { "--format", "$FILENAME" },
            -- },
        },
    },
}
