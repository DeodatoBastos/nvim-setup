return {
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
        "DBUIRenameBuffer",
        "DBUILastQueryInfo",
        "DBUIHideNotifications",
    },
    init = function()
        vim.g.db_ui_show_help = 0
        vim.g.db_ui_win_position = "right"
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_use_nvim_notify = 1

        vim.g.db_ui_hide_schemas = { "pg_toast_temp.*" }
        vim.g.db_ui_save_location = "~/queries/"

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "sql",
            },
            command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
        })
    end,
    dependencies = {
        {
            "tpope/vim-dadbod",
            lazy = true,
        },
        {
            "kristijanhusak/vim-dadbod-completion",
            ft = { "sql", "mysql", "plsql" },
            lazy = true,
        },
    },
}
