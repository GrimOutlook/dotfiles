-- Most of these settings are stolen from here:
-- https://gist.github.com/lalitmee/c379ee6b5163ac3670cfbca9a356b6bb

-- LSP Server to use for Rust.
-- Set to "bacon-ls" to use bacon-ls instead of rust-analyzer.
-- only for diagnostics. The rest of LSP support will still be
-- provided by rust-analyzer.
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

vim.o.linebreak = true -- lines wrap at words rather than random characters
vim.o.number = true
vim.o.relativenumber = true
vim.o.showbreak = [[↪ ]] -- Options include -> '…', '↳ ', '→','↪ '
vim.o.colorcolumn = '+1' -- Set the colour column to highlight one column after the 'textwidth'
vim.o.wrap = true
vim.opt.textwidth = 80
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.showtabline = 2



-- Format Options {{{

vim.opt.formatoptions = "1qcrn2tjlv"
      -- '1',
      -- 'q', -- continue comments with gq"
      -- 'c', -- Auto-wrap comments using textwidth
      -- 'r', -- Continue comments when pressing Enter
      -- 'n', -- Recognize numbered lists
      -- '2', -- Use indent from 2nd line of a paragraph
      -- 't', -- autowrap lines using text width value
      -- 'j', -- remove a comment leader when joining lines.
      -- -- Only break if the line was not longer than 'textwidth' when the insert
      -- -- started and only at a white character that has been entered during the
      -- -- current insert command.
      -- 'lv'

-- }}}


-- -- Wild and file globbing stuff in command mode {{{
--
-- vim.o.wildcharm = api.nvim_eval([[char2nr("\<C-Z>")]]) -- FIXME: what's the correct way to do this?
-- vim.o.wildmenu = true
-- vim.o.wildmode = 'full' -- Shows a menu bar as opposed to an enormous list
-- vim.o.wildignorecase = true -- Ignore case when completing file names and directories
-- -- Binary
-- vim.o.wildignore = add {
--   '*.aux,*.out,*.toc',
--   '*.o,*.obj,*.dll,*.jar,*.pyc,*.rbc,*.class',
--   '*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp',
--   '*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm',
--   '*.eot,*.otf,*.ttf,*.woff',
--   '*.doc,*.pdf',
--   '*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz',
--   -- Cache
--   '.sass-cache',
--   '*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*.gem',
--   -- Temp/System
--   '*.*~,*~ ',
--   '*.swp,.lock,.DS_Store,._*,tags.lock'
-- }
-- vim.o.wildoptions = 'pum'
-- vim.o.pumblend = 3 -- Make popup window translucent
--
--
-- -- Emoji {{{1
--
-- -- emoji is true by default but makes (n)vim treat all emoji as double width
-- -- which breaks rendering so we turn this off.
-- -- CREDIT: https://www.youtube.com/watch?v=F91VWOelFNE
-- vim.o.emoji = false
--
-- -- }}}
--
-- -- Title {{{
--
-- vim.o.titlestring = ' ❐ %t %r %m'
-- vim.o.titleold = '%{fnamemodify(getcwd(), ":t")}'
-- vim.o.title = true
-- vim.o.titlelen = 70
--
-- -- }}}
--
--
-- vim.o.dictionary = '/usr/share/dict/words'
--
--
-- -- BACKUP AND SWAPS {{{
--
-- vim.o.swapfile = false
-- vim.o.backup = false
-- vim.o.writebackup = false
-- if fn.isdirectory(vim.o.undodir) == 0 then
--   fn.mkdir(vim.o.undodir, 'p')
-- end
-- vim.o.undofile = true
--
-- -- }}}
--
--
-- -- Match and search {{{
--
-- vim.o.showmatch = true
-- vim.o.magic = true
-- vim.o.ignorecase = true
-- vim.o.smartcase = true
-- vim.o.incsearch = true
-- vim.o.wrapscan = true -- Searches wrap around the end of the file
-- vim.o.scrolloff = 9
-- vim.o.sidescrolloff = 10
-- vim.o.sidescroll = 1
--
-- -- }}}
--
-- -- Spelling {{{
--
-- vim.o.spellsuggest = add(12, vim.o.spellsuggest)
-- vim.o.spelloptions = 'camel'
-- vim.o.spellcapcheck = '' -- don't check for capital letters at start of sentence
-- vim.o.fileformats = 'unix,mac,dos'
-- vim.o.complete = add('kspell', vim.o.complete)
--
-- -- }}}
--
-- -- Message output on vim actions {{{
--
-- vim.o.shortmess = table.concat(
--                       {
--       't', -- truncate file messages at start
--       'A', -- ignore annoying swap file messages
--       'o', -- file-read message overwrites previous
--       'O', -- file-read message overwrites previous
--       'T', -- truncate non-file messages in middle
--       'f', -- (file x of x) instead of just (x of x
--       'F', -- Don't give file info when editing a file
--       's',
--       'c',
--       'W' -- Dont show [w] or written when writing
--     }
--  )
