return {
    "akinsho/toggleterm.nvim",
    version = "*",
    init = function()
        require("settings.terminal").init()
    end,
    event = "VeryLazy",
    config = function()
        require("toggleterm").setup({
            size = 10,
            hide_numbers = true,
            open_mapping = [[<C-/>]],
            shade_filetypes = {},
            shade_terminals = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            persist_mode = false,
            auto_scroll = false,
            shading_factor = 1,
            direction = "float",
            close_on_exit = true,
            start_in_insert = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
        end

        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*toggleterm#*",
            callback = function()
                set_terminal_keymaps()
                vim.cmd.startinsert()
            end,
        })
    end,
}
