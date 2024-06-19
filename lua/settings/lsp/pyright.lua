return {
    -- root_dir = require("utils").get_python_root,
    settings = {
        pyright = {
            analysis = {
                typeCheckingMode = "strict",
                autoImportCompletions = true,
            },
            disableOrganizeImports = false,
            inlayHints = {
                variableTypes = true,
                functionReturnTypes = true,
            },
            include = {
                "src"
            },
            reportMissingImports = true,
        },
    },
}
