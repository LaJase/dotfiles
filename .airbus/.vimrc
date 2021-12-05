"        _ _____  _____ 
"       | |  __ \|_   _|
"       | | |__| | | |  
"   _   | |  _  /  | |  
"  | |__| | | \ \ _| |_ 
"   \____/|_|  \_\_____|
"
" All my daily aliases.


" Option to avoid vi compatibility... useless
set nocompatible

set showcmd            " Show successfuly executed commands
set wildmenu           " Enable menu used for completion of comands
set completeopt=menu,menuone,preview " Completion option
set clipboard=unnamed  " Clipboard used by system that default copy paste
set expandtab
set number

set hlsearch
set ignorecase
set smartcase
set incsearch
set scrolloff=15

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set mouse=a
set ruler
syntax on
filetype plugin indent on

" highlights current line when in insert mode
"autocmd InsertEnter,InsertLeave * set cul!
set directory^=${HOME}/.vim/swap/

highlight Search ctermbg=Magenta ctermfg=White

autocmd BufNew,BufNewFile,BufRead *.cst,*.typ setfiletype c 
autocmd BufNew,BufNewFile,BufRead *.md setfiletype markdown

"=============================================================================="
"Start plugins                                                              "
"=============================================================================="
" I use vim plug which is an old vim package manager but has the merits of
" being multithreaded for multiple installations which speeds up the setup
" process.
call plug#begin(expand('~/.local/share/nvim/plugged'))
    "Add or remove bundles here:
    "Syntax
    Plug 'scrooloose/nerdcommenter'
    Plug 'justinmk/vim-syntax-extra'
    Plug 'vim-scripts/ctags.vim'
    "Useful
    Plug 'mhinz/vim-startify'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-surround'
    Plug 'mbbill/undotree'
    "     Session saving
    Plug 'tpope/vim-obsession'
    "Colorschemes
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
    "Display bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Icons (Nerd font support)
    Plug 'ryanoasis/vim-devicons'
call plug#end()
"=============================================================================="
"End plugins                                                                "
"=============================================================================="


"=============================================================================="
"	Custom Mappings                                                             "
"=============================================================================="
" Search for string underneath cursor in directory
nnoremap <F4> :vimgrep /<C-R><C-W>/gj * <Bar> cw <CR>

" Search for string underneath cursor in custom directory
nnoremap <C-F4> :vimgrep /<C-R><C-W>/gj * <Bar> cw <C-Left><C-Left><C-Left>

" Open ctag definition in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Open ctag definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Creates a title comment, write yout comment section's title then put cursor
" on it and press <F7>
nnoremap <F7> <S-V>:center<CR>^i=<Space><ESC>$a<Space>=<ESC>0ver=<S-R>#<Space><ESC>$40a=<ESC>81<Bar>D

" -------- version
nnoremap <F8> <S-V>:center<CR>^i-<Space><ESC>$a<Space>-<ESC>0ver-<S-R>#<Space><ESC>$40a-<ESC>81<Bar>D
nnoremap <F9> <S-V>:center<CR>^i <Space><ESC>$a<Space>-<ESC>0ver <S-R>#<Space><ESC>$40a <ESC>81<Bar>D

" F5 function description
nnoremap <F5> :r!cat ${HOME}/.vim/ftplugin/function-comment-sh<CR><CR>5k<F7>

" F6 puts text in middle:
"                                    TEST
nnoremap <buffer> <F6> <S-V>:center<CR>0r#$40a<Space><ESC>81<Bar>Dr#

" If a variable is not surrounded with braces, place your cursor in the
" middle, and hit ,{.
" >
"       $TEST
"        ^
"       {TEST}
" <
nnoremap ,{ bi{<ESC>ea}<ESC>

" try to not use NERD_tree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 40
let g:nertw_sort_sequence = '[\/]$,*'
let g:netrw_keepdir = 0

"Remap keys
"map <C-f> :Vexplore<CR>

"=============================================================================="
"	Airline configuration
"=============================================================================="
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-A-left> :bp<CR>
nnoremap <C-A-right> :bn<CR>


"=============================================================================="
"	Completion settings                                                        "
"=============================================================================="
set wildmode=list:full
set wildignore=*.o,*.obj,*~
set wildignore+=*.git*
set wildignore+=*vim/backups*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


"=============================================================================="
"	Backup (Persistent undo) by file versioning                                "
"=============================================================================="
"		Setup backup dir
silent !mkdir ~/.vim/backups > /dev/null 2>&1
"		Setup undo dir
set undodir=~/.vim/backups
set undofile
set autowrite
"		Turn off swapfiles
set noswapfile
set nobackup
set nowb


if exists('+termguicolors')
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
endif
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
syntax on
"Transparency is a bit buggy with Airline
hi Normal guibg=NONE ctermbg=NONE
" hi NonText guibg=NONE ctermbg=none
"Defaults
set title              " Enable window title
