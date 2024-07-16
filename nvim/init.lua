local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
