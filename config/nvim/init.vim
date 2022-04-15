" Enable true color
set termguicolors

let mapleader = ","

" search config
set ignorecase
set smartcase

" folding
set foldenable
set foldmethod=syntax

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
    Plug 'slim-template/vim-slim'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Auto completion with cmp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/vim-vsnip'

    Plug 'simrat39/rust-tools.nvim'

    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'vim-test/vim-test'

" Initialize plugin system
call plug#end()

colorscheme solarized

" gitgutter config
let g:gitgutter_highlight_linenrs = 1

" airline config
let g:airline_powerline_fonts = 1

" telescope config
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>

" vim-test config
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tt :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

let test#strategy = "neovim"

" Auto completion config

set completeopt=menu,menuone,noselect

let g:nvim_tree_highlight_opened_files = 1

lua <<EOF
    -- Setup nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = {
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'path' },
            { name = 'vsnip' },
        }, {
            { name = 'buffer' },
        })
    })

    require('rust-tools').setup({})

    -- Python autocompletion with pylsp
    require('lspconfig').pylsp.setup({
      settings = {
          pylsp = {
              configurationSources = { "mypy", "black" },
              plugins = {
                  mypy = { enabled = true },
                  black = { enabled = true },
                  pycodestyle = { enabled = false },
              },
          },
      },
    })

    require'nvim-web-devicons'.setup {}
    require'nvim-tree'.setup {
        open_on_setup        = true,
        open_on_tab          = true,
    }
EOF

nnoremap <C-n> :NvimTreeToggle<CR>

nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
