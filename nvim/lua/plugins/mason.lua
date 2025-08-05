local ensure_installed = {
  {
    -- General
    "harper-ls",
    -- Bash
    "shellcheck",
    "shellharden",
    "shfmt",
    -- Lua
    "lua-language-server",
    "stylua",
    -- Rust
    -- NOTE: Rustaceanvim handles everything else.
    "codelldb",
    "cpptools",
    -- Java
    "google-java-format",
    "jdtls",
    "vscode-java-decompiler",
    "vscode-java-dependency",
    -- JSON
    "jq",
    -- Gradle
    "gradle-language-server",
    "groovy-language-server",
    -- Python
    "black",
    "isort",
    -- Javascript
    "prettier",
    "prettierd",
    -- Git
    "gitui",
    "gitleaks",
    "gitlint",
    -- Docker
    "dockerfile-language-server",
    "docker-compose-language-service",
    -- Groovy
    "groovy-language-server",
    "gradle-language-server",
  },
}
local dependencies = {
  {
    "mason-org/mason.nvim",
    version = "^1.0.0",
  },
  "mason-org/mason-registry",
}

return {
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = dependencies,
    opts = {
        ensure_installed = {
            "lua_ls",
            "groovyls",
            "gradle_ls",
        }
    }
  },

  -- {
  --   -- Used to define tools in configs so you don't have to manually install
  --   -- them from the Mason menu.
  --   -- NOTE: mason-lspconfig only works for LSP tools. This works for all tool
  --   -- catgories.
  --   -- NOTE: mason-tool-install.nvim can accept either Mason names, lspconfig
  --   -- names or dap names.
  --   "WhoIsSethDaniel/mason-tool-installer.nvim",
  --   dependencies = dependencies,
  --   opts = {
  --     ensure_installed = ensure_installed,
  --   },
  -- },
}
