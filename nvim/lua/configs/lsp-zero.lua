local lsp = require('lsp-zero').preset({
  suggest_lsp_servers = false,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = false,
  cmp_capabilities = false,
  manage_nvim_cmp = false,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    -- error = '',
    warn = '▲',
    -- warn = '',
    hint = '⚑',
    -- hint = '',
    info = ''
    -- info = ''
  }
})

-- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
