local navic = require("nvim-navic")
local icons = require("deodato.utils.icons")
local branch_icon = icons.git.Branch
local window_width_limit = 100

local M = {}

M.conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.o.columns > window_width_limit
    end,
}

function M.env_cleanup(venv)
    if string.find(venv, "/") then
        local final_venv = venv
        for w in venv:gmatch("([^/]+)") do
            final_venv = w
        end
        venv = final_venv
    end
    return venv
end

M.lsp = {
    function()
        local clients = vim.lsp.get_clients()
        if #clients == 0 then
            return "LSP Inactive"
        end

        local buf_ft = vim.bo.filetype
        local buf_client_names = {}

        for _, client in ipairs(clients) do
            if client.name ~= "null-ls" then
                table.insert(buf_client_names, client.name)
            end
        end

        -- add formatter
        local formatters = require("formatter.util").get_available_formatters_for_ft(buf_ft)
        for _, formatter in ipairs(formatters) do
            table.insert(buf_client_names, formatter.exe)
        end

        -- add linter
        local linters = require("lint").get_running()
        -- local generic_linters = require("lint").linters_by_ft["*"]
        if #linters > 0 then
            vim.list_extend(buf_client_names, linters)
        end
        -- if generic_linters then
        --     vim.list_extend(buf_client_names, generic_linters)
        -- end

        local unique_buf_client_names = require("deodato.utils.functions").removeDuplicates(buf_client_names)
        local unique_client_names = table.concat(unique_buf_client_names, ", ")
        local language_servers = string.format("[%s]", unique_client_names)

        return language_servers
    end,
    color = { gui = "bold" },
    cond = M.conditions.hide_in_width,
}

M.mode = {
    "mode",
    fmt = function(str)
        return str:sub(1, 1)
    end,
    icons_enabled = true,
}

M.filename = {
    "filename",
    symbols = {
        modified = "[+]",      -- Text to show when the file is modified.
        readonly = "[-]",      -- Text to show when the file is non-modifiable or readonly.
        unnamed = "[No Name]", -- Text to show for unnamed buffers.
        newfile = "[New]",     -- Text to show for newly created file before first write
    },
}

M.branch = {
    "branch",
    icon = branch_icon,
    color = { gui = "bold" },
}

M.py_env = {
    function()
        if vim.bo.filetype == "python" then
            local venv = os.getenv("VIRTUAL_ENV")
            if venv then
                local icon = require("nvim-web-devicons")
                local py_icon, _ = icon.get_icon(".py")
                return string.format(" " .. py_icon .. " (%s)", M.env_cleanup(venv))
            end
        end
        return ""
    end,
    color = { fg = "#98be65" },
    cond = M.conditions.hide_in_width,
}

M.diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
        error = icons.diagnostics.BoldError .. " ",
        warn = icons.diagnostics.BoldWarning .. " ",
        info = icons.diagnostics.BoldInformation .. " ",
        hint = icons.diagnostics.BoldHint .. " ",
    },
}

M.spaces = {
    function()
        local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
        return icons.ui.Tab .. " " .. shiftwidth
    end,
    padding = 1,
}

M.filetype = {
    "filetype",
    colored = true,
    icon_only = false,
    icon = { align = "left" },
}

M.progress = {
    "progress",
    fmt = function()
        return "%P/%L"
    end,
    color = {},
}

function M.get_filename()
    local name = vim.fn.expand("%:t")
    local extension = vim.fn.expand("%:e")
    local f = require("deodato.utils.functions")

    if not f.isempty(name) then
        local file_icon, hl_group
        local devicons = require("nvim-web-devicons")
        file_icon, hl_group = devicons.get_icon(name, extension, { default = true })

        local navic_id = vim.api.nvim_get_hl_id_by_name("navic")
        local navic_text = vim.api.nvim_get_hl(navic_id, {})
        vim.api.nvim_set_hl(0, "Winbar", { fg = navic_text.foreground })

        return "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. name .. "%*"
    end
end

M.breadcrumbs = {
    function()
        local name = M.get_filename()
        local location = navic.get_location()
        local separator = require("deodato.utils.icons").ui.ChevronRight
        if not require("deodato.utils.functions").isempty(location) then
            name = name .. " " .. separator .. " " .. location
        end

        return name
    end,
    color_correction = "dynamic",
    navic_opts = nil,
    cond = function()
        return navic.is_available()
    end,
}

return M
