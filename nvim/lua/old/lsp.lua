-- LSP
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

-- C-e toggle completion
-- K display information
-- gd jump to definition
-- gD jump to decleration
-- di list all the implementations
-- go jump to the definition of the type
-- gr list all refrences
-- C-k display signature information
