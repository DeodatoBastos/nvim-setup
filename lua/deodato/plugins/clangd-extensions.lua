return {
    "p00f/clangd_extensions.nvim",
    require("clangd_extensions").setup({
        extensions = {
            autoSetHints = true,
            hover_with_actions = true,
            inlay_hints = {
                only_current_line = false,
                only_current_line_autocmd = "CursorHold",
                show_parameter_hints = true,
                parameter_hints_prefix = "<- ",
                other_hints_prefix = "=> ",
                max_len_align = false,
                max_len_align_padding = 1,
                right_align = false,
                right_align_padding = 7,
                highlight = "Comment",
                priority = 100,
            },
            ast = {
                role_icons = {
                    type = "",
                    declaration = "",
                    expression = "",
                    specifier = "",
                    statement = "",
                    ["template argument"] = "",
                },
                kind_icons = {
                    Compound = "",
                    Recovery = "",
                    TranslationUnit = "",
                    PackExpansion = "",
                    TemplateTypeParm = "",
                    TemplateTemplateParm = "",
                    TemplateParamObject = "",
                    ExprWithCleanups = "",
                    CXXConstruct = "",
                },

                highlights = {
                    detail = "Comment",
                },
                memory_usage = {
                    border = "rounded",
                },
                symbol_info = {
                    border = "rounded",
                },
            },
        },
    })
}
