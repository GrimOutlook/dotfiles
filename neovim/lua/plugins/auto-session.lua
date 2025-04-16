-- A small automated session manager for Neovim
-- https://github.com/rmagatti/auto-session
return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Code", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
}
