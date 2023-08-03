local function custom_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "t", api.node.open.tab, opts("New Tab"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Folder"))
    vim.keymap.set("n", "l", api.node.open.no_window_picker, opts("Open"))
    vim.keymap.set("n", '?', api.tree.toggle_help, opts('Help'))
end

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    on_attach = custom_on_attach,
})


vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
