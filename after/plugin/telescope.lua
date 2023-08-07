local icons = require("utils.icons")
local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = icons.ui.Forward .. " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = nil,
        layout_strategy = nil,
        layout_config = {},
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
        },
        file_ignore_patterns = { ".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
        path_display = { "smart" },
        winblend = 0,
        border = {},
        borderchars = nil,
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            only_sort_text = true,
        },
        grep_string = {
            only_sort_text = true,
        },
        buffers = {
            initial_mode = "normal",
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer,
                },
                n = {
                    ["dd"] = actions.delete_buffer,
                },
            },
        },
        planets = {
            show_pluto = true,
            show_moon = true,
        },
        git_files = {
            hidden = true,
            show_untracked = true,
        },
        colorscheme = {
            enable_preview = true,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
