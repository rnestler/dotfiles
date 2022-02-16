
" Enable true color
set termguicolors

let mapleader = ","

" search config
set ignorecase
set smartcase

" folding
set foldenable
set foldmethod=syntax
nnoremap <space> za

" Default indentation config
set tabstop=4 shiftwidth=4 expandtab

set number
set colorcolumn=81,101

""" PLUGINS
call plug#begin(stdpath('data') . '/plugged')

    Plug 'ishan9299/nvim-solarized-lua'
    Plug 'vim-airline/vim-airline'

    Plug 'tpope/vim-sleuth'

" Initialize plugin system
call plug#end()

colorscheme solarized

" airline config
let g:airline_powerline_fonts = 1
