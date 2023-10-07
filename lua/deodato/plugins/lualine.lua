return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    config = function()
        local components = require("settings.components")

        require("lualine").setup({
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
                lualine_a = { components.mode },
                lualine_b = { components.filename },
                lualine_c = { components.branch, components.py_env },
                lualine_x = { components.diagnostics, components.lsp, components.spaces, components.filetype },
                lualine_y = { "location" },
                lualine_z = {}, -- progress
            },
            inactive_sections = {
                lualine_a = { components.mode },
                lualine_b = { components.filename },
                lualine_c = { components.branch, components.py_env },
                lualine_x = { components.diagnostics, components.lsp, components.spaces, components.filetype },
                lualine_y = { "location" },
                lualine_z = {}, -- progress
            },
            winbar = {
                lualine_c = { components.breadcrumbs },
            },
            inactive_winbar = {
                lualine_c = { components.breadcrumbs },
            },
            -- tabline = {
            -- lualine_a = { "tabs" },
            --     lualine_z = { { "datetime", style = "%d/%m" }, { "datetime", style = "%H:%M" } },
            -- },
        })
    end,
}
