return {
    settings = {
        json = {
            filetypes = { "json", "jsonc" },
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        },
    }
}
