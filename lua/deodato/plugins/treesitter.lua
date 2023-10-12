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
                "latex",
                "cmake",
                "make",
                "bibtex",
                "git_rebase",
                "sql",
                "ninja",
                "markdown",
                "verilog",
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

            context_commentstring = {
                enable = true,
                enable_autocmd = false,
                config = {
                    -- Languages that have a single comment style
                    typescript = "// %s",
                    css = "/* %s */",
                    scss = "/* %s */",
                    html = "<!-- %s -->",
                    svelte = "<!-- %s -->",
                    vue = "<!-- %s -->",
                    json = "",
                },
                indent = { enable = true, disable = { "yaml" } },
                autotag = { enable = true },
                textobjects = {
                    swap = {
                        enable = false,
                        -- swap_next = textobj_swap_keymaps,
                    },
                    -- move = textobj_move_keymaps,
                    select = {
                        enable = false,
                        -- keymaps = textobj_sel_keymaps,
                    },
                },
                textsubjects = {
                    enable = false,
                    keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
                },
                rainbow = {
                    enable = true,
                    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
                    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
                },
            },

            autotag = {
                enable = true,
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
            }
        })
    end,
}
