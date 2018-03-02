set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"My plugins
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'

" Language pack
Plugin 'sheerun/vim-polyglot'

Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'

" Asynchronous linting engine. YES
Plugin 'w0rp/ale'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'

" <leader>ww to select pane and repeat to swap
Plugin 'wesQ3/vim-windowswap'

Plugin 'Valloric/YouCompleteMe'

Plugin 'ternjs/tern_for_vim'

" Git wrapper. Still gotta learn how to use this
Plugin 'tpope/vim-fugitive'

call vundle#end()     
