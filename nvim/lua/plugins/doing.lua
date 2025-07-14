return {
  "Hashino/doing.nvim",
  cmd = "Do",
  lazy = true,
    -- stylua: ignore
    init = function()
      local doing = require("doing")

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
}
