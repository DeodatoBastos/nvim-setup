return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "moon", -- "strom", "night", "moon"
            transparent = true,
            on_colors = function(colors)
                colors.hint = colors.blue
                colors.info = colors.green
                colors.error = colors.red
                colors.warning = colors.orange
            end,
            sidebars = { "qf", "toggleterm", "NvimTree" },
            dim_inactive = true,
            lualine_bold = true,
        })

        vim.cmd.colorscheme("tokyonight")
    end,
}
