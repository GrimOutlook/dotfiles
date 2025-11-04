local lsp_install = {
  "codebook",
}
-- local ensure_installed = {
--   -- General
--   --"harper-ls",
--   "misspell",
--   "typos-lsp",
--   -- Bash
--   "shellcheck",
--   "shellharden",
--   "shfmt",
--   "bash-language-server",
--   -- Lua
--   "lua-language-server",
--   "stylua",
--   -- Rust
--   -- NOTE: Rustaceanvim handles everything else.
--   "codelldb",
--   "cpptools",
--   -- Java
--   "google-java-format",
--   "jdtls",
--   "vscode-java-decompiler",
--   "vscode-java-dependency",
--   -- JSON
--   "jq",
--   -- Python
--   "black",
--   "isort",
--   -- Javascript
--   "prettier",
--   "prettierd",
--   -- Git
--   "gitui",
--   "gitleaks",
--   "gitlint",
--   "commitlint",
--   -- Docker
--   "docker-language-server",
--   "dockerfile-language-server",
--   "docker-compose-language-service",
--   -- Groovy/Gradle
--   "groovy-language-server",
--   "gradle-language-server",
--   -- Typescript
--   "eslint-lsp",
--   "typescript-language-server",
--   "tsgo",
--   "oxlint",
--   -- Systemd
--   "systemd-language-server",
--   -- Powershell
--   "powershell-editor-services",
--   -- Markdown
--   "markdown-oxide",
--   "cbfmt",
--   "doctoc",
--   "glow",
--   "mdslw",
--   -- CSS
--   "stylelint-lsp",
--   -- Toml
--   "tombi",
--   -- Misc ---------------------------------------------------------------------
--   "editorconfig-checker",
--   "ast-grep",
--   "emmet-language-server",
--   "dotenv-linter",
--   "emmet-ls",
--   "fixjson",
--   "gitlab-ci-ls",
--   "hyprls",
--   "just-lsp",
--   "lemminx",
--   "pgformatter",
--   "rpm_lsp_server",
--   "rpmlint",
--   "rustywind",
--   "tailwindcss-language-server",
--   "semgrep",
--   "snyk",
--   "snyk-ls",
--   "yaml-language-server",
--   -- Github action linting
--   "actionlint",
-- }
local dependencies = {
  "mason-org/mason-registry",
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      {
        "mason-org/mason.nvim",
        version = "^1.0.0",
        opts = {},
      },
    },
    version = "^1.0.0",
    opts = {
      ensure_installed = lsp_install,
    },
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
