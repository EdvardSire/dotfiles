require("plugins")
require("configs.mappings")
require("configs.settings")

require("configs.nvim-treesitter")
require("configs.nord")
require("configs.gitsigns")
require("configs.lualine")
require("configs.custom-lsp")
require("configs.telescope")

-- require('configs.lsp-zero')
require("lspconfig").clangd.setup({
  on_attach = function()
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
    vim.keymap.set("n", "gr", vim.lsp.buf.references)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
    vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action)

    vim.keymap.set("n", "gp", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "gn", vim.diagnostic.goto_next)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float)
     -- do stuff here....
  end
})

vim.cmd('highlight Normal guibg=none')
vim.cmd('highlight SignColumn guibg=none')
