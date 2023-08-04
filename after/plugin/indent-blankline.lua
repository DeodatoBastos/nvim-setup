vim.opt.list = true
vim.opt.listchars:append "space:⋅"

local icons = require("settings.icons")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    options = {
        enabled = true,
        buftype_exclude = { "terminal", "nofile" },
        filetype_exclude = {
            "help",
            "startify",
            "dashboard",
            "lazy",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "text",
        },
        char = icons.ui.LineLeft,
        context_char = icons.ui.LineLeft,
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        use_treesitter = true,
        show_current_context = true,
    }
}
