return {
    "RRethy/vim-illuminate",
    config = function()
        require("illuminate").configure({
            filetypes_denylist = {
                "dirvish",
                "dirbuf",
                "fugitive",
                "alpha",
                "NvimTree",
                "lazy",
                "neogitstatus",
                "Trouble",
                "lir",
                "Outline",
                "spectre_panel",
                "toggleterm",
                "DressingSelect",
                "TelescopePrompt",
            },
        })
    end,
}
