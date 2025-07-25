vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.showmode = false
vim.opt.mousemoveevent = true
vim.opt.cursorline = true
vim.opt.updatetime = 50
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.hidden = true
vim.opt.clipboard:append("unnamedplus")

vim.g.python3_host_prog = os.getenv("PYENV_ROOT") .. "/versions/nvim/bin/python"
