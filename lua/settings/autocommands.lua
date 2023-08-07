vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
    callback = function()
        vim.fn.execute("nnoremap <silent> <buffer> q :close<CR>")
        vim.fn.execute("set nobuflisted")
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Automatically close tab/vim when nvim-tree is the last window in the tab
local function autoclose_nvim_tree()
    if vim.fn.winnr('$') == 1 and vim.fn.bufname() == "NvimTree_" .. vim.fn.tabpagenr() then
        vim.cmd.quit()
    end
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    false,
    callback = function()
        autoclose_nvim_tree()
    end

})

vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        vim.fn.execute("tabdo wincmd =")
    end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.java" },
    callback = function()
        vim.lsp.codelens.refresh()
    end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        vim.fn.execute("hi link illuminatedWord LspReferenceText")
    end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        local line_count = vim.api.nvim_buf_line_count(0)
        if line_count >= 5000 then
            vim.cmd.IlluminatePauseBuf()
        end
    end,
})
