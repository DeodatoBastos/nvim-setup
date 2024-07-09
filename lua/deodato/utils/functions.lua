local M = {}

---@param path string
function M.is_directory(path)
    local ok, _ = os.rename(path, path)
    return ok
end

---@param desc string
function M.opts(desc)
    return { desc = desc, noremap = true, silent = true }
end

---@param s string
function M.isempty(s)
    return s == nil or s == ""
end

function M.get_buf_option(opt)
    local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
    if not status_ok then
        return nil
    else
        return buf_option
    end
end

---@param bufnr integer
function M.lsp_keymaps(bufnr)
    ---@param desc string
    local function opts(desc)
        return { desc = desc, buffer = bufnr, noremap = true, silent = true }
    end
    local keymap = vim.keymap.set
    keymap("n", "gD", vim.lsp.buf.declaration, opts("Go to Declaration"))
    keymap("n", "gd", vim.lsp.buf.definition, opts("Go to Denifinition"))
    keymap("n", "K", vim.lsp.buf.hover, opts("Houver"))
    keymap("n", "gi", vim.lsp.buf.implementation, opts("Go to Implementation"))
    keymap("n", "gr", vim.lsp.buf.references, opts("Find references"))
    keymap("n", "gl", vim.diagnostic.open_float, opts("Open Float"))
    keymap("n", "<leader>li", vim.cmd.LspInfo, opts("Info"))
    keymap("n", "<leader>lI", vim.cmd.Mason, opts("Mason"))
    keymap("n", "<leader>la", vim.lsp.buf.code_action, opts("Code Action"))
    keymap("n", "<leader>lt", vim.lsp.buf.type_definition, opts("Type Denifinition"))
    keymap("n", "<leader>lj", function()
        vim.diagnostic.goto_next({ buffer = 0 })
    end, opts("Next diagnostic"))
    keymap("n", "<leader>lk", function()
        vim.diagnostic.goto_prev({ buffer = 0 })
    end, opts("Previous diagnostic"))
    keymap("n", "<leader>lr", vim.lsp.buf.rename, opts("Rename"))
    keymap("n", "<leader>lh", vim.lsp.buf.signature_help, opts("Signature Help"))
    keymap("n", "<leader>lq", vim.diagnostic.setloclist, opts("Quick fix"))
    keymap("n", "<leader>lF", vim.lsp.buf.format, opts("Format (LSP)"))
end

---@param a table
---@param b table
function M.concatTables(a, b)
    local result = {}

    for _, value in ipairs(a) do
        table.insert(result, value)
    end

    for _, value in ipairs(b) do
        table.insert(result, value)
    end

    return result
end

---@param a table
function M.removeDuplicates(a)
    local seen = {}
    local result = {}

    for _, value in ipairs(a) do
        if not seen[value] then
            table.insert(result, value)
            seen[value] = true
        end
    end

    return result
end

return M
