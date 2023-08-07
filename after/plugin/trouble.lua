require("trouble").setup({
    use_diagnostic_signs = true,
    auto_close = true
})

vim.keymap.set("n", "<leader>to", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>tw", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>td", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<leader>tq", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<leader>tl", function() require("trouble").open("loclist") end)
vim.keymap.set("n", "<leader>tr", function() require("trouble").open("lsp_references") end)
vim.keymap.set("n", "<leader>tf", function() require("trouble").open("lsp_definitions") end)
