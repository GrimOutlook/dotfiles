return
  {
    "saghen/blink.cmp",
    version = '1.*',
    keymap = {
      preset = "super-tab",
    },

    opts = {
      completion = {
        -- Don't select a completion originally. Means you can hit enter without
        -- accidentally inserting now
        -- Don't select by default, auto insert on selection
        list = { selection = { preselect = false, auto_insert = true } },

        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        -- Display a preview of the selected item on the current line
        ghost_text = { enabled = true },

        trigger = {
          -- When true, will show completion window after backspacing
          show_on_backspace = true,

          -- When true, will show completion window after backspacing into a keyword
          show_on_backspace_in_keyword = true,
        },
      },

      -- Autocompletion keymaps
      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },
    },
    signature = { enabled = true },
  }

