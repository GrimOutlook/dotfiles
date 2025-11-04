local ensure_installed = {
  -- General
  --"harper-ls",
  "codebook",
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
  -- Groovy/Gradle
  "groovyls",
  "gradle_ls",
  -- Typescript
  "eslint-lsp",
  "tsgo",
  -- Systemd
  "systemd-language-server",
}
local dependencies = {
  {
    "mason-org/mason.nvim",
    version = "^1.0.0",
  },
  "mason-org/mason-registry",
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^1.0.0",
  },
}

return {
  -- Used to define tools in configs so you don't have to manually install
  -- them from the Mason menu.
  -- NOTE: mason-lspconfig only works for LSP tools. This works for all tool
  -- catgories.
  -- NOTE: mason-tool-install.nvim can accept either Mason names, lspconfig
  -- names or dap names.
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = dependencies,
  opts = {
    ensure_installed = ensure_installed,
  },
}
