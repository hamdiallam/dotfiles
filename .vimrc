"Vundle plugins"
source ~/.vim/vundlePlugins.vim


filetype plugin indent on
syntax enable
set nocompatible

set term=screen-256color
"let g:neodark#use_custom_terminal_theme = 1
colorscheme neodark

"Leader  
let mapleader=","

"Show Quotes in Json files
set conceallevel=0

"More sane windows splits.
"Same way as my tmux conf
nnoremap <leader><Bar> :vsplit<cr>
nnoremap <leader>- :split<cr>

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

"remove vim status line
set noshowmode

"Use OSX clipboard
set clipboard=unnamed 

"Number bar
set number numberwidth=3 

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
set tabstop=2 shiftwidth=2 expandtab

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

"Airline buffer list at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#syntastic#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline_theme='bubblegum'
set laststatus=2
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"Configure systastic with ESLint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

"Ctrl-p settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Allow JSX in js files
let g:jsx_ext_required = 0

"Adding matching pairs
set matchpairs+=<:>

"Nerdtree
let NERDTreeShowHidden=1
let g:NerdTreeQuitOnOpen=0
let NERDTreeIgnore=['\.DS_Store', '\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
nnoremap <leader>ne :NERDTreeToggle<cr>

"Ctrlp delete buffer feature
call ctrlp_bdelete#init()

" AutoCommands-------- {{{ "---Javascript/Java
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
  
augroup END
" }}}

