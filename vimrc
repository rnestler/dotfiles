set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'

Plugin 'phildawes/racer'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-scripts/errormarker.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'

Plugin 'kien/ctrlp.vim'

filetype plugin indent on

" syntastic config
let g:syntastic_aggregate_errors = 1

syntax enable
set bg=dark
set number

" indentation
set autoindent
set cindent
set cinoptions=g0N-s

" folding
set foldenable
set foldmethod=syntax
" toggle fold with <space>
nnoremap <space> za

set tabstop=4
set shiftwidth=4

" python config
autocmd FileType python set foldmethod=indent
autocmd FileType python set shiftwidth=4
autocmd FileType python set expandtab

" search config
set ignorecase
set smartcase
set incsearch
set hlsearch


" airline config
set laststatus=2
let g:airline_powerline_fonts = 1

set wildmode=longest,list,full

set completeopt=longest,menu,preview

cmap w!! %!sudo tee > /dev/null %
map <Leader>m :make run<CR>

" rust config
let $RUST_SRC_PATH="/home/roughl/proggen/projects/rust/src"
let g:racer_cmd = "/usr/bin/racer"
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo

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

