local M = {}

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

function M.lsp_keymaps(bufnr)
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
    keymap("n", "<leader>li", vim.cmd.LspInfo, opts())
    keymap("n", "<leader>lI", vim.cmd.Mason, opts())
    keymap("n", "<leader>la", vim.lsp.buf.code_action, opts())
    keymap("n", "<leader>lt", vim.lsp.buf.type_definition, opts("Type Denifinition"))
    keymap("n", "<leader>lj", function() vim.diagnostic.goto_next({ buffer = 0 }) end, opts())
    keymap("n", "<leader>lk", function() vim.diagnostic.goto_prev({ buffer = 0 }) end, opts())
    keymap("n", "<leader>lr", vim.lsp.buf.rename, opts())
    keymap("n", "<leader>ls", vim.lsp.buf.signature_help, opts())
    keymap("n", "<leader>lq", vim.diagnostic.setloclist, opts())
    keymap("n", "<leader>lf", vim.lsp.buf.format, opts())
end

return M
