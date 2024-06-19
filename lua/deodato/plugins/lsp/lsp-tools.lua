return {
    {
        "folke/neodev.nvim",
        lazy = true,
        opts = {},
        config = function()
            require("neodev").setup({})
        end
    },
    {
        "onsails/lspkind.nvim",
        config = function()
            require("lspkind").init({})
        end
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-tree.lua",
        },
        config = function()
            require("lsp-file-operations").setup({ debug = false })
        end,
    },
    { "b0o/schemastore.nvim" },
}
