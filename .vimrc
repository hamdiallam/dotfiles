"Vundle plugins"
source ~/.vim/vundlePlugins.vim

filetype plugin indent on
syntax enable
set background=light
set nocompatible
colorscheme solarized

"Leader -> spacebar
let mapleader="\<space>"

"More sane windows splits.
"Same way as my tmux conf
nnoremap <C-b><Bar> :vsplit<cr>
nnoremap <C-b>- :split<cr>

"Use OSX clipboard
set clipboard=unnamed 

"Number bar
set number relativenumber numberwidth=3 

"Better autocompletion
set wildmenu

"Detect changes outside of vim
set autoread

"Show the title
set title

"Enable mouse
set ttyfast
set mouse=a 

"Highlight currrent line and show position in bar
set cursorline 
set ruler

"Tab Width always 4 spaces
set tabstop=4 shiftwidth=4 expandtab

"No wrapping, ignore case on search
set nowrap 
set ignorecase 

"Split windows more naturally
set splitright splitbelow


"Quick Edit/Source vimrc
nnoremap <silent> <leader>ev :vsplit ~/.dotfiles/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> 

"Create new Lines without Insert, small
"fixes are placed in the autocommands 
nnoremap <CR> o<Esc>

"Dependent on Surround.vim
nmap <leader>' ysiw'
nmap <leader>" ysiw"

"Autoresize to active split
set winwidth=95
set winheight=8
set winminheight=8
set winheight=999

"Window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Window resize with arrow key
nnoremap <silent> <right> :vertical resize +5<cr>
nnoremap <silent> <left>  :vertical resize -5<cr>
nnoremap <silent> <up>    :resize +5<cr>
nnoremap <silent> <down>  :resize -5<cr>

"Run the q macro
nnoremap <leader>q @q

"Adding matching pairs
set matchpairs+=<:>

"Nerdtree
let NERDTreeShowHidden=1
let g:NerdTreeQuitOnOpen=0

"Tmux 
let g:tmux_navigator_save_on_switch=2

" AutoCommands-------- {{{ "---Javascript/Java
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
augroup END

"---VimScript
augroup vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

"---General 
augroup general
  autocmd!
  "fix for <cr> new line mapping
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <CR> <CR>

  "Update dir for current buffer
  autocmd BufEnter * silent! cd %:p:h

  "Automatically reblance windows
  autocmd VimResized * :wincmd 
augroup END
" }}}



