return {
    settings = {
        filetypes = { "json", "jsonc" },
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
    }
}
