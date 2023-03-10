-- Packer
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Plugin manager
  use 'arcticicestudio/nord-vim' -- Theme
  use 'tpope/vim-commentary' -- Commenter
  use 'lewis6991/gitsigns.nvim'
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
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'sindrets/diffview.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }
  use 'mbbill/undotree'
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


require('gitsigns').setup {
  signs = {
    add = { text = "" },
    change = { text = "" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "" },
    untracked = { text = "" },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{
      'diff',
      -- colored = true, -- Displays a colored diff status if set to true
      -- diff_color = {
          -- Same color values as the general color option can be used here.
          -- added   =  'DiffAdd', -- Changes the diff's added color
          -- modified = 'DiffChange', -- Changes the diff's modified color
          -- removed  = 'DiffDelete', -- Changes the diff's removed color you

      -- },
      -- symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
      -- source = { added = add_count, modified = modified_count, removed = removed_count }
    }},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- require('diffview').setup {
--   options = {
--     view = {
--       -- Configure the layout and behavior of different types of views.
--       -- Available layouts:
--       --  'diff1_plain'
--       --    |'diff2_horizontal'
--       --    |'diff2_vertical'
--       --    |'diff3_horizontal'
--       --    |'diff3_vertical'
--       --    |'diff3_mixed'
--       --    |'diff4_mixed'
--       -- For more info, see ':h diffview-config-view.x.layout'.
--       use_icons = true,
--       default = {
--         -- Config for changed files, and staged files in diff views.
--         layout = "diff2_horizontal",
--         winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
--       },
--     },
--   },
-- }

