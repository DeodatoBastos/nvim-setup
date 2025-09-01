return {
    -- root_dir = require("utils").get_python_root,
    settings = {
        pyright = {
            analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                diagnosticMode = "openFilesOnly", -- workspace
            },
            disableOrganizeImports = false,
            inlayHints = {
                variableTypes = true,
                functionReturnTypes = true,
            },
            include = {
                "src",
            },
            reportMissingImports = true,
        },
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                diagnosticMode = "openFilesOnly", -- workspace
            },
            disableOrganizeImports = false,
            inlayHints = {
                variableTypes = true,
                functionReturnTypes = true,
            },
            include = {
                "src",
            },
            reportMissingImports = true,
        },
    },
}
