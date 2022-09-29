-- Keybindings
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' ' -- Leader to spacebar

-- keymap({mode}, {keymap}, {mapped to}, {options})
keymap('n', '<leader>w', ':w<CR>', {})
keymap('n', '<leader>q', ':wq<CR>', {})
keymap('n', '<leader>f', ':NvimTreeToggle<CR>', {})
keymap('n', '<leader>g', ':Telescope find_files<CR>', {})
keymap('n', '<leader>m', ':!autopep8 -i %:t<CR>', {})



keymap('i', 'jk', '<ESC>', {}) -- Normal mode

-- Window movement
keymap('n', '<C-h>', '<C-w>h', {})
keymap('n', '<C-j>', '<C-w>j', {})
keymap('n', '<C-k>', '<C-w>k', {})
keymap('n', '<C-l>', '<C-w>l', {})
