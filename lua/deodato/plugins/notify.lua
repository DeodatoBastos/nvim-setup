return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        local icons = require("deodato.utils.icons").diagnostics

        notify.setup({
            stages = "fade",
            fps = 30,
            icons = {
                debug = icons.Debug,
                error = icons.BoldError,
                info = icons.BoldInformation,
                trace = icons.Trace,
                warn = icons.BoldWarning,
            },
            level = 2,
            minimum_width = 50,
            render = "default",
            timeout = 5000,
            top_down = true,
            max_width = 300,
            max_height = 300,
            background_colour = "NotifyBackground",
            on_close = function() end,
            on_open = function() end,
        })
        vim.notify = require("notify")
    end
}
