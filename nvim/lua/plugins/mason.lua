local lsp_install = {
  "codebook",
  "typos_lsp",
  "bashls",
  "lua_ls",
  "jdtls",
  "gh_actions_ls",
  "ast_grep",

  -- TODO: Determine if the below might be better
  -- "docker_compose_language_service",
  -- "dockerls",
  "docker_language_server",

  -- TODO: Determine if emmet_ls is better
  "emmet_language_server",

  "eslint",
  "gitlab_ci_ls",
  "gradle_ls",
  "groovyls",
  "hyprls",
  "jqls",
  "just",
  "lemminx",
  "markdown_oxide",
  "oxlint",
  "powershell_es",
  "rpmspec",
  "snyk_ls",
  "stylelint_lsp",
  "systemd_ls",
  "tailwindcss",

  -- TODO: Figure out if the below might be better
  -- "taplo",
  "tombi",

  -- TODO: Figure out if the below might be better
  -- "tsgo",
  "ts_ls",

  "yamlls",
}
local tools_install = {
  "actionlint",
  "black",
  "cbfmt",
  "codelldb",
  "commitlint",
  "cpptools",
  "doctoc",
  "dotenv-linter",
  "editorconfig-checker",
  "eslint-lsp",
  "fixjson",
  "gitleaks",
  "gitlint",
  "gitui",
  "glow",
  "google-java-format",
  "isort",
  "mdslw",
  "misspell",
  "pgformatter",
  "prettier",
  "prettierd",
  "rpmlint",
  "rustywind",
  "semgrep",
  "shellcheck",
  "shellharden",
  "shfmt",
  "vscode-java-decompiler",
  "vscode-java-dependency",
}
local dependencies = {
  "mason-org/mason-registry",
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      {
        "mason-org/mason.nvim",
        version = "^2.0.0",
        opts = {},
      },
    },
    version = "^2.0.0",
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
    ensure_installed = tools_install,
  },
}
