local lsp = require('lsp-zero').preset({
  suggest_lsp_servers = false,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    -- error = '✘',
    error = '',
    -- warn = '▲',
    warn = '',
    -- hint = '⚑',
    hint = '',
    -- info = ''
    info = ''
  }
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
