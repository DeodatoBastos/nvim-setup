local bufferline = require("bufferline")

bufferline.setup {
    options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.no_bold,
        close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
        indicator = {
            style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        separator_style = "slant",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        hover = {
            enabled = true,
            delay = 1,
            reveal = { "close" }
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true
            }
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true
    }
}

vim.keymap.set("n", "<leader>bn", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<leader>bb", vim.cmd.BufferLineCyclePrev)
vim.keymap.set("n", "<leader>bp", vim.cmd.BufferLinePick)
vim.keymap.set("n", "<leader>bpc", vim.cmd.BufferLinePickClose)
vim.keymap.set("n", "<leader>bcl", vim.cmd.BufferLineCloseLeft)
vim.keymap.set("n", "<leader>bco", vim.cmd.BufferLineCloseOthers)
vim.keymap.set("n", "<leader>bcr", vim.cmd.BufferLineCloseRight)
vim.keymap.set("n", "<leader>bs", vim.cmd.BufferLineSortByDirectory)
