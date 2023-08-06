require("mason").setup({
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
})
require("mason-lspconfig").setup {
    ensure_installed = require("settings.servers"),
    automatic_installation = true,
}
