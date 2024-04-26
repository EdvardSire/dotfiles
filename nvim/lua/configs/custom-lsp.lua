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



-- Mason
require("mason").setup()
local lspconfig = require('lspconfig')
local get_servers = require("mason-lspconfig").get_installed_servers
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server_name in ipairs(get_servers()) do
	lspconfig[server_name].setup({
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
	})
end

-- Language servers
lspconfig.clangd.setup({
		on_attach = lsp_attach,
})
