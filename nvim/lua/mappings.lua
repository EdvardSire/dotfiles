vim.g.mapleader = ' '

vim.keymap.set('i', 'jk', '<ESC>') -- Normal mode

-- Leader mappings
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>n', ':noh<CR>')
vim.keymap.set('n', '<leader>p', ':E<CR>')

--vim.keymap.set('n', '<leader>g', ':NvimTreeToggle<CR>')
--vim.keymap.set('n', '<leader>t', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>fa', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>ff', ':Telescope git_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')


-- Window movement
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
