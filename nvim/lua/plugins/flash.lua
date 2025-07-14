return   {
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
  }
