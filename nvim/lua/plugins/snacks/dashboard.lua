return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
                -- stylua: ignore
                ---@type snacks.dashboard.Item[]
                keys = {
                    { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "/", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "g", desc = "Gitui", action = ":lua Snacks.terminal({ 'gitui' })" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load({ last = true })" },
                    { icon = " ", key = "m", desc = "Mason", action = ":Mason" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
        header = [[
            )  (    (      (    (      (     (        )
  *   )  ( /(  )\ ) )\ )   )\ ) )\ )   )\ )  )\ )  ( /(
` )  /(  )\())(()/((()/(  (()/((()/(  (()/( (()/(  )\()) (
 ( )(_))((_)\  /(_))/(_))  /(_))/(_))  /(_)) /(_))((_)\  )\
(_(_())  _((_)(_)) (_))   (_)) (_))   (_))_|(_))   _((_)((_)
|_   _| | || ||_ _|/ __|  |_ _|/ __|  | |_  |_ _| | \| || __|
  | |   | __ | | | \__ \   | | \__ \  | __|  | |  | .` || _|
  |_|   |_||_||___||___/  |___||___/  |_|   |___| |_|\_||___|
]],
      },
      sections = {
        {
          section = "terminal",
          cmd = "/usr/bin/cat ~/.config/nvim/resources/wall.output; sleep 0.1",
          padding = 1,
          height = 30,
        },
        {
          pane = 2,
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
