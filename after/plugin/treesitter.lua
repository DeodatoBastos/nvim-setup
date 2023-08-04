require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "bash", "c", "cpp", "lua", "javascript",
        "json", "typescript", "python", "tsx",
        "r", "latex", "cmake", "make", "bibtex",
        "git_rebase", "sql", "ninja", "markdown",
        "verilog", "comment",
    },

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
        indent = { enable = true, disable = { "yaml", "python" } },
        autotag = { enable = false },
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
}
