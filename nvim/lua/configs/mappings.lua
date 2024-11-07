vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>n", ":noh<CR>")
vim.keymap.set("n", "<leader>p", ":E<CR>")
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python", "sh"}, 
  callback = function()
    vim.keymap.set("n", "<leader>r", function()
      local ft = vim.bo.filetype
      local file = vim.fn.expand('%')  -- Get the current file path
      if ft == "python" then
        vim.cmd("!python3 " .. file)
      elseif ft == "sh" then
        vim.cmd("!bash " .. file)
      end
    end)
  end
})
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

-- Undotree
vim.keymap.set("n", "<leader>t", vim.cmd.UndotreeToggle)

-- Gitsigns
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>hh", ":Gitsigns next_hunk<CR>")
vim.keymap.set("n", "<leader>HH", ":Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk_inline<CR>")
vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
