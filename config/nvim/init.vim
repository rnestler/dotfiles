
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

    " Handles indentation settings smartly. Also handles .editorconfig
    Plug 'tpope/vim-sleuth'

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    Plug 'tpope/vim-bundler'
    Plug 'tpope/vim-rails'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

" Initialize plugin system
call plug#end()

colorscheme solarized

" airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" telescope config
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
