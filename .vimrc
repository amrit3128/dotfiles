if v:progname =~? "evim"
  finish
endif

if exists('skip_defaults_vim')
  finish
endif

if &compatible
  set nocompatible
endif

silent! while 0
  set nocompatible
silent! endwhile

set backspace=indent,eol,start
set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key
set display=truncate
set scrolloff=5

if has('reltime')
  set incsearch
endif

set nrformats-=octal

if has('win32')
  set guioptions-=t
endif

map Q gq
sunmap Q

inoremap <C-U> <C-G>u<C-U>

if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

if 1

  filetype plugin indent on

  augroup vimStartup
    autocmd!

    autocmd BufReadPost *
      \ let line = line("'\"")
      \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
      \      && index(['xxd', 'gitrebase'], &filetype) == -1
      \ |   execute "normal! g`\""
      \ | endif

  augroup END

  augroup vimHints
    au!
    autocmd CmdwinEnter *
	  \ echohl Todo |
	  \ echo gettext('You discovered the command-line window! You can close it with ":q".') |
	  \ echohl None
  augroup END

endif
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  syntax on

  let c_comment_strings=1
endif

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  set nolangremap
endif

set relativenumber
set cursorline
set paste
colorscheme desert

call plug#begin()

" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jasonccox/vim-wayland-clipboard'

call plug#end()
