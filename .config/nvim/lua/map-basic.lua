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
map('n', '<leader>\\', '<cmd>call VSCodeNotify("workbench.action.splitEditorLeft")<cr>', ns)
map('n', '<leader>¥', '<cmd>call VSCodeNotify("workbench.action.splitEditorLeft")<cr>', ns)
map('n', '<leader>-', '<cmd>call VSCodeNotify("workbench.action.splitEditorUp")<cr>', ns)
map('n', '<leader>h', '<cmd>call VSCodeNotify("workbench.action.focusLeftGroup")<cr>', ns)
map('n', '<leader>l', '<cmd>call VSCodeNotify("workbench.action.focusRightGroup")<cr>', ns)
map('n', '<leader>k', '<cmd>call VSCodeNotify("workbench.action.focusAboveGroup")<cr>', ns)
map('n', '<leader>j', '<cmd>call VSCodeNotify("workbench.action.focusBelowGroup")<cr>', ns)
map('n', '<leader>q', '<cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<cr>', ns)
map('n', '<leader>w', '<cmd>call VSCodeNotify("workbench.action.files.save")<cr>', ns)
map('n', '<leader>p', '<cmd>call VSCodeNotify("workbench.action.quickOpen")<cr>', ns)

map('v', 'j', 'gj', ns)
map('v', 'k', 'gk', ns)
map('v', '<C-j>', '5j', ns)
map('v', '<C-k>', '5k', ns)
map('v', 'q', '<esc>', ns)
