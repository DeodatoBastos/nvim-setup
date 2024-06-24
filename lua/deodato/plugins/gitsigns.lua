return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local icons = require("deodato.utils.icons")

        require("gitsigns").setup({
            signs = {
                add = {
                    text = icons.ui.BoldLineLeft,
                },
                change = {
                    text = icons.ui.BoldLineLeft,
                },
                delete = {
                    text = icons.ui.Triangle,
                },
                topdelete = {
                    text = icons.ui.Triangle,
                },
                changedelete = {
                    text = icons.ui.BoldLineLeft,
                },
            },
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 200,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            update_debounce = 200,
            max_file_length = 40000,
            preview_config = {
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        })
    end,
}
