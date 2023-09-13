return {
    -- root_dir = require("utils").get_python_root,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
            },
            disableOrganizeImports = false,
            inlayHints = {
                variableTypes = true,
                functionReturnTypes = true,
            },
        },
    },
}
