call plug#begin('~/.vim/bundle')

"My Plugs
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

" Marked 2 easy integration
Plug 'itspriddle/vim-marked'

" Language pack
Plug 'sheerun/vim-polyglot'
Plug 'derekwyatt/vim-scala'

" Go cli wrapper. similar to fugitive
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" Asynchronous linting engine. YES
Plug 'w0rp/ale'

"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'd11wtq/ctrlp_bdelete.vim'

" <leader>ww to select pane and repeat to swap
Plug 'wesQ3/vim-windowswap'

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py --gocode-completer --tern-completer' }

" Git wrapper. Still gotta learn how to use this
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()     
