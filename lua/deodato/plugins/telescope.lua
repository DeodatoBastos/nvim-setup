return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "ahmedkhalf/project.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            "cmake -S. -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
    },
    config = function()
        local icons = require("deodato.utils.icons")
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
                file_ignore_patterns = { ".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4",
                    "%.zip" },
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
                    mappings = {
                        n = {
                            ["m"] = function(prompt_bufnr)
                                local selection = require("telescope.actions.state").get_selected_entry()
                                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                                require("telescope.actions").close(prompt_bufnr)
                                -- Depending on what you want put `cd`, `lcd`, `tcd`
                                vim.cmd(string.format("silent m %s", dir))
                            end
                        }
                    }
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
                },
            }
        }

        require("project_nvim").setup({
            detection_methods = { "pattern" },
            patterns = { ".git", "Makefile", "package.json", "requirements.txt" },
        })
        require('telescope').load_extension('fzf')
        require("telescope").load_extension("noice")
        require("telescope").load_extension("projects")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Grep String" })
    end,
}
