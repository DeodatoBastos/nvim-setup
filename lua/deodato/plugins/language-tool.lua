return {
    {
        "vigoux/LanguageTool.nvim",
        -- Configuration for global variables
        init = function()
            vim.g.languagetool_server_jar = "/usr/local/LanguageTool/languagetool-server.jar"
        end,
        -- Configuration for autocommands
        ft = { "markdown", "tex" },
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "markdown", "tex" },
                callback = function()
                    vim.cmd("LanguageToolSetUp")
                end,
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "LanguageToolCheckDone",
                callback = function()
                    -- We use pcall (protected call) to prevent the error if b:errors is still missing
                    pcall(vim.cmd, "LanguageToolSummary")
                end,
            })
        end,
    },
}
