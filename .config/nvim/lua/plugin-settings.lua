local map = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

-- [Settings]

-- <Easymotion>
vim.g.EasyMotion_smartcase = 1
map('n','<Leader><Leader>f','<Plug>(easymotion-bd-f)',ns)
map('n','<Leader><Leader>h','<Plug>(easymotion-linebackward)',ns)
map('n','<Leader><Leader>l','<Plug>(easymotion-lineforward)',ns)
map('n','<Leader><Leader>t','<Plug>(easymotion-bd-t)',ns)
map('n','<Leader><Leader>s','<Plug>(easymotion-bd-f2)',ns)
map('n','<Leader><Leader>/','<Plug>(easymotion-sn)',ns)
map('n','<Leader><Leader>l','<Plug>(easymotion-lineforward)',ns)
map('n','<Leader><Leader>j','<Plug>(easymotion-j)',ns)
map('n','<Leader><Leader>k','<Plug>(easymotion-k)',ns)

map('n','s','<Plug>(Sneak_s)',ns)
map('n','S','<Plug>(Sneak_S)',ns)

-- <Highlightedyank>
vim.g.highlightedyank_highlight_duration = 150