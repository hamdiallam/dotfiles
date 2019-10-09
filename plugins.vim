call plug#begin('~/.vim/bundle')

"My Plugs
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

" Go cli wrapper. similar to fugitive
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Language pack
Plug 'sheerun/vim-polyglot'
Plug 'derekwyatt/vim-scala'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" Asynchronous linting engine. YES
Plug 'w0rp/ale'

" <leader>ww to select pane and repeat to swap
Plug 'wesQ3/vim-windowswap'

" Git wrapper. Still gotta learn how to use this
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()     
