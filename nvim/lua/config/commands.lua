vim.api.nvim_create_user_command(
    "FormatAllFiles",
    function(opts)
        local directory = opts.fargs[1]
        local extension = opts.fargs[2]

        if (directory == nil) then
            directory = vim.fn.getcwd()
        end

        local appender = ""
        if (extension ~= nil) then
            appender = "." .. extension
        end

        local files = vim.fn.glob(directory .. "**/*" .. appender, true, true)
        for _, file_path in ipairs(files) do
            vim.cmd("edit " .. file_path)            -- Open the file in a buffer
            require("conform").format({ bufnr = 0 }) -- Format the current buffer using conform
            vim.cmd("write")                         -- Save the formatted file
            vim.cmd("bdelete")                       -- Close the buffer
        end
    end,
    {
        desc = "Format all files with an optional extension filter",
        nargs = '*'
    }
)
