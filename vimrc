set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'

Plugin 'rust-lang/rust.vim'
Plugin 'vim-scripts/errormarker.vim'

Plugin 'mileszs/ack.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'scrooloose/syntastic'

Plugin 'tabnine/YouCompleteMe'

Plugin 'elzr/vim-json'

Plugin 'ElmCast/elm-vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'easymotion/vim-easymotion'

Plugin 'kien/ctrlp.vim'

" Ruby / Rails plugins

Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'

filetype plugin indent on

" syntastic config
let g:syntastic_aggregate_errors = 1

syntax enable
set bg=light
colorscheme solarized
set number
set colorcolumn=81,101
set tabpagemax=50

" indentation
set autoindent

" folding
set foldenable
set foldmethod=syntax
" toggle fold with <space>
nnoremap <space> za

" Default indentation config
set tabstop=4 shiftwidth=4 expandtab
set nojoinspaces

" python config
autocmd FileType python set foldmethod=indent sw=4 expandtab

" yaml config
autocmd FileType yaml set ts=2 sw=2 expandtab

" C / C++ config
autocmd FileType c,cpp set cindent cinoptions=g0N-s comments^=:///

" search config
set ignorecase
set smartcase
set incsearch
set hlsearch

hi SpellBad term=underline cterm=underline gui=undercurl guisp=Red

if executable('rg')
    let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" insert current filename without extension with \fn
inoremap \fn <C-R>=expand("%:t:r")<CR>

" airline config
set laststatus=2
let g:airline_powerline_fonts = 1

set wildmode=longest,list,full

set completeopt=longest,menu,preview

let mapleader = ","
map ü [
map ¨ ]

cmap w!! %!sudo tee > /dev/null %
map <Leader>m :make run<CR>

" YCM config
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoTo<CR>

" rust config
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
let g:rustfmt_autosave = 1

" Recognize .md files as Markdown instead of modula2
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Recognize .ino files as cpp
autocmd BufRead,BufNewFile *.ino set filetype=cpp

" Recognize .ipynb files as json
autocmd BufRead, BufNewFile *.ipynb set filetype=json

au BufRead /tmp/mutt-* set tw=72

" no swap files for gopass files
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

set grepprg=grep\ -nH\ $*
let g:Tex_Flavor = 'latex'
let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf = 'latexmk -pdf $*'
let g:Tex_UseMakefile=1
let g:Tex_SmartKeyDot=0
let g:Tex_SmartKeyQuote=0
