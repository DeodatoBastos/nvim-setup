local navic = require("nvim-navic")
local lualine = require("lualine")
local icons = require("settings.icons")
local window_width_limit = 100
local branch_icon = icons.git.Branch

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
        return vim.o.columns > window_width_limit
    end,
}

local lsp = {
    function()
        local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
        if #buf_clients == 0 then
            return "LSP Inactive"
        end

        -- local buf_ft = vim.bo.filetype
        local buf_client_names = {}

        -- add client
        for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" then
                table.insert(buf_client_names, client.name)
            end
        end

        -- add formatter
        -- local formatters = require "lvim.lsp.null-ls.formatters"
        -- local supported_formatters = formatters.list_registered(buf_ft)
        -- vim.list_extend(buf_client_names, supported_formatters)

        -- add linter
        -- local linters = require "lvim.lsp.null-ls.linters"
        -- local supported_linters = linters.list_registered(buf_ft)
        -- vim.list_extend(buf_client_names, supported_linters)

        local unique_client_names = table.concat(buf_client_names, ", ")
        local language_servers = string.format("[%s]", unique_client_names)

        return language_servers
    end,
    color = { gui = "bold" },
    cond = conditions.hide_in_width,
}

local mode = { "mode", fmt = function(str) return str:sub(1, 1) end, icons_enabled = true, }
local filename = {
    "filename",
    symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = '[New]',     -- Text to show for newly created file before first write
    }
}
local branch = {
    "branch",
    icon = branch_icon,
    color = { gui = "bold" }
}
local py_env = {
    function()
        local utils = require "lvim.core.lualine.utils"
        if vim.bo.filetype == "python" then
            local venv = os.getenv "CONDA_DEFAULT_ENV" or os.getenv "VIRTUAL_ENV"
            if venv then
                local icon = require "nvim-web-devicons"
                local py_icon, _ = icon.get_icon ".py"
                return string.format(" " .. py_icon .. " (%s)", utils.env_cleanup(venv))
            end
        end
        return ""
    end,
    color = { fg = "#98be65" },
    cond = conditions.hide_in_width,
}

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
        error = icons.diagnostics.BoldError .. " ",
        warn = icons.diagnostics.BoldWarning .. " ",
        info = icons.diagnostics.BoldInformation .. " ",
        hint = icons.diagnostics.BoldHint .. " ",
    },
}

local spaces = {
    function()
        local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
        return icons.ui.Tab .. " " .. shiftwidth
    end,
    padding = 1,
}

local filetype = {
    "filetype",
    colored = true,
    icon_only = false,
    icon = { align = "left" }
}

local progress = {
    "progress",
    fmt = function()
        return "%P/%L"
    end,
    color = {},
}

lualine.setup {
    options = {
        fmt = string.lower,
        component_separators = { left = "", right = "" },
        icons_enabled = true,
        disabled_filetypes = { "alpha" },
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { filename },
        lualine_c = { branch, py_env },
        lualine_x = { diagnostics, lsp, spaces, filetype },
        lualine_y = { "location" },
        lualine_z = { progress },
    },
    inactive_sections = {
        lualine_a = { mode },
        lualine_b = { filename },
        lualine_c = { branch, py_env },
        lualine_x = { diagnostics, lsp, spaces, filetype },
        lualine_y = { "location" },
        lualine_z = { progress },
    },
    winbar = {
        lualine_c = {
            {
                function()
                    return navic.get_location()
                end,
                cond = function()
                    return navic.is_available()
                end
            },
        }
    }
}
