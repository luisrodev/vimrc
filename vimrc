set nocompatible
set history=1000		" increase history size
set noswapfile			" don't create swapfiles
set nobackup			" don't create backups.
set mouse=a			" Enable mouse interaction.
set cursorline

" Enable filetype
filetype indent plugin on

set backspace=indent,eol,start

set undofile
set undodir=~/.vim/undodir

set encoding=utf-8
set autoindent			" autoindent always ON.

set fillchars+=vert:\┊
set laststatus=1		" always show statusbar
set wildmenu			" enable visual wildmenu

set number			" show line numbers
set relativenumber		" show numbers as relative by default
set showmatch			" highlight matching parentheses and brackets

set hidden

if (has('termguicolors'))
	set termguicolors
endif


call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'

call plug#end()

" Keyboard Shortcuts
let mapleader = ","

" ColorScheme
let base16colorspace=256	" Access colors present in 256 colorspace
colorscheme base16-default-dark
