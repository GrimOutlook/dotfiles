
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set backupdir=~/.vim/backup
set number

" This makes vim watch for vimrc changes and reloads vim accordingly on the
" fly
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
	set termguicolors
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ***** Folding *****"
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
"set foldlevel=0
"set foldclose=all

" ***** Natural Splitting ***** "
set splitbelow
set splitright

" ***** Window Movement Adjustment ***** "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ***** netrw settings ***** "
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" ***** Remaps semi-colon to colon since semi-colon is useless *****"
" nnoremap ; :
" nnoremap : ;
cnoremap sudow w !sudo tee % >/dev/null

" ***** Fixing Tabs ***** "
set tabstop=4 shiftwidth=4 expandtab
set softtabstop=4

call plug#begin('~/.vim/defaults')
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
"Plug 'hdima/python-syntax'
"Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'Yggdroot/indentLine'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
"Plug 'scrooloose/nerdcommenter' " \c<space> to toggle comment
Plug 'jiangmiao/auto-pairs'
Plug 'severin-lemaignan/vim-minimap' " \gt - toggle minimap
call plug#end()

syntax on

" ********************** PLUGINS  ************************* "

" ***** Tagbar ***** "
nmap <F8> :TagbarToggle<CR>

" ***** Syntastic ***** "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_debug = 1
let g:syntastic_python_checkers=['python', 'flake8'] " Pep8 and pyflakes removed
let g:syntastic_python_flake8_post_args = '--ignore=E126,E201,E202,E401,E501,W504'

"" *****Vim CPP Enhanced Highlight***** "
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

"" *****Python Syntax***** "
"let python_highlight_all = 1

"" *****Python-Mode***** "
"let g:pymode_python = 'python3' " Pythonmode for python3 rather than python2

" ***** IndentLine  ***** "
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 0
let g:indentLine_color_gui = '#404040'

" ********************* THEMES *************************** "

" ***** lightline ***** "
let g:airline_theme='one'
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" ***** Onedark through vim-one ***** "
"colorscheme one
"set background=dark " for the dark version
"let g:one_allow_italics = 1

" ***** onedark through onedark.vim ***** "
set laststatus=2
"colorscheme onedark

" ***** GRUVBOX ***** "

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='gruvbox'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:gruvbox_bold')
  let g:gruvbox_bold=1
endif
if !exists('g:gruvbox_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:gruvbox_italic=1
  else
    let g:gruvbox_italic=0
  endif
endif
if !exists('g:gruvbox_undercurl')
  let g:gruvbox_undercurl=1
endif
if !exists('g:gruvbox_underline')
  let g:gruvbox_underline=1
endif
if !exists('g:gruvbox_inverse')
  let g:gruvbox_inverse=1
endif

if !exists('g:gruvbox_guisp_fallback') || index(['fg', 'bg'], g:gruvbox_guisp_fallback) == -1
  let g:gruvbox_guisp_fallback='NONE'
endif

if !exists('g:gruvbox_improved_strings')
  let g:gruvbox_improved_strings=0
endif

if !exists('g:gruvbox_improved_warnings')
  let g:gruvbox_improved_warnings=0
endif

if !exists('g:gruvbox_termcolors')
  let g:gruvbox_termcolors=256
endif

if !exists('g:gruvbox_invert_indent_guides')
  let g:gruvbox_invert_indent_guides=0
endif

if exists('g:gruvbox_contrast')
  echo 'g:gruvbox_contrast is deprecated; use g:gruvbox_contrast_light and g:gruvbox_contrast_dark instead'
endif

if !exists('g:gruvbox_contrast_dark')
  let g:gruvbox_contrast_dark='medium'
endif

if !exists('g:gruvbox_contrast_light')
  let g:gruvbox_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

colorscheme gruvbox
set background=dark " for dark version

set t_Co=256
