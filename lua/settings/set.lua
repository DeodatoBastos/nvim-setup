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
-- vim.opt.clipboard:append("unnamedplus")
-- vim.g.clipboard = {
--     name = "OSC 52",
--     copy = {
--         ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--         ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--     },
--     paste = {
--         ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--         ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--     },
-- }
-- vim.g.clipboard = {
--   name = 'kitty',
--   copy = {
--     ['+'] = 'kitty +kitten clipboard',
--     ['*'] = 'kitty +kitten clipboard',
--   },
--   paste = {
--     ['+'] = 'kitty +kitten clipboard --get-clipboard',
--     ['*'] = 'kitty +kitten clipboard --get-clipboard',
--   },
--   cache_enabled = 1,
-- }

vim.g.python3_host_prog = os.getenv("PYENV_ROOT") .. "/versions/nvim/bin/python"
vim.g.ruby_host_prog = vim.fn.expand("~") .. "/.local/share/gem/ruby/3.3.0/bin/neovim-ruby-host"

local perl5_dir = vim.fn.expand("~") .. "/perl5"
local perl5_lib = perl5_dir .. "/lib/perl5"
if not (vim.env.PERL5LIB or ""):find(perl5_lib, 1, true) then
    vim.env.PERL5LIB = vim.env.PERL5LIB and (perl5_lib .. ":" .. vim.env.PERL5LIB) or perl5_lib
end
if not (vim.env.PERL_LOCAL_LIB_ROOT or ""):find(perl5_dir, 1, true) then
    vim.env.PERL_LOCAL_LIB_ROOT = vim.env.PERL_LOCAL_LIB_ROOT and (perl5_dir .. ":" .. vim.env.PERL_LOCAL_LIB_ROOT)
        or perl5_dir
end
vim.env.PERL_MB_OPT = '--install_base "' .. perl5_dir .. '"'
vim.env.PERL_MM_OPT = "INSTALL_BASE=" .. perl5_dir

vim.opt.conceallevel = 2
vim.opt.concealcursor = "nvc"

-- vim.opt.spelllang = { "en_us", "fr" }
-- vim.opt.spelllang = { "en_us" }
-- vim.opt.spell = true

vim.opt.shell = "/bin/zsh"

vim.ui.open = function(url)
    vim.notify("Server environment: Cannot open " .. url, vim.log.levels.INFO)
end
