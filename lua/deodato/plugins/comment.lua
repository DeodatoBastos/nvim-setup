return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            ignore = "^$", -- empty lines,
            mappings = {
                basic = false,
                extra = false,
            }
        })

        vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
        vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")
    end,
}
