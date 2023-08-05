require("settings")

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

require("lazy").setup("plugins", {
    defaults = { lazy = true },
    install = { missing = true, colorscheme = { "tokyonight" } },
    checker = { enabled = true },
    ui = { wrap = "true" },
    change_detection = { enabled = true },
    debug = false,
    custom_keys = {
        -- open a terminal for the plugin dir
        ["<leader>t"] = function(plugin)
            require("lazy.util").float_term(nil, {
                cwd = plugin.dir,
            })
        end,
    },
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
