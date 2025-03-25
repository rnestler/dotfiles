-- Enable true color
vim.opt.termguicolors = true

-- search config
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- folding
vim.opt.foldenable = true
vim.opt.foldmethod = "syntax"

-- Default indentation config
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.colorcolumn = "81,101"

vim.g.mapleader = ","


vim.opt.completeopt = { "menu", "menuone", "noselect" }
