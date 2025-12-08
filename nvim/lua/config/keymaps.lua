local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- stylua: ignore start
-- General Keymaps -------------------------------------------------------------
-- Move around splits using Ctrl + {h,j,k,l}
-- NOTE: Already handled by TmuxNavigator. Uncommenting breaks this.
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")

-- Reload configuration without restart nvim
map("n", "<leader><space>r", ":so %<CR>", { desc = "Reload NeoVim Config" })

-- Fast saving with <leader> and w
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
-- Fast saving all files with <leader> and W
map("n", "<leader>W", ":wa<CR>", { desc = "Save All" })

map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[<TAB>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]<TAB>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Close current buffer
-- If this is the last buffer, return to the dashboard.
map("n", "<leader>q", function()
    local num_listed_buffers = #vim.tbl_filter(function(bufnr)
        return vim.api.nvim_buf_get_option(bufnr, "buflisted")
    end, vim.api.nvim_list_bufs())
    if vim.bo.filetype ~= "snacks_dashboard"  then
        if num_listed_buffers > 0 then
            require("snacks").bufdelete()
        end
        if num_listed_buffers <= 1 then
            require("snacks").dashboard()
        end
    else
        vim.cmd("qa")
    end
end, { desc = "Close Buffer" })

-- Close all windows and exit from Neovim with <leader> and q
map("n", "<leader>Q", ":qa<CR>", { desc = "Quit Nvim" })

-- Make normal j and k presses work with wrapped words
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true})
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true})
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true})
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true})


-- Clear search highlighting with escape
map("n", "<esc>", "<CMD>nohlsearch<CR>")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points when writing non-code
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- Open useful menus quickly
map("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "Open Lazy" })
map("n", "<leader>M", "<CMD>Mason<CR>", { desc = "Open Mason" })

--------------------------------------------------------------------------------
-- Plugin Keymaps --------------------------------------------------------------
--------------------------------------------------------------------------------

-- Diagnostics
map("n", "D", function() vim.diagnostic.open_float() end, {desc = "Show Diagnostics"})

-- Which-Key -------------------------------------------------------------------
map("n", "<leader><leader>?", function() require("which-key").show({ global = false }) end, { desc = "[which-key] Buffer Local Keymaps" })

-- -- Oil ----------------------------------------------------------------------
map("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open oil file explorer" })

-- ToggleTerm ------------------------------------------------------------------
map("n", "<leader>tt", "<CMD>ToggleTerm<CR>", { desc = "Open terminal" })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  map("t", "<A-,>", [[<Cmd>ToggleTerm<CR>]], opts)
  map("t", "<A-.>", [[<Cmd>ToggleTerm<CR>]], opts)
  map("t", "<A-h>", [[<Cmd>wincmd h<CR>]], opts)
  map("t", "<A-j>", [[<Cmd>wincmd j<CR>]], opts)
  map("t", "<A-k>", [[<Cmd>wincmd k<CR>]], opts)
  map("t", "<A-l>", [[<Cmd>wincmd l<CR>]], opts)
end
-- Only apply these mappings to toggleterm
vim.cmd("autocmd! TermOpen term://*toggleterm*# lua set_terminal_keymaps()")

-- Snacks Pickers --------------------------------------------------------------
-- General
map("n", "<leader>R", function() require("snacks").picker.resume() end, { desc = "Reopen Last Picker" })
map("n", "<leader>ff", function() require("snacks").picker.files({ focus = "input" }) end, { desc = "Files" })
map("n", "<leader>fr", function() require("snacks").picker.recent({ filter= { cwd = true }, current = false }) end, { desc = "Recent Files (CWD)" })
map("n", "<leader>n", function() require("noice").cmd("last") end, { desc = "Last Notification" })
map("n", "<leader>N", function() require("snacks").picker.notifications() end, { desc = "Notification History" })
map("n", "<leader>b", function() require("snacks").picker.buffers({ current = false }) end, { desc = "Buffers" })

-- Extras
map("n", "<leader>si", function() require("snacks").picker.icons({focus = "input"}) end, { desc = "Icons" })
map("n", "<leader>m", function() require("snacks").picker.marks() end, { desc = "Marks" })
map("n", "<leader>sa", function() require("snacks").picker.autocmds() end, { desc = "Autocmds" })
map("n", "<leader>sh", function() require("snacks").picker.help() end, { desc = "Help Pages" })
map("n", "<leader>sk", function() require("snacks").picker.keymaps() end, { desc = "Keymaps" })
map("n", "<leader>sc", function() require("snacks").picker.commands() end, { desc = "Commands" })
map("n", "<leader>sC", function() require("snacks").picker.command_history() end, { desc = "Command History" })

-- Text searching
map("n", "<leader>//", function()
    require("snacks").picker.grep({
        focus = "input",
        dirs = {
            vim.fn.expand("%")
        }

}) end, { desc = "Search (Current File)" })
map({ "v", "x" }, "<leader>/", function()
    require("snacks").picker.grep( {
        search = vim.fn.expand("<cword>"),
        dirs = {
            vim.fn.expand("%")
        }
}) end, { desc = "Search Selection (Current File)" })
map("n", "<leader>/#", function()
    require("snacks").picker.grep( {
        search = vim.fn.expand("<cword>"),
        dirs = {
            vim.fn.expand("%")
        }
}) end, { desc = "Search Selection (Current File)" })
map("n", "<leader>/r", function() require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } }) end, { desc = "Search and Replace (Current File)" })
map({ "v", "x" }, "<leader>/r", function() require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand("%") } }) end, { desc = "Search and Replace (Current File)" })
map("n", "<leader>/?", function() require("snacks").picker.grep({focus="input"}) end, { desc = "Search (CWD)" })
map({ "v", "x" }, "<leader>/?", function() require("snacks").picker.grep_word() end, { desc = "Search word (CWD)" })
map("n", "<leader>/R", function() require("grug-far").open() end, { desc = "Search and Replace (CWD)" })
map({ "v", "x" }, "<leader>/R", function() require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>") } }) end, { desc = "Search and Replace (CWD)" })

-- Issues
map({ "n", "x" }, "<leader>a", function() require("tiny-code-action").code_action({}) end, { desc = "Code Actions" })
map("n", "<leader>x", function() require("snacks").picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
map("n", "<leader>X", function() require("snacks").picker.diagnostics() end, { desc = "Diagnostics" })

-- LSP
map("n", "gd", function() require("snacks").picker.lsp_definitions({ current = false })  end, { desc = "Goto Definition" })
map("n", "gD", function() require("snacks").picker.lsp_declarations({ current = false })  end, { desc = "Goto Declaration" })
map("n", "gr", function() require("snacks").picker.lsp_references({ current = false })  end, { nowait = true, desc = "References" })
map("n", "gI", function() require("snacks").picker.lsp_implementations({ current = false })  end, { desc = "Goto Implementation" })
map("n", "gy", function() require("snacks").picker.lsp_type_definitions({ current = false })  end, { desc = "Goto T[y]pe Definition" })
map("n", "gai", function() require("snacks").picker.lsp_incoming_calls({ current = false })  end, { desc = "C[a]lls Incoming" })
map("n", "gao", function() require("snacks").picker.lsp_outgoing_calls({ current = false })  end, { desc = "C[a]lls Outgoing" })

-- Search
map("n", "<leader>ss", function() require("snacks").picker.lsp_symbols({})  end, { desc = "LSP Symbols" })
map("n", "<leader>sS", function() require("snacks").picker.lsp_workspace_symbols()  end, { desc = "LSP Workspace Symbols" })
map("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" } )
map("n", '<leader>s"', function() Snacks.picker.registers() end, {desc = "Registers" })
map("n", '<leader>s/', function() Snacks.picker.search_history() end, {desc = "Search History" })
map("n", '<leader>sj', function() Snacks.picker.jumps() end, {desc = "Jumps" })
map("n", '<leader>sl', function() Snacks.picker.loclist() end, {desc = "Location List" })
map("n", "<leader>st", function() Snacks.picker.todo_comments() end, {desc = "Search TODO, HACK, FIXME...", })
-- TODO:
-- map("n", "<leader>sr", function() require("utilities").openSearchAndReplace() end, {desc = "Search and Replace (WIP)", })

-- Git
map("n", "<leader>gf", function() require("snacks").picker.git_files() end, { desc = "Git Files" })
map("n", "<leader>gl", function() require("snacks").picker.git_log() end, { desc = "Git Log" })

map("n", "<leader>gb", function() Snacks.picker.git_branches() end, {desc = "Git Branches"} )
map("n", "<leader>gl", function() Snacks.picker.git_log() end, {desc = "Git Log"} )
map("n", "<leader>gL", function() Snacks.picker.git_log_line() end, {desc = "Git Log Line"} )
map("n", "<leader>gs", function() Snacks.picker.git_status() end, {desc = "Git Status"} )
map("n", "<leader>gS", function() Snacks.picker.git_stash() end, {desc = "Git Stash"} )
map("n", "<leader>gd", function() Snacks.picker.git_diff() end, {desc = "Git Diff (Hunks)"} )
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, {desc = "Git Log File"} )

-- gh
map("n", "<leader>gi", function() Snacks.picker.gh_issue() end, {desc = "GitHub Issues (open)"} )
map("n", "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, {desc = "GitHub Issues (all)"} )
map("n", "<leader>gp", function() Snacks.picker.gh_pr() end, {desc = "GitHub Pull Requests (open)"} )
map("n", "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, {desc = "GitHub Pull Requests (all)"} )

-- Debuggers
map("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Breakpoint Condition" })
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "Run/Continue" })
map("n", "<leader>da", function() require("dap").continue({ before = get_args }) end, { desc = "Run with Args" })
map("n", "<leader>dC", function() require("dap").run_to_cursor() end, { desc = "Run to Cursor" })
map("n", "<leader>dg", function() require("dap").goto_() end, { desc = "Go to Line (No Execute)" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step Into" })
map("n", "<leader>dj", function() require("dap").down() end, { desc = "Down" })
map("n", "<leader>dk", function() require("dap").up() end, { desc = "Up" })
map("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Run Last" })
map("n", "<leader>do", function() require("dap").step_out() end, { desc = "Step Out" })
map("n", "<leader>dO", function() require("dap").step_over() end, { desc = "Step Over" })
map("n", "<leader>dP", function() require("dap").pause() end, { desc = "Pause" })
map("n", "<leader>dr", function() require("dap").repl.toggle() end, { desc = "Toggle REPL" })
map("n", "<leader>ds", function() require("dap").session() end, { desc = "Session" })
map("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Terminate" })
map("n", "<leader>dw", function() require("dap.ui.widgets").hover() end, { desc = "Widgets" })

-- Inc-rename
vim.keymap.set("n", "cr", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "Rename symbol", expr = true })

-- Conform
map({"n", "v", "x"}, "<leader>F", function()
  require("conform").format({ async = true }, function(err)
    if not err then
      local mode = vim.api.nvim_get_mode().mode
      if vim.startswith(string.lower(mode), "v") then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      end
    end
  end)
end, { desc = "Format code" })
map({"n", "v", "x"}, "<leader><C-F>", function()
  local bufnr = 0
  local last_line_number = vim.api.nvim_buf_line_count(bufnr)
  local last_line = vim.api.nvim_buf_get_lines(bufnr, last_line_number - 1, last_line_number, true)
  local last_line_length = #last_line - 1
  require("conform").format({ async = true, range = { start = {1, 0}, ['end'] = {last_line_number, last_line_length} } })
end, { desc = "Format Whole File" })

-- Sort
map ({"v", "x"}, "<leader>S", "<CMD>Sort<CR>", {desc = "Sort"})

-- Overseer
-- Pick and run task
map ("n", "<leader>tq", "<CMD>OverseerRun<CR>", {desc = "Run Quick Task"})
-- Run last task
map("n", "<leader>tl", function()
  local overseer = require("overseer")
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], "restart")
  end
end, { desc = "Run Last Task" })


-- Toggles --------------------------------------------------------------------
-- Toggle wrap
map({"n", "i", "v", "x"}, "<leader>uw",
function()
  vim.opt.wrap = not vim.opt.wrap:get()
  -- Optional: Provide feedback to the user
  if vim.opt.wrap:get() then
    print("Wrap enabled")
  else
    print("Wrap disabled")
  end
end, { desc = "Toggle word wrap" })

-- stylua: ignore end
