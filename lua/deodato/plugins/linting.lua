return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            python = { "flake8" },
            -- go = { "golangcilint" },
            ["*"] = { "codespell" },
            -- javascript = {"eslint"},
            -- javascriptreact = {"eslint"},
            -- typescript = {"eslint"},
            -- typescriptreact = {"eslint"},
        }

        lint.linters.flake8.args = {
            "--max-line-length 120",
        }

        -- lint.linters.golangcilint.args = {

        -- }

        local lint_autogroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_autogroup,
            callback = function()
                require("lint").try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>ll", function()
            lint.try_lint()
        end, require("deodato.utils.functions").opts("Trigger linting"))
    end,
}
