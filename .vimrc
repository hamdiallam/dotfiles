execute pathogen#infect()
filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized

"Leader -> spacebar
let mapleader="\<space>"
let maplocalleader="\<space>"

"Number bar
set number relativenumber numberwidth=3 

"Tab Width always 4 spaces
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab smarttab

"No wrapping, ignore case on search
set nowrap 
set ignorecase 

"Split windows more naturally
set splitright splitbelow

"Removing | from vsplit bar
set fillchars+=vert:\  

"Quick Edit/Source vimrc
nnoremap <leader>ev :vsplit ~/.dotfiles/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Create new Lines without Insert, small
"fixes are placed in the autocommands 
nnoremap <CR> o<Esc>

"Dependent on Surround.vim
nmap <leader>' ysiw'
nmap <leader>" ysiw"

"Autoresize to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

"Run the q macro
nnoremap <leader>q @q

"Adding matching pairs
set matchpairs+=<:>

"Window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" AutoCommands-------- {{{
"---Javascript/Java
augroup cstyle
    autocmd!
    autocmd FileType javascript,java nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript,java iabbrev <buffer> iff if()<left>
    autocmd FileType javascript iabbrev <buffer> func function()<left>
    autocmd FileType java iabbrev <buffer> psvm public static void main(String[] args){<esc>o
augroup END

"---Python
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

"---General 
augroup general
    autocmd!
    autocmd CmdwinEnter * nnoremap <CR> <CR>
    autocmd BufReadPost quickfix nnoremap <CR> <CR>
augroup END

" }}}



