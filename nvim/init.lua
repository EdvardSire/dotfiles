require("plugins")
require("configs.settings")
require("configs.mappings")
require("configs.telescope")
require("configs.nord")
require("configs.gitsigns")
require("configs.lualine")
require("configs.nvim-treesitter")

require("configs.custom-lsp")

vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight SignColumn guibg=none")
vim.cmd("let g:mkdp_theme = 'light'")
