return {
    "rmagatti/goto-preview",
    config = function()
        require("goto-preview").setup({
            default_mappings = true,
        })
    end,
    dependencies = {
        "rmagatti/logger.nvim",
    },
}
