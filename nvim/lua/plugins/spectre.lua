return {
  "nvim-pack/nvim-spectre",
  config = function()
    require("spectre").setup({ is_block_ui_break = true })
  end,
  opts = {
    mapping = {
      ["send_to_qf"] = {
        map = "<localleader>f",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all items to quickfix",
      },
    },
  },
}
