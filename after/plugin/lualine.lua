local navic = require("nvim-navic")
local lualine = require("lualine")

local function lsp_client_names()
    local client_names = {}
    for _, client in ipairs(vim.lsp.get_active_clients()) do
        table.insert(client_names, client.name)
    end
    if #client_names == 0 then
        return ""
    end

    return "[ " .. table.concat(client_names, ", ") .. " ]"
end

lualine.setup {
    options = { fmt = string.lower, component_separators = { left = ' ', right = ' '},},
    sections = {
        lualine_a = {
            { "mode", fmt = function(str) return str:sub(1, 1) end, icons_enabled = true, },
        },
        lualine_b = {
            {
                "filename",
                symbols = {
                    modified = '[+]',      -- Text to show when the file is modified.
                    readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]',     -- Text to show for newly created file before first write
                }
            }
        },
        lualine_c = { "branch", "python_env" },
        lualine_x = { lsp_client_names, {
            "filetype",
            colored = true,            -- Displays filetype icon in color if set to true
            icon_only = false,         -- Display only an icon for filetype
            icon = { align = "left" }, -- Display filetype icon on the right hand side
        }, },
        lualine_y = { "progress" },
        lualine_z = { "location" }
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
