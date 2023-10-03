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

    ensure_installed = require("utils.functions").concatTables(servers, formatters_linters),
})
require("mason-lspconfig").setup({
    automatic_installation = true,
})
