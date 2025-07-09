return {
  ------ Local Plugins

  ------ Remote Plugins
  ---
  --- START THEMES
  { "ellisonleao/gruvbox.nvim" },
  { "cryptomilk/nightcity.nvim" },
  { "luisiacc/gruvbox-baby" },
  { "neanias/everforest-nvim" },

  -- Setup the theme changer
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "gruvbox",
          {
            name = "Gruvbox",
            colorscheme = "gruvbox-baby",
            before = [[
              vim.g.gruvbox_baby_use_original_palette = true
            ]],
          },
          "nightcity",
        },                  -- Your list of installed colorschemes.
        livePreview = true, -- Apply theme while picking. Default to true.
      })
    end,
  },

  --- END THEMES

  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        { "<leader>ca", false },
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
        { "gr",         false },
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
            { icon = " ", key = "p", desc = "Choose Project", action = ":lua Snacks.picker.projects()" },
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
          require("grug-far").open({
            prefills = {
              search = vim.fn.expand("<cword>"),
              replacement = vim.fn.expand("<cword>"),
            },
          })
        end,
        desc = "Search and replace everywhere for selection/word",
      },
      {
        mode = { "n", "v" },
        "<leader>sfa",
        function()
          require("grug-far").open({
            prefills = {
              paths = vim.fn.expand("%"),
              search = vim.fn.expand("<cword>"),
              replacement = vim.fn.expand("<cword>"),
            },
          })
        end,
        desc = "Search and replace file for selection/word",
      },
    },
  },

  {
    "stevearc/overseer.nvim",
    keys = {
      {
        "<leader>ol",
        function()
          local overseer = require("overseer")
          local tasks = overseer.list_tasks({ recent_first = true })
          if vim.tbl_isempty(tasks) then
            vim.notify("No tasks found", vim.log.levels.WARN)
          else
            overseer.run_action(tasks[1], "restart")
          end
        end,
        desc = "Run last task",
      },
    },
  },

  { "kosayoda/nvim-lightbulb" },

  -- Running tests can take a while :p
  { "alec-gibson/nvim-tetris" },

  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        -- Don't select a completion originally. Means you can hit enter without
        -- accidentally inserting now
        -- Don't select by default, auto insert on selection
        list = { selection = { preselect = false, auto_insert = true } },

        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        -- Display a preview of the selected item on the current line
        ghost_text = { enabled = true },

        trigger = {
          -- When true, will show completion window after backspacing
          show_on_backspace = true,

          -- When true, will show completion window after backspacing into a keyword
          show_on_backspace_in_keyword = true,
        },

        -- -- TODO: Get nvim-web-devicons working with copilot. Doesn't show
        -- -- symbol. Icons look way better.
        -- -- NOTE:
        -- -- Tried:
        -- -- - `symbol_map = { Copilot = '' }`
        -- -- - Setting `kind_name` and `kind_icon` in `transform_items` for
        -- -- the copilot provider.
        -- -- - Pasting `optional` section for copilot blink integration in
        -- -- LazyVim
        --
        -- menu = {
        --   draw = {
        --     components = {
        --       kind_icon = {
        --         text = function(ctx)
        --           local icon = ctx.kind_icon
        --           if vim.tbl_contains({ "Path" }, ctx.source_name) then
        --             local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
        --             if dev_icon then
        --               icon = dev_icon
        --             end
        --           else
        --             icon = require("lspkind").symbolic(ctx.kind, {
        --               mode = "symbol",
        --             })
        --           end
        --
        --           return icon .. ctx.icon_gap
        --         end,
        --
        --         -- -- Optionally, use the highlight groups from nvim-web-devicons
        --         -- -- You can also add the same function for `kind.highlight` if you want to
        --         -- -- keep the highlight groups in sync with the icons.
        --         -- highlight = function(ctx)
        --         --   local hl = ctx.kind_hl
        --         --   if vim.tbl_contains({ "Path" }, ctx.source_name) then
        --         --     local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
        --         --     if dev_icon then
        --         --       hl = dev_hl
        --         --     end
        --         --   end
        --         --   return hl
        --         -- end,
        --       }
        --     }
        -- }
      },

      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },
    },
    signature = { enabled = true },
  },

  {
    "saghen/blink.cmp",
    dependencies = { "archie-judd/blink-cmp-words" },
    opts = {
      -- ...
      -- Optionally add 'dictionary', or 'thesaurus' to default sources
      sources = {
        default = { "lsp", "path", "lazydev" },
        providers = {

          -- Use the thesaurus source
          thesaurus = {
            name = "blink-cmp-words",
            module = "blink-cmp-words.thesaurus",
            -- All available options
            opts = {
              -- A score offset applied to returned items.
              -- By default the highest score is 0 (item 1 has a score of -1, item 2 of -2 etc..).
              score_offset = 0,

              -- Default pointers define the lexical relations listed under each definition,
              -- see Pointer Symbols below.
              -- Default is as below ("antonyms", "similar to" and "also see").
              pointer_symbols = { "!", "&", "^" },
            },
          },

          -- Use the dictionary source
          dictionary = {
            name = "blink-cmp-words",
            module = "blink-cmp-words.dictionary",
            -- All available options
            opts = {
              -- The number of characters required to trigger completion.
              -- Set this higher if completion is slow, 3 is default.
              dictionary_search_threshold = 3,

              -- See above
              score_offset = 0,

              -- See above
              pointer_symbols = { "!", "&", "^" },
            },
          },
        },

        -- Setup completion by filetype
        per_filetype = {
          text = { "dictionary" },
          markdown = { "thesaurus" },
        },
      },
    },
  },

  {
    "allaman/emoji.nvim",
    version = "1.0.0", -- optionally pin to a tag
    ft = "markdown",   -- adjust to your needs
    dependencies = {
      -- util for handling paths
      "nvim-lua/plenary.nvim",
      -- optional for nvim-cmp integration
      "hrsh7th/nvim-cmp",
      -- optional for fzf-lua integration via vim.ui.select
      "ibhagwan/fzf-lua",
    },
    opts = {
      -- default is false, also needed for blink.cmp integration!
      enable_cmp_integration = true,
    },
    config = function(_, opts)
      require("emoji").setup(opts)
    end,
  },

  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "allaman/emoji.nvim", "MahanRahmati/blink-nerdfont.nvim", "saghen/blink.compat", "onsails/lspkind.nvim" },
    opts = {
      sources = {
        -- default = { "emoji", "nerdfont" },
        default = { "emoji" },
        providers = {
          emoji = {
            name = "emoji",
            module = "blink.compat.source",
            -- overwrite kind of suggestion
            transform_items = function(ctx, items)
              local kind = require("blink.cmp.types").CompletionItemKind.Text
              for i = 1, #items do
                items[i].kind = kind
              end
              return items
            end,
          },
          --   nerdfont = {
          --     module = "blink-nerdfont",
          --     name = "Nerd Fonts",
          --     score_offset = 1,         -- Tune by preference
          --     opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
          --   }
        },
      },
    },
  },

  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      -- optional picker via fzf-lua
      {
        "folke/snacks.nvim",
        opts = {
          terminal = {},
        },
      },
    },
    event = "LspAttach",
    opts = {
      backend = "difftastic",
      -- TODO: Try buffer at a later date. I like how it is organized but
      -- currently covers up information and with the hotkeys enabled, preview
      -- does not work.
      picker = {
        "buffer",
        opts = {
          hotkeys = true,
        },
      },
    },
  },
}
