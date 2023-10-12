local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { import = "deodato.plugins" },
    { import = "deodato.plugins.lsp" },
    { import = "deodato.plugins.python" },
}

require("lazy").setup(plugins, {
    install = { colorscheme = { "tokyonight" } },
    ui = {
        border = "rounded",
        title = " Lazy Plugin Manager ",
    },
    debug = false,
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
