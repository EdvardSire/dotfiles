vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>n", ":noh<CR>")
vim.keymap.set("n", "<leader>p", ":E<CR>")
-- vim.keymap.set("n", "<leader>a", '"+y<CR>')

-- Window movement
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Telescope
vim.keymap.set("n", "<leader>fa", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")

vim.keymap.set("n", "<leader>m", ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set("n", "<leader>l", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set("n", "<leader>i", ':lua require("harpoon.ui").nav_prev()<CR>')
vim.keymap.set("n", "<leader>o", ':lua require("harpoon.ui").nav_next()<CR>')

-- Undotree
vim.keymap.set("n", "<leader>t", vim.cmd.UndotreeToggle)

-- Gitsigns
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>hh", ":Gitsigns next_hunk<CR>")
vim.keymap.set("n", "<leader>HH", ":Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk_inline<CR>")
vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")

-- LSP
-- vim.keymap.set('n', '<C-i>', vim.lsp.buf.completion)
--
