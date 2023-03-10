return require('packer').startup(function(use)
  use
  {
    'wbthomason/packer.nvim',
  }
  use 
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} },
  }
  use
  {
    'shaunsingh/nord.nvim',
  }
  use
  {
    'lewis6991/gitsigns.nvim',
  }
  use
  {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
  }
  use 
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use
  {
    'ThePrimeagen/harpoon',
    requires = { {'nvim-lua/plenary.nvim'} },

  }
  use
  {
    'mbbill/undotree',
  }
end)

