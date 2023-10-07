return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            ignore = "^$",
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })

        require("ts_context_commentstring").setup({})

        vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
        vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")
    end,
}
