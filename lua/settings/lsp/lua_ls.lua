return {
    settings = {
        Lua = {
            format = {
                enable = true,
            },
            diagnostics = {
                globals = { "vim", "lvim", "reload" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                    require("neodev.config").types(),
                },
            },
            telemetry = {
                enable = false,
            },
            hint = {
                true,
            },
            runtime = {
                version = "LuaJIT",
                special = {
                    reload = "require",
                },
            },
        },
    },
}
