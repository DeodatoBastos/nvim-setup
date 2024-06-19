return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            ["*"] = { "codespell" },
            python = { "flake8", "pylint" },
            -- python = { "flake8" },
            -- javascript = {"eslint"},
            -- javascriptreact = {"eslint"},
            -- typescript = {"eslint"},
            -- typescriptreact = {"eslint"},
        }

        lint.linters.flake8.args = {
            "--max-line-length 120",
        }

        lint.linters.pylint.args = {
            "--max-line-length=120",
            "--docstring-min-length=15",
            "--disable=C0114",
        }
        lint.linters.pylint.cwd = "./src/"

        local lint_autogroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
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
