return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", "kazhala/close-buffers.nvim" },
    config = function()
        local bufferline = require("bufferline")
        local icons = require("deodato.utils.icons")

        local function is_ft(b, ft)
            return vim.bo[b].filetype == ft
        end

        local function diagnostics_indicator(_, _, diagnostics, _)
            local result = {}
            local symbols = {
                error = icons.diagnostics.Error,
                warning = icons.diagnostics.Warning,
                info = icons.diagnostics.Information,
            }

            for name, count in pairs(diagnostics) do
                if symbols[name] and count > 0 then
                    table.insert(result, symbols[name] .. " " .. count)
                end
            end

            local result_str = table.concat(result, " ")
            return #result_str > 0 and result_str or ""
        end

        local function custom_filter(buf, buf_nums)
            local logs = vim.tbl_filter(function(b)
                return is_ft(b, "log")
            end, buf_nums or {})
            if vim.tbl_isempty(logs) then
                return true
            end
            local tab_num = vim.fn.tabpagenr()
            local last_tab = vim.fn.tabpagenr("$")
            local is_log = is_ft(buf, "log")
            if last_tab == 1 then
                return true
            end
            -- only show log buffers in secondary tabs
            return (tab_num == last_tab and is_log) or (tab_num ~= last_tab and not is_log)
        end

        bufferline.setup({
            options = {
                mode = "buffers",
                numbers = "none",
                style_preset = bufferline.style_preset.no_bold,
                close_command = "bdelete! %d",
                right_mouse_command = "vert sbuffer %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator = {
                    -- icon = icons.ui.BoldLineLeft,
                    style = "none",
                },
                buffer_close_icon = icons.ui.Close,
                modified_icon = icons.ui.Circle,
                close_icon = icons.ui.BoldClose,
                left_trunc_marker = icons.ui.ArrowCircleLeft,
                right_trunc_marker = icons.ui.ArrowCircleRight,
                separator_style = "thin",
                hover = {
                    enabled = true,
                    delay = 1,
                    reveal = { "close" },
                },
                diagnostics = "nvim_lsp",
                diagnostics_indicator = diagnostics_indicator,
                custom_filter = custom_filter,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "PanelHeading",
                        padding = 1,
                    },
                    {
                        filetype = "DiffviewFiles",
                        text = "Diff View",
                        highlight = "PanelHeading",
                        padding = 1,
                    },
                    {
                        filetype = "lazy",
                        text = "Lazy",
                        highlight = "PanelHeading",
                        padding = 1,
                    },
                },
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                persist_buffer_sort = true,
            },
        })

       vim.diagnostic.config { update_in_insert = true }

        require("close_buffers").setup({
            preserve_window_layout = { "this" },
            next_buffer_cmd = function(windows)
                require("bufferline").cycle(1)
                local bufnr = vim.api.nvim_get_current_buf()

                for _, window in ipairs(windows) do
                    vim.api.nvim_win_set_buf(window, bufnr)
                end
            end,
        })
    end,
}
