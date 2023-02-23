-- Packer
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Plugin manager
    use 'arcticicestudio/nord-vim' -- Theme
    use 'vim-airline/vim-airline' -- Statusbar
    use 'tpope/vim-commentary' -- Commenter
    use {
	'nvim-treesitter/nvim-treesitter',
	run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
	}
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
	}
    use {
        'windwp/nvim-autopairs',
        config = function()require('nvim-autopairs').setup {} end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        }
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/nvim-lsp-installer'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use 'lervag/vimtex'
end)

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules", "build", "dist", "yarn.lock"
		}
	}
})

require("nvim-tree").setup({
    hijack_cursor = true,
    view = {
        side = "right"
    },
    renderer = {
    highlight_git = true,
        icons = {
            git_placement = "before"
        }
    },
})

require'nvim-treesitter.configs'.setup {
-- Modules and its options go here
highlight = { enable = true },
incremental_selection = { enable = true },
textobjects = { enable = true }
}

