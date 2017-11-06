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

Plugin 'Valloric/YouCompleteMe'

Plugin 'elzr/vim-json'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'easymotion/vim-easymotion'

Plugin 'kien/ctrlp.vim'

Plugin 'vim-scripts/Conque-GDB'

filetype plugin indent on

" syntastic config
let g:syntastic_aggregate_errors = 1

syntax enable
set bg=dark
colorscheme solarized
set number
set colorcolumn=81,101

" indentation
set autoindent

" folding
set foldenable
set foldmethod=syntax
" toggle fold with <space>
nnoremap <space> za

" Default indentation config
set tabstop=4 shiftwidth=4 expandtab

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

let mapleader = "ö"
map ü [
map ¨ ]

cmap w!! %!sudo tee > /dev/null %
map <Leader>m :make run<CR>

" YCM config
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = '/usr/bin/python2'
let g:ycm_rust_src_path = '/home/roughl/proggen/projects/rust/src'
nnoremap <leader>g :YcmCompleter GoTo<CR>

" rust config
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo

" Recognize .md files as Markdown instead of modula2
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Recognize .ino files as cpp
autocmd BufRead,BufNewFile *.ino set filetype=cpp

" Recognize .ipynb files as json
autocmd BufRead, BufNewFile *.ipynb set filetype=json

au BufRead /tmp/mutt-* set tw=72

set grepprg=grep\ -nH\ $*
let g:Tex_Flavor = 'latex'
let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf = 'latexmk -pdf $*'
let g:Tex_UseMakefile=1
let g:Tex_SmartKeyDot=0
let g:Tex_SmartKeyQuote=0

let g:EclimProjectTreeAutoOpen=1
let g:EclimProjectTreeExpandPathOnOpen=1
let g:EclimProjectTreeSharedInstance=1
let g:EclimProjectTreeActions =  [ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'} ]

