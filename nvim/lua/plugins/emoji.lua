 return  {
    "saghen/blink.cmp",
    dependencies = {
      {
    "allaman/emoji.nvim",
    version = "1.0.0", -- optionally pin to a tag
    ft = "markdown", -- adjust to your needs
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
      "MahanRahmati/blink-nerdfont.nvim",
      "saghen/blink.compat",
      "onsails/lspkind.nvim",
    },
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
          -- nerdfont = {
          --   module = "blink-nerdfont",
          --   name = "Nerd Fonts",
          --   score_offset = 0, -- Tune by preference
          --   opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
          -- },
        },
      },
    },
  }
