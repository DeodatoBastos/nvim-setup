local prettier_options = {
    exe = "prettier",
    args = {
        "--write",
        "--tab-width 4",
        "--quote-props consistent",
        "--print-width 120",
    },
}

local util = require("formatter.util")
local defaults = require("formatter.defaults")
local prettier = defaults.prettier

require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {
            require("formatter.filetypes.lua").stylua,

            function()
                return {
                    exe = "stylua",
                    args = {
                        "--search-parent-directories",
                        "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                        "--",
                        "-",
                    },
                    stdin = true,
                }
            end
        },

        javascript = {
            prettier,

            function()
                return prettier_options
            end,
        },

        javascriptreact = {
            prettier,

            function()
                return prettier_options
            end,
        },

        typescript = {
            prettier,

            function()
                return prettier_options
            end,
        },

        typescriptreact = {
            prettier,

            function()
                return prettier_options
            end,
        },

        cmake = {
            require("formatter.filetypes.cmake").cmakeformat,
        },

        cpp = {
            defaults.clangformat,
        },

        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})


vim.keymap.set({ "n" }, "<leader>lf", "<cmd>FormatWriteLock<cr>", require("utils.functions").opts("Format (formatter)"))

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     command = "FormatWriteLock",
-- })
