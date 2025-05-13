vim.g.mapsleader = " "

local function map_call(mode, lhs, rhs, silent)
	vim.keymap.set(mode, lhs, rhs, { silent = silent })
end
local function maps(mode, lhs, rhs)
	map_call(mode, lhs, rhs, true)
end
local function map(mode, lhs, rhs)
	map_call(mode, lhs, rhs, false)
end

-- Save
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>", { silent = true, desc = "Save current buffer" })
vim.keymap.set("n", "<A-w>", "<CMD>update<CR>", { silent = true, desc = "Save current buffer" })
vim.keymap.set("n", "<A-S-q>", "<CMD>quit<CR>", { silent = true, desc = "Save current buffer" })

-- Resize Windows
maps("n", "<C-Left>", "<C-w><")
maps("n", "<C-Right>", "<C-w>>")
maps("n", "<C-Up>", "<C-w>+")
maps("n", "<C-Down>", "<C-w>-")

-- Rename symbol
maps("n", "<leader>r", vim.lsp.buf.rename)
-- Clear search highlighting
maps("n", "<ESC>", "<CMD>nohlsearch<CR>")

maps("n", "<leader>t", "<CMD>ToggleTerm<CR>")
-- TODO Why tf doesn't this work?
vim.keymap.set("n", "<c-/>", "<CMD>ToggleTerm<CR>")

-- Duplicate the line and comment the line that it was duplicated from.
vim.keymap.set("n", "ycc", "yygccp", { remap = true })
-- Search within visual selection - this is magic
vim.keymap.set("x", "/", "<Esc>/\\%V")

-- Barbar ----------------------------------------------------------------------
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-S-c>', '<Cmd>BufferClose!<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map('n', '<C-p>',   '<Cmd>BufferPick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

            vim.keymap.set("n", "<S-f>", vim.diagnostic.open_float)
            vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, { desc = "Goto prev diagnostic" })
            vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count= 1, float=true}) end, { desc = "Goto next diagnostic" })
            vim.keymap.set("n", "<C-a>", function() vim.diagnostic.jump({count= 1, float=true}) end, { desc = "Goto next diagnostic" })
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
            vim.keymap.set(
                "n",
                "<C-n>",
                function()
                    if vim.diagnostic.jump({count=1, float=true}) then
                        vim.lsp.buf.code_action()
                    end
                end,
                { desc = "Show next diagnostic and fix?" }
            )
            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<A-a>", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<C-M-f>", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })
