require("lint").linters_by_ft = {
    python = { "flake8" },
    ["*"] = { "codespell" },
    -- javascript = {"eslint"},
    -- typescript = {"eslint"},
}

require("lint").linters.flake8.args = {
    "--max-line-length 120",
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
