local navic = require("nvim-navic")
local lualine = require("lualine")
local icons = require("utils.icons")
local window_width_limit = 100
local branch_icon = icons.git.Branch

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.o.columns > window_width_limit
    end,
}

local function env_cleanup(venv)
    if string.find(venv, "/") then
        local final_venv = venv
        for w in venv:gmatch("([^/]+)") do
            final_venv = w
        end
        venv = final_venv
    end
    return venv
end

local lsp = {
    function()
        local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
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
        -- vim.list_extend(buf_client_names, linters)
        --
        -- add linter
        -- local linters = require("lint").linters_by_ft[buf_ft]
        -- vim.list_extend(buf_client_names, linters)

        local unique_client_names = table.concat(buf_client_names, ", ")
        local language_servers = string.format("[%s]", unique_client_names)

        return language_servers
    end,
    color = { gui = "bold" },
    cond = conditions.hide_in_width,
}

local mode = {
    "mode",
    fmt = function(str)
        return str:sub(1, 1)
    end,
    icons_enabled = true,
}
local filename = {
    "filename",
    symbols = {
        modified = "[+]",      -- Text to show when the file is modified.
        readonly = "[-]",      -- Text to show when the file is non-modifiable or readonly.
        unnamed = "[No Name]", -- Text to show for unnamed buffers.
        newfile = "[New]",     -- Text to show for newly created file before first write
    },
}
local branch = {
    "branch",
    icon = branch_icon,
    color = { gui = "bold" },
}
local py_env = {
    function()
        if vim.bo.filetype == "python" then
            local venv = os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV")
            if venv then
                local icon = require("nvim-web-devicons")
                local py_icon, _ = icon.get_icon(".py")
                return string.format(" " .. py_icon .. " (%s)", env_cleanup(venv))
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
    icon = { align = "left" },
}

local progress = {
    "progress",
    fmt = function()
        return "%P/%L"
    end,
    color = {},
}

local get_filename = function()
    local name = vim.fn.expand("%:t")
    local extension = vim.fn.expand("%:e")
    local f = require("utils.functions")

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

local breadcrumbs = {
    function()
        local name = get_filename()
        local location = navic.get_location()
        local separator = require("utils.icons").ui.ChevronRight
        if not require("utils.functions").isempty(location) then
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

lualine.setup({
    options = {
        fmt = string.lower,
        component_separators = { left = "", right = "" },
        icons_enabled = true,
        disabled_filetypes = { "alpha", "lazy" },
        theme = "tokyonight",
    },
    extensions = {
        "toggleterm",
        "trouble",
        "nvim-tree",
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { filename },
        lualine_c = { branch, py_env },
        lualine_x = { diagnostics, lsp, spaces, filetype },
        lualine_y = { "location" },
        lualine_z = {}, -- progress
    },
    inactive_sections = {
        lualine_a = { mode },
        lualine_b = { filename },
        lualine_c = { branch, py_env },
        lualine_x = { diagnostics, lsp, spaces, filetype },
        lualine_y = { "location" },
        lualine_z = {}, -- progress
    },
    winbar = {
        lualine_c = { breadcrumbs },
    },
    inactive_winbar = {
        lualine_c = { breadcrumbs },
    },
    -- tabline = {
    -- lualine_a = { "tabs" },
    --     lualine_z = { { "datetime", style = "%d/%m" }, { "datetime", style = "%H:%M" } },
    -- },
})
