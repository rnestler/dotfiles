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

set wildmode=longest,list,full

set completeopt=longest,menu,preview

au BufRead /tmp/mutt-* set tw=72

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat='pdf'

let g:EclimProjectTreeAutoOpen=1
let g:EclimProjectTreeExpandPathOnOpen=1
let g:EclimProjectTreeSharedInstance=1
let g:EclimProjectTreeActions =  [ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'} ]

