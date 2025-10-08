--------------------------------------------------------------------------------
-- Settings
--------------------------------------------------------------------------------
-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- backup
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Other settings
vim.g.incsearch = true
vim.wo.wrap = false
vim.opt.scrolloff = 8
vim.opt.cursorline = false
vim.opt.guicursor = ''
vim.opt.laststatus = 0
vim.opt.termguicolors = true
vim.cmd('set cursorline cursorlineopt=number')


--------------------------------------------------------------------------------
-- Mappings
--------------------------------------------------------------------------------
vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>n", ":noh<CR>")
vim.keymap.set("n", "<leader>p", ":E<CR>")
vim.keymap.set('n', '<leader>d', ":put =strftime('%Y-%m-%d')<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python", "sh", "elixir", "go", "c", "rust"},
  callback = function()
    vim.keymap.set("n", "<leader>r", function()
      local filetype = vim.bo.filetype
      local file = vim.fn.expand('%')  -- Get the current file path
      if filetype == "python" then
        vim.cmd("!python3 " .. file)
      elseif filetype == "sh" then
        vim.cmd("!bash " .. file)
      elseif filetype == "elixir" then
        vim.cmd("!elixir " .. file)
      elseif filetype == "go" then
        vim.cmd("!go run " .. file)
      elseif filetype == "c" then
        local dir_next_to_sourcefile = vim.fn.expand('%:p:h') -- :h filename-modifiers
        local default_program_name = "program"
        vim.cmd("!make -C " .. dir_next_to_sourcefile)
        vim.cmd("!" ..dir_next_to_sourcefile .. "/" .. default_program_name)
      elseif filetype == "rust" then
        vim.cmd("!cargo run" )
      end
    end)
  end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local promt = "Create a conventional commit message with one succint line, then bullet points. This should be the last text, only in plaintext no markdown and straight to the point technical"
        local handle = io.popen('git diff --staged | q ' .. promt)
        local result = handle:read("*a")
        handle:close()

        local lines = {} -- split output into lines
        for line in result:gmatch("[^\r\n]+") do table.insert(lines, line) end

        vim.api.nvim_buf_set_lines(buf, 0, 0, false, lines)
        vim.api.nvim_win_set_cursor(0, {#lines + 1, 0})
    end,
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


--------------------------------------------------------------------------------
-- Telescope
--------------------------------------------------------------------------------
require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
	},
})


--------------------------------------------------------------------------------
-- Nord
--------------------------------------------------------------------------------
vim.opt.number = true
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_cursorline_transparent = false
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

require('nord').set()

vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight SignColumn guibg=none")


--------------------------------------------------------------------------------
-- Gitsigns
--------------------------------------------------------------------------------
require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 100,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    delay = 10,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>;<author_time:%Y-%m-%d>;<summary>',
  sign_priority = 0,
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
}


--------------------------------------------------------------------------------
-- Lualine
--------------------------------------------------------------------------------
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
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
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})


--------------------------------------------------------------------------------
-- Nvim-treesitter
--------------------------------------------------------------------------------
require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    -- ensure_installed = {
    --     "c", "cpp",
    --     "lua",
    --     "vim", "vimdoc",
    --     "go",
    --     "html", "javascript", "css",
    --     "make", "cmake",
    --     "python",
    --     "rust",
    --     "typescript", "tsx",
    --     "bash",
    --     "elixir", "eex", "heex",
    -- },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	--sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	--auto_install = false,

	-- List of parsers to ignore installing (for "all")
	--ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "yaml" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		--disable = function(lang, buf)
		-- local max_filesize = 100 * 1024 -- 100 KB
		--local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		--if ok and stats and stats.size > max_filesize then
		--return true
		--end
		--end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	-- Autotag
	autotag = {
		enable = true,
	},
})


--------------------------------------------------------------------------------
-- Custom-lsp
--------------------------------------------------------------------------------
-- Diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

local signs = {
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Completion
local cmp = require("cmp")
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-j>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	-- sources = cmp.config.sources({ { name = "nvim_lsp", name = "nvim_lsp_signature_help" } }),
	sources = cmp.config.sources({
        { name = 'path' },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
	}),
})

local lsp_attach = function(_, bufnr)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
	vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr })
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, { buffer = bufnr })
	vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = bufnr })
	vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { buffer = bufnr })

	vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, { buffer = bufnr })
	vim.keymap.set("n", "gn", vim.diagnostic.goto_next, { buffer = bufnr })
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr })
end


local servers = {
  "clangd",
  "pyright",
  "gopls",
  "html",
  "bashls",
  "cmake",
  "rust_analyzer",
  "nil_ls",
  "ts_ls",
  "lua_ls",
}

local lspconfig = require("lspconfig")
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = lsp_attach,
  })
end


--------------------------------------------------------------------------------
-- Misc
--------------------------------------------------------------------------------
 require("nvim-autopairs").setup({})
