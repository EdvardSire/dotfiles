require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {}
})

local cmp = require('cmp')
cmp.setup( {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-j>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({{ name = 'nvim_lsp' }})
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(_, _) -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v1.x/doc/md/lsp.md#you-might-not-need-lsp-zero
  -- Create your keybindings here...
  vim.keymap.set('n', 'gd',    vim.lsp.buf.definition)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
  vim.keymap.set('n', '<C->', vim.lsp.buf.completion)
end

local lspconfig = require('lspconfig')
local get_servers = require('mason-lspconfig').get_installed_servers

for _, server_name in ipairs(get_servers()) do
  lspconfig[server_name].setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    settings = {
      Lua = {
        diagnostics = {globals = {'vim'}}
      }
    }
  })
end
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = true,
})

local signs = {
    Error = " ",
    Warning = " ",
    Hint = " ",
    Information = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
