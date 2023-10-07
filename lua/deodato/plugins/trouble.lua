return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { ignore_missing = true },
    config = function()
        require("trouble").setup({
            use_diagnostic_signs = true,
            auto_close = true
        })
    end
}
