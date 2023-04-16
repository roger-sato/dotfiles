local map = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '+', '<C-a>', ns)
map('n', '-', '<C-x>', ns)
map('n', 'j', 'gj', ns)
map('n', 'k', 'gk', ns)
map('n', '<C-j>', '5j', ns)
map('n', '<C-k>', '5k', ns)

map('v', 'j', 'gj', ns)
map('v', 'k', 'gk', ns)
map('v', '<C-j>', '5j', ns)
map('v', '<C-k>', '5k', ns)
