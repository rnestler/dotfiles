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

au BufRead /tmp/mutt-* set tw=72

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

