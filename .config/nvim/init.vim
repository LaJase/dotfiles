"        _ _____  _____ 
"       | |  __ \|_   _|
"       | | |__| | | |  
"   _   | |  _  /  | |  
"  | |__| | | \ \ _| |_ 
"   \____/|_|  \_\_____|
"
" This is my neo vim config file. As always with vim, your config is
" better, but I like to use it this way.

" ---------------------------------------------------------
" nvim basic configuration
" ---------------------------------------------------------
set nocompatible
set encoding=utf-8
set t_Co=256
set nobackup
set noswapfile

set showcmd
set wildmenu
set completeopt=menu,menuone,preview
set clipboard=unnamedplus

set number
set relativenumber
set ruler

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set wrap
set autoindent
set smartindent
set hlsearch
set ignorecase
set smartcase
set incsearch
set cmdheight=2

" cursor motion 
set scrolloff=25
set backspace=indent,eol,start

syntax on
filetype plugin indent on
autocmd BufNew,BufNewFile,BufRead *.md setfiletype markdown

" ---------------------------------------------------------
" Basic remaps 
" ---------------------------------------------------------
nnoremap wo <C-w>o
nnoremap wc <C-w>c
nnoremap ws <C-w>s
nnoremap wv <C-w>v

nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l
map w<left> <C-w>h
map w<up> <C-w>k
map w<down> <C-w>j
map w<right> <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

nnoremap <leader><Space> :noh<CR>

" ---------------------------------------------------------
" Plugins manager
" ---------------------------------------------------------
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'ctrlpvim/ctrlp.vim'
    
    " Plugin pour code HTML/CSS 
    Plug 'mattn/emmet-vim' 
    Plug 'tpope/vim-surround'
    
    "Colorschemes
    Plug 'gruvbox-community/gruvbox'
    Plug 'joshdick/onedark.vim'
    
    "Display bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " Git plugin
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'

    " Icons (Nerd font support)
    Plug 'ryanoasis/vim-devicons'

    " close symbols
    Plug 'cohama/lexima.vim'
call plug#end()


" ---------------------------------------------------------
" Startify config. Add bookmarks for config files
" ---------------------------------------------------------
let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
            \ { 'type': 'files',     'header': ['   MRU']             },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()]  },
            \ ]

let g:startify_bookmarks = [ 
            \ '~/.config/nvim/init.vim' , 
            \ '~/.tmux.conf' , 
            \ '~/.bashrc' 
            \ ]
"
" ---------------------------------------------------------
"  Nerd tree configuration
" ---------------------------------------------------------
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusline='NERDTree'

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" ---------------------------------------------------------
"  Airline configuration 
" ---------------------------------------------------------
" Permet d' afficher les differents onglets
let g:airline#extensions#tabline#enabled = 1

nnoremap <C-A-right> :bn<CR>
nnoremap <C-A-left> :bp<CR>

" ---------------------------------------------------------
" Gruvbox config 
" ---------------------------------------------------------
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
set background=dark
colorscheme gruvbox


" ---------------------------------------------------------
" Nerd commenter config 
" ---------------------------------------------------------
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

" ---------------------------------------------------------
" Emmet config 
" ---------------------------------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_expandabbr_key = '<Tab><Tab>'
let g:user_emmet_mode='inv'
