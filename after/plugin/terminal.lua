require("toggleterm").setup {
    size = 10,
    hide_numbers = true,
    open_mapping = [[<C-/>]],
    shade_filetypes = {},
    shade_terminals = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
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
}

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*toggleterm#*",
    callback = function()
        set_terminal_keymaps()
        vim.cmd.startinsert()
    end,
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local function opts(desc)
    return { desc = desc, noremap = true, silent = true }
end

vim.keymap.set("n", "<M-1>", ":ToggleTerm count=2 size=15 direction=horizontal<CR>", opts("Horizontal Terminal"))
vim.keymap.set("n", "<M-2>", ":ToggleTerm count=3 size=60 direction=vertical<CR>", opts("Vertical Terminal"))
vim.keymap.set("n", "<M-3>", ":ToggleTerm count=1 direction=float<CR>", opts("Float Terminal"))

vim.keymap.set("t", "<M-1>", function() vim.cmd.ToggleTerm() end, opts("Toggle Terminal"))
vim.keymap.set("t", "<M-2>", function() vim.cmd.ToggleTerm() end, opts("Toogle Terminal"))
vim.keymap.set("t", "<M-3>", function() vim.cmd.ToggleTerm() end, opts("Toogle Terminal"))

vim.keymap.set("n", "<leader>gg", "<CMD>lua _LAZYGIT_TOGGLE()<CR>")
