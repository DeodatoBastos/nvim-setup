-- vim.api.nvim_create_autocmd({ "BufWritePost", "DiagnosticChanged" }, {
--     callback = function()
--         local function is_loclist_open()
--             for _, win in ipairs(vim.api.nvim_list_wins()) do
--                 if vim.fn.getloclist(vim.api.nvim_win_get_buf(win), { winid = 0 }).winid ~= 0 then
--                     return true
--                 end
--             end
--             return false
--         end

--         if is_loclist_open() then
--             vim.diagnostic.setloclist({ open = false })
--         end
--     end,
-- })

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        pcall(vim.keymap.del, "n", "gc")
        pcall(vim.keymap.del, "x", "gc")
        pcall(vim.keymap.del, "n", "gcc")
        pcall(vim.keymap.del, "x", "gcc")
        pcall(vim.keymap.del, "n", "gra")
        pcall(vim.keymap.del, "n", "grn")
        pcall(vim.keymap.del, "n", "gri")
        pcall(vim.keymap.del, "n", "grr")
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        local function is_loclist_open()
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                if vim.fn.getloclist(vim.api.nvim_win_get_buf(win), { winid = 0 }).winid ~= 0 then
                    return true
                end
            end
            return false
        end

        if is_loclist_open() then
            vim.diagnostic.setloclist({ open = false })
            vim.diagnostic.setqflist({ open = false })
        end
    end,
})

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
    pattern = { "gitcommit", "markdown", "text" },
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
        vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
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

vim.api.nvim_create_user_command("LTSetLang", function(opts)
    -- 1. Close current LanguageTool windows/buffers to prevent crashes
    vim.cmd("LanguageToolClear")

    -- 2. Update the language configuration
    vim.g.languagetool = { ["."] = { language = opts.args } }

    -- 3. Force the plugin to re-initialize
    vim.cmd("LanguageToolSetUp")
    print("LanguageTool switched to: " .. opts.args)
end, { nargs = 1 })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("OSC52Yank", { clear = true }),
    callback = function()
        -- Only trigger on explicit 'y' (yank). Ignore deletes ('d', 'x') and changes ('c').
        if vim.v.event.operator == "y" then
            -- Safely send the text to Kitty using Neovim's native headless-safe OSC 52 API
            require("vim.ui.clipboard.osc52").copy("+")(vim.v.event.regcontents)
        end
    end,
})
