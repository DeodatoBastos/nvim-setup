return {
    "numToStr/Comment.nvim",
    opts = function()
        require("Comment").setup({
            ignore = "^$", -- empty lines,
            toggler = {
                line = "<leader>/",
                block = "gb",
            },
            opleader = {
                line = "<leader>/",
                block = "gb",
            },
            -- mappings = false,
            mappings = {
                basic = false,
                extra = false,
            },
            padding = true,
            sticky = true,
            ---@diagnostic disable-next-line: assign-type-mismatch
            pre_hook = nil,
            ---@diagnostic disable-next-line: assign-type-mismatch
            post_hook = nil,
            extra = { above = "gcO", below = "gco", eol = "gcA" },
        })

        vim.g.skip_comment_default_keymaps = true

        local api = require("Comment.api")
        local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
        -- local config = require("Comment.config")

        local wk = require("which-key")
        local mappings = {
            { "<leader>/", api.toggle.linewise.current, desc = "Comment", mode = "n" },
            {
                "<leader>/",
                function()
                    vim.api.nvim_feedkeys(esc, "nx", false)
                    api.toggle.linewise(vim.fn.visualmode())
                end,
                desc = "Comment",
                mode = { "v" },
            },
            { "<C-;>", api.toggle.linewise.current, desc = "Comment", mode = "n" },
            {
                "<C-;>",
                function()
                    vim.api.nvim_feedkeys(esc, "nx", false)
                    api.toggle.linewise(vim.fn.visualmode())
                end,
                desc = "Comment",
                mode = { "v" },
            },
            { "gb", api.toggle.blockwise.current, desc = "Comment block", mode = "n" },
            {
                "gb",
                function()
                    vim.api.nvim_feedkeys(esc, "nx", false)
                    api.toggle.blockwise(vim.fn.visualmode())
                end,
                desc = "Comment block",
                mode = { "v" },
            },
            {
                "gc",
                group = "Comments",
                { "gcO", api.insert.linewise.above, desc = "Comment above", mode = { "n", "v" } },
                { "gco", api.insert.linewise.below, desc = "Comment below", mode = { "n", "v" } },
                { "gcA", api.insert.linewise.eol, desc = "Comment end of line", mode = { "n", "v" } },
            },
        }
        wk.add(mappings)
    end,
}
