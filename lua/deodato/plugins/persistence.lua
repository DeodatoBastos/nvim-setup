return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
        require("persistence").setup({
            dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
            options = { "buffers", "curdir", "tabpages", "winsize" },
        })
    end,
}
