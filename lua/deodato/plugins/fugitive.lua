return {
    "tpope/vim-fugitive",
    config = function()
        local wk = require("which-key")

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
                    { "<leader>g", group = "Git",
                        { "<leader>gp", "<cmd>Git push<cr>", desc = "push" },
                        { "<leader>gp", "<cmd>Git pull --rebase<cr>", desc = "pull" },
                        { "<leader>gp", "<cmd>Git push -u origin <cr>", desc = "push untrack" },
                    },
                }

                wk.add(mappings)
            end,
        })
    end,
}
