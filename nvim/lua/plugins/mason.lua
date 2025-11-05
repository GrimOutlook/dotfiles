local lsp_install = {
  -- Spelling
  "codebook",
  "typos_lsp",
  -- Bash
  "bashls",
  -- Lua
  "lua_ls",
  -- Java
  "jdtls",
  -- Github Action Files
  "gh_actions_ls",
  -- General
  "ast_grep",
  -- Docker
  -- NOTE: Could also try the `docker_compose_language_service` but it doesn't support `Dockerfile`s. It's made by Microsoft while `docker_language_server` is made by docker.
  "docker_language_server",
  -- TSX/HTML/Markup
  "emmet_language_server",
  -- Typescript/Javascript
  -- NOTE: `oxlint` aims to replace `eslint`. Swap for `eslint` if shortcomings are found.
  -- NOTE: `tsgo` is way more popular (Github stars). Might checkout `ts_ls` later if issues are found.
  -- "ts_ls",
  -- "eslint",
  -- "tsgo",
  "oxlint",
  -- Gitlab CI Files
  "gitlab_ci_ls",
  -- Gradle Files
  "gradle_ls",
  -- Groovy
  "groovyls",
  -- Hypr Config Files
  "hyprls",
  -- JSON
  "jqls",
  -- JUSTFILEs
  "just",
  -- XML
  "lemminx",
  -- Markdown
  "markdown_oxide",
  -- Powershell
  "powershell_es",
  -- RPM SPEC files
  "rpmspec",
  -- Code security scanner. Might use remote calls, disabling for now.
  -- "snyk_ls",
  --
  -- CSS/Vue/HTML
  "stylelint_lsp",
  -- Systemd Unit Files
  "systemd_ls",
  -- CSS
  "tailwindcss",

  -- TOML
  -- NOTE: `tombi` is newer and is currently more geared towards cargo toml
  -- files but it is a potential successor to `taplo`. Can switch if the need
  -- arises.
  -- "taplo",
  "tombi",

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
  "fixjson",
  "gitleaks",
  "gitlint",
  "gitui",
  "google-java-format",
  "isort",
  "mdslw",
  "misspell",
  -- Groovy/Gradle
  "npm-groovy-lint",
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
  -- categories.
  -- NOTE: mason-tool-install.nvim can accept either Mason names, lspconfig
  -- names or dap names.
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = dependencies,
  opts = {
    ensure_installed = tools_install,
  },
}
