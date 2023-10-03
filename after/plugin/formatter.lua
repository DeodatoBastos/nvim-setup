local prettier_options = {
    exe = "prettier",
    args = {
        "--write",
        "--tab-width 4",
        "--quote-props as-consistent",
    },
}

require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {
            require("formatter.filetypes.lua").stylua,
        },

        javascript = {
            require("formatter.filetypes.javascript").prettier,

            function()
                return prettier_options
            end,
        },

        javascriptreact = {
            require("formatter.filetypes.javascript").prettier,

            function()
                return prettier_options
            end,
        },

        typescript = {
            require("formatter.filetypes.typescript").prettier,

            function()
                return prettier_options
            end,
        },

        typescriptreact = {
            require("formatter.filetypes.typescript").prettier,

            function()
                return prettier_options
            end,
        },

        cmake = {
            require("formatter.filetypes.cmake").cmakeformat,
        },

        cpp = {
            require("formatter.filetypes.cpp").clangformat,
        },

        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})
