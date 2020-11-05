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
set tabstop=2 shiftwidth=2 expandtab softtabstop=2   "tabs = 2 spaces

set fillchars+=vert:\┊
set laststatus=1		" always show statusbar
set wildmenu			" enable visual wildmenu

set number			" show line numbers
set relativenumber		" show numbers as relative by default
set showmatch			" highlight matching parentheses and brackets

set hidden

syntax on

if (has('termguicolors'))
	set termguicolors
endif


call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'preservim/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin' |
      \ Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-syntastic/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'

call plug#end()

" Keyboard Shortcuts
let mapleader = ","

" Switching buffers
map <C-N> :bnext<CR>
map <C-P> :bprev<CR>
imap <C-N> <Esc>:bnext<CR>i
imap <C-P> <Esc>:bprev<CR>i

" Move line to DOWM or UP
nmap n :m +1<CR>
nmap m :m -2<CR>

noremap <Leader>\t :botright vertical terminal<CR>

" End Keyboard Shortcuts

" ColorScheme
let base16colorspace=256	" Access colors present in 256 colorspace
colorscheme base16-default-dark
set background=dark
set colorcolumn=81		" Add the color to the column

" Plugin Configs

" NERDTree
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
"let NERDTreeShowHidden=1
let NERDTreeWinSize=35
let NERDTreeCaseSensitiveSort=1
let NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTree Git Plugin
let g:NERDTreeGitStatusEnable = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'~',
    \ 'Staged'    :'✚',
    \ 'Untracked' :'✭',
    \ 'Renamed'   :'➜',
    \ 'Unmerged'  :'═',
    \ 'Deleted'   :'✖',
    \ 'Dirty'     :'✗',
    \ 'Ignored'   :'☒',
    \ 'Clean'     :'✔︎',
    \ 'Unknown'   :'?',
    \ }

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
" Airline
let g:airline_powerline_fonts = 0	" Enables powerline fonts
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" GitGutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" Ctrlp
let g:ctrlp_map = '<Leader>,'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

nmap <Leader>; :CtrlP<CR>

" Javascript
let g:javascript_plugin_jsdoc = 1

let g:vim_jsx_pretty_colorful_config = 1

" Syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
