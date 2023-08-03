local navic = require("nvim-navic")
navic.setup {
    lsp = {
        auto_attach = true,
        preference = nil,
    },
    safe_output = true,
    highlight = true,
    separator = " > ",
    click = false,
}
