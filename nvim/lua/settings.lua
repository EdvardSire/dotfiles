-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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
vim.opt.guicursor = ""
vim.opt.laststatus = 0


local colorscheme = 'nord'
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end
