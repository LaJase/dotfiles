set nocompatible
set showcmd
syntax on
filetype plugin indent on

set number
set ruler
set mouse=a
set visualbell t_vb=
set encoding=utf-8

set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set nobackup

set hlsearch
set ignorecase
set smartcase
set incsearch
set cmdheight=1

" cursor motion 
set scrolloff=10
set backspace=indent,eol,start

" set cursorline

set t_Co=256

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'https://tpope.io/vim/fugitive.git'

" Plugin pour code HTML/CSS 
Plug 'mattn/emmet-vim' 
Plug 'https://tpope.io/vim/surround.git'
" Initialize plugin system
call plug#end()



" ---------------------------------------------------------
"  Nerd tree configuration
" ---------------------------------------------------------
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" ---------------------------------------------------------
"  Airline configuration configuration
" ---------------------------------------------------------
" Permet d' afficher les differents onglets
let g:airline#extensions#tabline#enabled = 1

nnoremap <C-A-right> :bn<CR>
nnoremap <C-A-left> :bp<CR>
