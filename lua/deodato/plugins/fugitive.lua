return {
    "tpope/vim-fugitive",
    config = function()
        local whichkey = require("which-key")

        local gfugite = vim.api.nvim_create_augroup("gfugitive", {})
        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = gfugite,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local mappings = {
                    p = { "<cmd>Git push<cr>", "push" },
                    P = { "<cmd>Git pull --rebase<cr>", "pull" },
                    t = { "<cmd>Git push -u origin <cr>", "push untrack" },
                }

                whichkey.register(mappings, { prefix = "<leader>" })
            end,
        })
    end,
}
