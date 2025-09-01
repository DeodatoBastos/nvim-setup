return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    init = function()
        local f = require("deodato.utils.functions")
        local dir = vim.fn.getcwd()
        local src_dir = dir .. "/src"
        if f.is_directory(src_dir) then
            require("lint").linters.pylint.cwd = src_dir
            require("lint").linters.flake8.cwd = src_dir
        else
            require("lint").linters.pylint.cwd = dir
            require("lint").linters.flake8.cwd = dir
        end
    end,

    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            ["*"] = { "codespell" },
            python = { "flake8", "pylint" },
            bash = { "shellcheck" },
            zsh = { "shellcheck" },

            -- javascript = {"eslint"},
            -- javascriptreact = {"eslint"},
            -- typescript = {"eslint"},
            -- typescriptreact = {"eslint"},
        }

        lint.linters.flake8.cmd = "python"
        lint.linters.flake8.args = {
            "-m",
            "flake8",
            "--max-line-length 120",
            "--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s",
            "--no-show-source",
            "--stdin-display-name",
            function()
                return vim.api.nvim_buf_get_name(0)
            end,
            "-",
        }

        lint.linters.pylint.cmd = "python"
        lint.linters.pylint.args = {
            "-m",
            "pylint",
            "-f",
            "json",
            "--max-line-length=120",
            "--docstring-min-length=15",
            "--disable=C0114",
        }

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
