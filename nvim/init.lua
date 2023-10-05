require("plugins")
require("configs.mappings")
require("configs.settings")

require("configs.nvim-treesitter")
require("configs.nord")
require("configs.gitsigns")
require("configs.lualine")
require("configs.custom-lsp")
require("configs.telescope")

vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight SignColumn guibg=none")
vim.cmd("let g:mkdp_theme = 'light'")
