set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'

Plugin 'phildawes/racer'
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'

filetype plugin indent on

let $RUST_SRC_PATH="/home/roughl/proggen/projects/rust/src"
let g:racer_cmd = "/usr/bin/racer"

syntax enable
set bg=dark
set number
set autoindent
set foldenable
set foldmethod=syntax
set cindent
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set incsearch

set hlsearch

set wildmode=longest,list,full

set completeopt=longest,menu,preview

cmap w!! %!sudo tee > /dev/null %

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

