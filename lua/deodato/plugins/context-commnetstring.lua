return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
            -- Languages that have a single comment style
            languages = {
                typescript = {
                    __default = "// %s",
                    __multiline = "/* %s */",
                    tsx_element = "{/* %s */}",
                    tsx_fragment = "{/* %s */}",
                    tsx_attribute = "// %s",
                    comment = "// %s",
                },
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
        })
    end,
}
