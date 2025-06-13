return {
  ------ Local Plugins
  {
    dir = "~/code/lumberjack.nvim",
    opts = {}
  },

  ------ Remote Plugins
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = true,
    opts = function()
      local colors = require("gruvbox").palette
      return {
        inverse = false, -- invert background for search, diffs, statuslines and errors
        overrides = {
          DiffDelete = { bg = colors.dark_red },
          DiffAdd = { bg = colors.dark_green },
          DiffChange = { bg = colors.dark_aqua },
          DiffText = { bg = colors.faded_yellow },
        },
      }
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        {
          "<leader>cr",
          function()
            local inc_rename = require("inc_rename")
            return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
          end,
          expr = true,
          desc = "Rename (inc-rename.nvim)",
          has = "rename",
        },
        -- Disable the default gr binding which takes you to a references picker
        -- and move it to "grr". Want to use gr for other things.
        { "gr", false },
        {
          "grr",
          function()
            Snacks.picker.lsp_references()
          end,
          nowait = true,
          desc = "References",
        },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    init = function()
      vim.o.formatexpr = [[v:lua.require("conform").formatexpr()]]
    end,
    opts = {
      formatters_by_ft = {
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "codespell", "typos", "trim_whitespace" },
      },
    },
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "hrsh7th/cmp-emoji" },
  --   ---@param opts cmp.ConfigSchema
  --   --- override nvim-cmp and add cmp-emoji
  --   opts = function(_, opts)
  --     table.insert(opts.sources, { name = "emoji" })
  --
  --     -- Use <tab> for completion and snippets (supertab).
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --
  --     local cmp = require("cmp")
  --
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
  --           cmp.select_next_item()
  --         elseif vim.snippet.active({ direction = 1 }) then
  --           vim.schedule(function()
  --             vim.snippet.jump(1)
  --           end)
  --         elseif has_words_before() then
  --           cmp.complete()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item()
  --         elseif vim.snippet.active({ direction = -1 }) then
  --           vim.schedule(function()
  --             vim.snippet.jump(-1)
  --           end)
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --   end,
  -- },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "cpp",
        "html",
        "javascript",
        "groovy",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          enabled = false,
        },
      },
    },
    -- stylua: ignore
    keys = function()
      return {
        -- Move them to leader bindings
        { "<CR>",  mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        { "f",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        { "F",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "t",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "T",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
      }
    end,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>qS", function() require("persistence").select() end,              desc = "Select Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },
  },

  {
    -- jdtls spams the hell out of the bottom right hand corner so I want to
    -- hide a lot of the messages that appear.
    "folke/noice.nvim",
    require("noice").setup({
      routes = {
        filter = {
          event = "lsp",
          kind = "progress",
          find = "jdtls",
        },
        opts = { skip = true },
      },
    }),
  },

  {
    "Hashino/doing.nvim",
    cmd = "Do",
    lazy = true,
    -- stylua: ignore
    init = function()
      local doing = require("doing")

      vim.keymap.set("n", "<leader>dda", doing.add, { desc = "[D]oing: [A]dd" })
      vim.keymap.set("n", "<leader>dde", doing.edit, { desc = "[D]oing: [E]dit" })
      vim.keymap.set("n", "<leader>ddn", doing.done, { desc = "[D]oing: Do[n]e" })
      vim.keymap.set("n", "<leader>ddt", doing.toggle, { desc = "[D]oing: [T]oggle" })

      vim.keymap.set("n", "<leader>dds", function()
        vim.notify(doing.status(true), vim.log.levels.INFO,
          { title = "Doing:", icon = "", })
      end, { desc = "[D]oing: [S]tatus", })

      vim.api.nvim_create_autocmd({ "User", }, {
        pattern = "TaskModified",
        desc = "This is called when a task is added, edited or completed",
        callback = function()
          vim.defer_fn(function()
            local status = doing.status()
            if status ~= "" then
              vim.notify(status, vim.log.levels.INFO,
                { title = "Doing:", icon = "", })
            end
          end, 0)
        end,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.sections.lualine_c = {}
      opts.sections.lualine_z = {
        { require("doing").status },
      }
    end,
  },

  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },

  {
    "sindrets/diffview.nvim",
    opts = {
      config = {
        enhanced_diff_hl = true,
      },
    },
  },

  { "tpope/vim-fugitive" },

  { "abecodes/tabout.nvim" },

  { "bignimbus/you-are-here.vim" },

  {
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
      config = {
        mac_window_bar = true,
        title = "CodeSnap.nvim",
        code_font_family = "CaskaydiaCove Nerd Font",
        watermark_font_family = "Pacifico",
        watermark = "CodeSnap.nvim",
        bg_theme = "summer",
        breadcrumbs_separator = "/",
        has_breadcrumbs = true,
        has_line_number = true,
        show_workspace = true,
        min_width = 0,
        bg_x_padding = 60,
        bg_y_padding = 45,
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },

  {
    "snacks.nvim",
    opts = {
      picker = {},
    },
    keys = {
      {
        "<leader>fr",
        function()
          require("snacks").picker.recent({ filter = { cwd = true } })
        end,
        desc = "Recent Files (CWD Only)",
      },
    },
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files (CWD)",
              action = ":lua Snacks.picker.recent({ filter = { cwd = true } })",
            },
            { icon = " ", key = "R", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },

  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        mode = { "n", "v" },
        "<leader>sff",
        function()
          require('grug-far').open(
            {
              prefills = {
                search = vim.fn.expand("<cword>"),
                replacement = vim.fn.expand("<cword>")
              }
            }
          )
        end,
        desc = "Search and replace everywhere for selection/word"
      },
      {
        mode = { "n", "v" },
        "<leader>sfa",
        function()
          require('grug-far').open(
            {
              prefills = {
                paths = vim.fn.expand("%"),
                search = vim.fn.expand("<cword>"),
                replacement = vim.fn.expand("<cword>")
              }
            }
          )
        end,
        desc = "Search and replace file for selection/word"
      }
    }
  }
}
