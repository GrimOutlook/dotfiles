return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        local fb_actions = telescope.extensions.file_browser.actions
        telescope.setup {
            extensions = {
                file_browser = {
                    theme = "ivy",
                    -- Disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {
                            -- Toggle hidden files
          ["<C-h>"] = fb_actions.toggle_hidden,
                        },
                        ["n"] = {
                            -- your custom normal mode mappings
                        },
                    },
                },
            },
        }
        -- To get telescope-file-browser loaded and working with telescope,
        -- you need to call load_extension, somewhere after setup function:
        telescope.load_extension "file_browser"
        
        vim.keymap.set("n", "<space>e", function()
            require("telescope").extensions.file_browser.file_browser()
        end)
    end
}
