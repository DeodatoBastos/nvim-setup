vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
    callback = function()
        vim.fn.execute("nnoremap <silent> <buffer> q :close<CR>")
        vim.fn.execute("set nobuflisted")
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "dbui" },
    callback = function()
        vim.fn.execute("nmap <buffer> l <Plug>(DBUI_SelectLine)")
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
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

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "sql",
    },
    command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    command = "FormatWriteLock"
})
