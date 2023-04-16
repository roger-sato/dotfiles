vim.cmd('set clipboard+=unnamedplus')
vim.wo.number = true
vim.o.ignorecase = true
vim.wo.cursorline = true
vim.bo.smartindent = true
vim.bo.autoread = true
vim.o.hidden = true
vim.g.cursorline_timeout = 10
vim.cmd [[set sh=zsh]]
vim.cmd [[autocmd TermOpen * startinsert]]
vim.cmd [[command! -nargs=* T split | wincmd j | resize 20 | terminal <args>]]
vim.cmd [[set nospell]]
vim.cmd [[set showmatch]]
vim.cmd [[set matchtime=2]]
vim.cmd [[set mouse=n]]
