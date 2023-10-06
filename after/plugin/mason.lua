local servers = require("utils.servers")
local formatters_linters = require("utils.formatters_linters")

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

    ensure_installed = servers,
})
require("mason-lspconfig").setup({
    automatic_installation = true,
})

require("mason-tool-installer").setup({
    ensure_installed = formatters_linters
})
