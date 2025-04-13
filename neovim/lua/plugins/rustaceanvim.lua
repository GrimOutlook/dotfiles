-- Supercharge your Rust experience in neovim
-- rustaceanvim
return({
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  init = function()
    -- Configure rustaceanvim here
    vim.g.rustaceanvim = {
      tools = {
	enable_clippy = true
      }
    }
  end,
  lazy = false, -- This plugin is already lazy
})
