" Installs vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins"
source ~/.vim/plugins.vim

" Ctrlp delete buffer feature
call ctrlp_bdelete#init()

filetype plugin indent on
set nocompatible

syntax enable
let g:neodark#use_custom_terminal_theme = 1
colorscheme neodark

" leader  
let mapleader=","

" update time to write to swap file
set updatetime=100

" maybe causing the slowdown?
set fillchars=diff:·

" more sane windows splits.
" same way as my tmux conf
nnoremap <leader><Bar> :vsplit<cr>
nnoremap <leader>- :split<cr>

" no backups/swaps. I'll take the risk 
set nobackup
set noswapfile

" remove vim status line
set noshowmode

" use OSX clipboard
set clipboard=unnamed 

" number bar
set number numberwidth=3 

" better autocompletion
set wildmenu

" detect changes outside of vim
set autoread

" show the title
set title

" enable mouse
set ttyfast
set mouse=a 

" do not close buffer when left. I'll manually close them
set hidden

" new way to close buffers. does not close the window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" paste mode for large bodies of text. I don't think I've ever used this but
" yeah
set pastetoggle=<F2>

" tab width always 4 spaces
set tabstop=4 shiftwidth=4 expandtab

" no wrapping
set nowrap 

" no highlighting and search incrementally
set ignorecase 
set incsearch

" split windows more naturally
set splitright splitbelow

" quick Edit/Source vimrc
nnoremap <silent> <leader>ev :vsplit ~/.dotfiles/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> 

" Create new Lines without Insert, small
" fixes are placed in the autocommands 
nnoremap <CR> o<Esc>

" window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" window resize with arrow key
nnoremap <silent> <right> :vertical resize +5<cr>
nnoremap <silent> <left>  :vertical resize -5<cr>
nnoremap <silent> <up>    :resize +5<cr>
nnoremap <silent> <down>  :resize -5<cr>

" buffer switching
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-x> :bdelete<CR>

" airline status line
set laststatus=2

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" airline buffer list at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Ctrl-p settings. enable saving the cache for large file directories
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/.git/*,*/.DS_Store
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|swp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" allow JSX in js files
let g:jsx_ext_required = 0

" Nerdtree
let NERDTreeShowHidden=1
let g:NerdTreeQuitOnOpen=0
let NERDTreeIgnore=['\.DS_Store', '\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
nnoremap <leader>ne :NERDTreeToggle<cr>

" AutoCommands

"---VimScript
augroup vim
  autocmd!
augroup END

"---General 
augroup general
  autocmd!
  "fix for <cr> new line mapping
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <CR> <CR>

  "Update dir for current buffer
  autocmd BufEnter * silent! cd %:p:h
  
augroup END
