local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- telescope config
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>g", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>wg", function()
  vim.cmd("Telescope grep_string search=" .. vim.fn.expand("<cword>"))
end, opts)
map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

-- vim-test
map("n", "<leader>tn", ":TestNearest<CR>", opts)
map("n", "<leader>tf", ":TestFile<CR>", opts)
map("n", "<leader>ta", ":TestSuite<CR>", opts)
map("n", "<leader>tt", ":TestLast<CR>", opts)
map("n", "<leader>tg", ":TestVisit<CR>", opts)
vim.g["test#strategy"] = "neovim"

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- LSP keybindings
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gD", function()
  vim.cmd("tab split")
  vim.lsp.buf.definition()
end, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "gI", function()
  vim.cmd("tab split")
  vim.lsp.buf.implementation()
end, opts)
map("n", "<space>rn", vim.lsp.buf.rename, opts)
map("n", "<space>f", vim.lsp.buf.code_action, opts)
map("n", "<space><space>", function()
  vim.lsp.buf.format { async = true }
end, opts)
