local navic = require("nvim-navic")
local all_icons = require("utils.icons")
local icons = all_icons.kind
local separator = all_icons.ui.ChevronRight

navic.setup {
    winbar_filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "lazy",
        "neo-tree",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "alpha",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "DressingSelect",
        "Jaq",
        "harpoon",
        "dap-repl",
        "dap-terminal",
        "dapui_console",
        "dapui_hover",
        "lab",
        "notify",
        "noice",
        "neotest-summary",
        "",
    },
    lsp = {
        auto_attach = true,
        preference = nil,
    },
    safe_output = true,
    highlight = true,
    separator = " " .. separator .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    click = false,
    lazy_update_context = true,
    icons = {
        Array = icons.Array .. " ",
        Boolean = icons.Boolean .. " ",
        Class = icons.Class .. " ",
        Color = icons.Color .. " ",
        Constant = icons.Constant .. " ",
        Constructor = icons.Constructor .. " ",
        Enum = icons.Enum .. " ",
        EnumMember = icons.EnumMember .. " ",
        Event = icons.Event .. " ",
        Field = icons.Field .. " ",
        File = icons.File .. " ",
        Folder = icons.Folder .. " ",
        Function = icons.Function .. " ",
        Interface = icons.Interface .. " ",
        Key = icons.Key .. " ",
        Keyword = icons.Keyword .. " ",
        Method = icons.Method .. " ",
        Module = icons.Module .. " ",
        Namespace = icons.Namespace .. " ",
        Null = icons.Null .. " ",
        Number = icons.Number .. " ",
        Object = icons.Object .. " ",
        Operator = icons.Operator .. " ",
        Package = icons.Package .. " ",
        Property = icons.Property .. " ",
        Reference = icons.Reference .. " ",
        Snippet = icons.Snippet .. " ",
        String = icons.String .. " ",
        Struct = icons.Struct .. " ",
        Text = icons.Text .. " ",
        TypeParameter = icons.TypeParameter .. " ",
        Unit = icons.Unit .. " ",
        Value = icons.Value .. " ",
        Variable = icons.Variable .. " ",
    },
}
