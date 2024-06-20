return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        "mrjones2014/nvim-ts-rainbow",
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "go",
                "bash",
                "c",
                "cpp",
                "lua",
                "json",
                "jsonc",
                "typescript",
                "python",
                "tsx",
                "r",
                -- "latex",
                "cmake",
                "make",
                -- "bibtex",
                "git_rebase",
                "sql",
                -- "ninja",
                "markdown",
                -- "verilog",
                "comment",
                "markdown_inline",
            },

            ignore_install = { "haskell" },
            modules = {},

            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            autotag = {
                enable = true,
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
            },
        })
    end,
}
