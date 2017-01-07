execute pathogen#infect()
filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized


"-----MY ADDITIONS------
set number relativenumber numberwidth=3 
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab smarttab
set nowrap 
"-----Removing | from vsplit bar
set fillchars+=vert:\  
let mapleader="\<space>"
let maplocalleader="\<space>"
nnoremap <leader>ev :vsplit ~/.dotfiles/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"-----Dependent on Surround.vim
nmap <leader>' ysiw'
nmap <leader>" ysiw"


" AutoCommands-------- {{{
"----Javascript/Java
augroup cstyle
    autocmd!
    autocmd FileType javascript,java nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript,java iabbrev <buffer> iff if()<left>
    autocmd FileType javascript iabbrev <buffer> func function()<left>
    autocmd FileType java iabbrev <buffer> psvm public static void main(String[] args){<esc>o
augroup END

"----Python
augroup py
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python iabbrev <buffer> iff if:<left>
    autocmd FileType python iabbrev <buffer> func def func():<left><left>
augroup END

"---VimScript
augroup vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}



