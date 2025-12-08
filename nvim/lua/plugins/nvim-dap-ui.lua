return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap", "folke/lazydev.nvim" },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  },
  opts = {},
  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup(opts)
    -- WARN: This is causing DAP to close when invalid args are given, making it
    -- harder to determine what args are wrong when trying to run the command
    -- again
    --
    -- dap.listeners.after.event_initialized["dapui_config"] = function()
    --   dapui.open({})
    -- end
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close({})
    -- end
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close({})
    -- end
    require("lazydev").setup({
      library = { "nvim-dap-ui" },
    })
  end,
}
