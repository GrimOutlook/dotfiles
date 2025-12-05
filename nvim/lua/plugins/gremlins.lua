return {
  "Cyan903/gremlins.nvim",
  -- I checked this commit myself
  commit = "13613511772004ecdba9223954b32800f1529154",

  opts = {},

  config = function(_, opts)
    local gremlins = require("gremlins")
    -- Open popup.
    vim.keymap.set("n", "<leader>G", gremlins.select, { desc = "Gremlins select." })
    -- Jump to next gremlin.
    vim.keymap.set("n", "<leader>[g", gremlins.next, { desc = "Gremlins next." })
    -- Jump to previous gremlin.
    vim.keymap.set("n", "<leader>]g", gremlins.prev, { desc = "Gremlins previous." })
    gremlins.setup(opts)
  end,
}
