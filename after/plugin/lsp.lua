local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities()

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "gD", vim.lsp.buf.declaration(), opts)
    keymap(bufnr, "n", "gd", vim.lsp.buf.definition(), opts)
    keymap(bufnr, "n", "K", vim.lsp.buf.hover(), opts)
    keymap(bufnr, "n", "gi", vim.lsp.buf.implementation(), opts)
    keymap(bufnr, "n", "gr", vim.lsp.buf.references(), opts)
    keymap(bufnr, "n", "gl", vim.diagnostic.open_float(), opts)
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", opts)
    keymap(bufnr, "n", "<leader>la", vim.lsp.buf.code_action(), opts)
    keymap(bufnr, "n", "<leader>lj", vim.diagnostic.goto_next({buffer=0}), opts)
    keymap(bufnr, "n", "<leader>lr", vim.lsp.buf.rename(), opts)
    keymap(bufnr, "n", "<leader>ls", vim.lsp.buf.signature_help(), opts)
    keymap(bufnr, "n", "<leader>lq", vim.diagnostic.setloclist(), opts)
end

local lspconfig = require("lspconfig")
local on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    require("illuminate").on_attach(client)
end

for _, server in pairs(require("utils.servers")) do
    Opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "settings.lsp." .. server)
    if require_ok then
        Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
    end

    lspconfig[server].setup(Opts)
end

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
    virtual_text = true,
    signs = {
        active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
        suffix = "",
    },
}
vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})
