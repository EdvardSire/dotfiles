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


vim.cmd('highlight Normal guibg=none')
vim.cmd('highlight SignColumn guibg=none')
