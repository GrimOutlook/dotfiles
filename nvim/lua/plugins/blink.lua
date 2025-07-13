require('blink.cmp').setup({
    keymap = {
        preset = 'super-tab'
    },
    completion = {
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            window = { border = "rounded", },
        },
        ghost_text = {
            enabled = true,
        },
    },
    signature = {
        enabled = true,
    },
})
