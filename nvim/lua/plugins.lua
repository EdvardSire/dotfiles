return require("packer").startup(function(use)
	use({
		"wbthomason/packer.nvim",
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"shaunsingh/nord.nvim",
	})
	use({
		"lewis6991/gitsigns.nvim",
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"mbbill/undotree",
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	use({
		"williamboman/mason.nvim",
	})
	use({
		"williamboman/mason-lspconfig.nvim",
	})
	use({
		"neovim/nvim-lspconfig",
	})
	use({
		"hrsh7th/nvim-cmp",
	})
	use({
		"hrsh7th/cmp-nvim-lsp",
	})
	use({
		"L3MON4D3/LuaSnip",
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"sbdchd/neoformat",
	})
	use({
		"windwp/nvim-ts-autotag",
	})
	use({
		"hrsh7th/cmp-nvim-lsp-signature-help",
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
	})
  use ({
    "romgrk/nvim-treesitter-context",
    requires = { "nvim-treesitter/nvim-treesitter" }, -- nvim-treesitter-context depends on nvim-treesitter
    config = function()
       local ctx = require "treesitter-context"
       ctx.setup {}
    end,
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
