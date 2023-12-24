return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        local whichkey = require("which-key")

        harpoon:setup()

        local mappings = {
            ["<C-1>"] = {
                function()
                    harpoon:list():select(1)
                end,
                "Select file 1",
            },
            ["<C-2>"] = {
                function()
                    harpoon:list():select(2)
                end,
                "Select file 2",
            },
            ["<C-3>"] = {
                function()
                    harpoon:list():select(3)
                end,
                "Select file 3",
            },
            ["<C-4>"] = {
                function()
                    harpoon:list():select(4)
                end,
                "Select file 4",
            },

            -- Toggle previous & next buffers stored within Harpoon list
            ["<C-p>"] = {
                function()
                    harpoon:list():prev()
                end,
                "Select previous file",
            },
            ["<C-n>"] = {
                function()
                    harpoon:list():next()
                end,
                "Select next file",
            },

            ["<C-e>"] = {
                function()
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                "Toogle UI",
            },
            ["<C-a>"] = {
                function()
                    harpoon:list():append()
                    vim.notify("File added to Harpoon")
                end,
                "Append current file to harpoon",
            },
            ["<C-q>"] = {
                function()
                    local name = vim.fn.expand("%")
                    local item = harpoon:list():get_by_display(name)
                    harpoon:list():remove(item)
                    vim.notify("File removed from Harpoon")
                end,
                "Remove current file from harpoon",
            },
        }

        whichkey.register(mappings, {})
        end,
}
