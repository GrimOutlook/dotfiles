
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


call plug#begin('~/.vim/defaults')
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'hdima/python-syntax'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
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
let g:syntastic_check_on_wq = 0

"" *****Vim CPP Enhanced Highlight***** "
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

"" *****Python Syntax***** "
let python_highlight_all = 1

"" *****Python-Mode***** "
let g:pymode_python = 'python3' " Pythonmode for python3 rather than python2


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
let g:gruvbox_italic = 1
colorscheme gruvbox
set background=dark " for dark version
