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
