return {
    "MagicDuck/grug-far.nvim",
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
        -- optional setup call to override plugin options
        -- alternatively you can set options with vim.g.grug_far = { ... }
        require("grug-far").setup({
            prefills = {
                search = vim.fn.expand("<cword>"),
                paths = vim.fn.expand("%"),
            },
            transient = true,
        })
    end,
}
