-- Call plug#begin and define plugins
vim.cmd [[
  call plug#begin(stdpath('data') . '/plugged')

  Plug 'ishan9299/nvim-solarized-lua'
  Plug 'vim-airline/vim-airline'

  " Handles indentation settings smartly. Also handles .editorconfig
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-commentary'

  " Git plugins
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

  Plug 'jose-elias-alvarez/typescript.nvim'
  Plug 'elixir-tools/elixir-tools.nvim'
  Plug 'simrat39/rust-tools.nvim'

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'

  Plug 'vim-test/vim-test'

  call plug#end()
]]

vim.cmd("colorscheme solarized")

-- Plugin specific globals
vim.g.gitgutter_highlight_linenrs = 1
vim.g.airline_powerline_fonts = 1

-- Telescope setup
require('telescope').setup {
  defaults = {
    layout_config = {
      vertical = { width = 0.9 },
      horizontal = { width = 0.9 }
    }
  }
}

-- nvim-cmp setup
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Elixir
require("elixir").setup({})

-- Rust
require('rust-tools').setup({})

-- Python (pylsp)
require('lspconfig').pylsp.setup {
  settings = {
    pylsp = {
      configurationSources = { "mypy", "black" },
      plugins = {
        mypy = { enabled = false, live_mode = false, dmypy = false, strict = true },
        pyls_mypy = { enabled = false, live_mode = false, dmypy = false, strict = true },
        black = { enabled = true },
        isort = { enabled = true },
        pylint = { enabled = false },
        pycodestyle = { enabled = false },
        flake8 = { enabled = false },
        ruff = { enabled = true, format = { "I" } },
      },
    },
  },
}

-- Ruby (solargraph)
require('lspconfig').solargraph.setup {}

-- JavaScript/TypeScript (eslint + typescript.nvim)
require('lspconfig').eslint.setup {
  on_attach = function(_, bufnr)
    vim.keymap.set('n', '<space><space>', function()
      vim.cmd('EslintFixAll')
    end, { buffer = bufnr })
  end,
}

require('typescript').setup {}

-- Icons
require('nvim-web-devicons').setup {}

-- NvimTree
require('nvim-tree').setup {
  open_on_tab = true,
  renderer = {
    highlight_opened_files = "name"
  }
}
