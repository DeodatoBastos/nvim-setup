return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk"
        
        -- Change the default \l prefix to <leader>v
        vim.g.vimtex_mappings_prefix = "<leader>v"
    end,
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "tex",
            callback = function(ev)
                -- Indentation settings for LaTeX
                vim.bo[ev.buf].expandtab = true
                vim.bo[ev.buf].shiftwidth = 2
                vim.bo[ev.buf].tabstop = 2
                vim.bo[ev.buf].softtabstop = 2

                -- Prose settings (Wrap and Spellcheck)
                vim.wo.wrap = true
                vim.wo.linebreak = true
                vim.opt_local.spell = true
                vim.opt_local.spelllang = "en_us"

                -- Give nice names to the which-key registered by vimtex
                local ok, wk = pcall(require, "which-key")
                if ok then
                    wk.add({
                        { "<leader>v", group = "LaTeX", buffer = ev.buf },
                        { "<leader>va", desc = "Context Menu", buffer = ev.buf },
                        { "<leader>vc", desc = "Clean", buffer = ev.buf },
                        { "<leader>vC", desc = "Clean Full", buffer = ev.buf },
                        { "<leader>ve", desc = "Errors", buffer = ev.buf },
                        { "<leader>vg", desc = "Status", buffer = ev.buf },
                        { "<leader>vG", desc = "Status All", buffer = ev.buf },
                        { "<leader>vi", desc = "Info", buffer = ev.buf },
                        { "<leader>vI", desc = "Info Full", buffer = ev.buf },
                        { "<leader>vk", desc = "Stop", buffer = ev.buf },
                        { "<leader>vK", desc = "Stop All", buffer = ev.buf },
                        { "<leader>vl", desc = "Compile", buffer = ev.buf },
                        { "<leader>vL", desc = "Compile Selected", buffer = ev.buf },
                        { "<leader>vm", desc = "Imaps List", buffer = ev.buf },
                        { "<leader>vo", desc = "Compile Output", buffer = ev.buf },
                        { "<leader>vq", desc = "Log", buffer = ev.buf },
                        { "<leader>vs", desc = "Toggle Main", buffer = ev.buf },
                        { "<leader>vS", desc = "Compile SS", buffer = ev.buf },
                        { "<leader>vt", desc = "TOC Open", buffer = ev.buf },
                        { "<leader>vT", desc = "TOC Toggle", buffer = ev.buf },
                        { "<leader>vv", desc = "View PDF", buffer = ev.buf },
                        { "<leader>vx", desc = "Reload", buffer = ev.buf },
                        { "<leader>vX", desc = "Reload State", buffer = ev.buf },
                    })
                end
            end,
        })
    end,
}
