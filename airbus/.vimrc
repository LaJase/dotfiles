set nocompatible
set showcmd
set expandtab
set number
"set ts=4 sw=4

set hlsearch
set ignorecase
set smartcase
set incsearch

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

" ---------------------- Custom Bindings --------------------------------------
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

" All config for NERD_tree
"let g:NERDTreeDirArrows = 0
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '~'
"let g:NERDTreeWinSize=42
"
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" try to not use NERD_tree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 40
let g:nertw_sort_sequence = '[\/]$,*'
let g:netrw_keepdir = 0

"Remap keys
map <C-n> :Vexplore<CR>
