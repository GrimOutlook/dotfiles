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
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Navigate tabs with Ctrl + , and Ctrl + .
map({"n"}, "<C-,>", "<CMD>BufferLineCycleNext<CR>")
map({"n"}, "<C-.>", "<CMD>BufferLineCyclePrev<CR>")

-- Reload configuration without restart nvim
map("n", "<leader><space>r", ":so %<CR>", { desc = "Reload NeoVim Config" })

-- Fast saving with <leader> and w
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
-- Fast saving all files with <leader> and W
map("n", "<leader>W", ":wa<CR>", { desc = "Save All" })

-- Close current buffer
map("n", "<leader>q", ":bd<CR>", { desc = "Close Buffer" })
-- Close all windows and exit from Neovim with <leader> and q
map("n", "<leader>Q", ":qa<CR>", { desc = "Quit Nvim" })

-- Make normal j and k presses work with wrapped words
map("n", "j", "gj")
map("n", "k", "gk")

-- Clear search highlighting with escape
map("n", "<esc>", "<CMD>nohlsearch<CR>")

-- Move lines in visual selection mode
map({ "n", "v" }, "<C-S-J>", ":m '>+1<CR>gv=gv")
map({ "n", "v" }, "<C-S-K>", ":m '<-2<CR>gv=gv")
map({ "n", "v" }, "<C-S-H>", "<gv")
map({ "n", "v" }, "<C-S-L>", ">gv")

--------------------------------------------------------------------------------
-- Plugin Keymaps --------------------------------------------------------------
--------------------------------------------------------------------------------

-- Diagnostics
map("n", "<leader>D", function() vim.diagnostic.open_float() end, {desc = "Show Diagnostics"})

-- Which-Key -------------------------------------------------------------------
map("n", "<leader>?", function() require("which-key").show({ global = false }) end, { desc = "[which-key] Buffer Local Keymaps" })

-- Rnvimr ----------------------------------------------------------------------
map("n", "<leader>e", "<CMD>RnvimrToggle<CR>", { desc = "Open Rnvimr file explorer" })

-- ToggleTerm ------------------------------------------------------------------
map("n", "<leader>c", "<CMD>ToggleTerm<CR>", { desc = "Open terminal" })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  map("t", "<C-,>", [[<Cmd>ToggleTerm<CR>]], opts)
  map("t", "<C-.>", [[<Cmd>ToggleTerm<CR>]], opts)
  map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end
-- Only apply these mappings to toggleterm
vim.cmd("autocmd! TermOpen term://*toggleterm*# lua set_terminal_keymaps()")

-- Snacks Pickers --------------------------------------------------------------
-- General
map("n", "<leader>f", function() require("snacks").picker.files() end, { desc = "Files" })
map("n", "<leader>r", function() require("snacks").picker.recent({ cwd = true }) end, { desc = "Recent Files (CWD)" })
map("n", "<leader>n", function() require("snacks").picker.notifications() end, { desc = "Recent Files (CWD)" })

-- Extras
map("n", "<leader>i", function() require("snacks").picker.icons() end, { desc = "Icons" })
map("n", "<leader><space>fh", function() require("snacks").picker.help() end, { desc = "Help Pages" })
map("n", "<leader><space>fk", function() require("snacks").picker.keymaps() end, { desc = "Keymaps" })

-- Text searching
map("n", "<leader>/", function() require("snacks").picker.grep({buf = 0}) end, { desc = "Search (buffer)" })
map({ "v", "x" }, "<leader>/", function() require("snacks").picker.grep_word({buf = 0}) end, { desc = "Search Word (Buffer)" })
map("n", "<leader>?", function() require("snacks").picker.grep({cwd = true}) end, { desc = "Search (CWD)" })
map({ "v", "x" }, "<leader>?", function() require("snacks").picker.grep_word({cwd = true}) end, { desc = "Search word (CWD)" })

-- Issues
map({ "n", "x" }, "<leader>a", function() require("tiny-code-action").code_action() end, { desc = "Code Actions" })
map("n", "<leader>x", function() require("snacks").picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
map("n", "<leader>X", function() require("snacks").picker.diagnostics() end, { desc = "Diagnostics" })

-- LSP
map("n", "gd", function() Snacks.picker.lsp_definitions()  end, { desc = "Goto Definition" })
map("n", "gD", function() Snacks.picker.lsp_declarations()  end, { desc = "Goto Declaration" })
map("n", "gr", function() Snacks.picker.lsp_references()  end, { nowait = true, desc = "References" })
map("n", "gI", function() Snacks.picker.lsp_implementations()  end, { desc = "Goto Implementation" })
map("n", "gy", function() Snacks.picker.lsp_type_definitions()  end, { desc = "Goto T[y]pe Definition" })
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols()  end, { desc = "LSP Symbols" })
map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols()  end, { desc = "LSP Workspace Symbols" })

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
map({ "n", "v", "x" }, "cr", function()
  local inc_rename = require("inc_rename")
  return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
end, { desc = "Rename (inc-rename.nvim)" })

-- Git-Gui
map("n", "<leader>g", function() Snacks.terminal({ "gitui" }) end, { desc = "GitUi (cwd)", })

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

-- Sort
map ({"v", "x"}, "<leader>S", "<CMD>Sort<CR>", {desc = "Sort"})

-- Overseer
-- Pick and run task
map ({"n"}, "<leader>O", "<CMD>OverseerRun<CR>", {desc = "Run Quick Task"})
-- Run last task
map({"n"}, "<leader>o", function()
  local overseer = require("overseer")
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], "restart")
  end
end, { desc = "Run Last Task" })

-- stylua: ignore end
