local servers = require("utils.servers")
local formatters_linters = require("utils.formatters_linters")
local icons = require("utils.icons")

require("mason").setup({
    ui = {
        border = "none",
        icons = {
            package_installed = icons.ui.Check,
            package_pending = icons.ui.Circle,
            package_uninstalled = icons.ui.Close,
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
