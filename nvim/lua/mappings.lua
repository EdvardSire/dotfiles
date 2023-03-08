-- Keybindings

vim.g.mapleader = ' ' -- Leader to spacebar

-- keymap({mode}, {keymap}, {mapped to}, {options})
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':wq<CR>')
vim.keymap.set('n', '<leader>g', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>m', ':!autopep8 -i %:t<CR>')
vim.keymap.set('n', '<leader>n', ':noh<CR>')
vim.keymap.set('n', '<leader>t', vim.cmd.UndotreeToggle)


vim.keymap.set('i', 'jk', '<ESC>') -- Normal mode

-- Window movement
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
