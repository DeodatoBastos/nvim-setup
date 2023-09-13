local function lsp_keymaps(bufnr)
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
    keymap("n", "<leader>lj", function() vim.diagnostic.goto_next({ buffer = 0 }) end, opts())
    keymap("n", "<leader>lk", function() vim.diagnostic.goto_prev({ buffer = 0 }) end, opts())
    keymap("n", "<leader>lr", vim.lsp.buf.rename, opts())
    keymap("n", "<leader>ls", vim.lsp.buf.signature_help, opts())
    keymap("n", "<leader>lq", vim.diagnostic.setloclist, opts())
    keymap("n", "<leader>lf", vim.lsp.buf.format, opts())

    keymap("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", opts("Switch Source/Header"))
    keymap("x", "<leader>lA", "<cmd>ClangdAST<cr>", opts("ClangdAST"))
    keymap("n", "<leader>lH", "<cmd>ClangdTypeHierarchy<cr>", opts("ClangdTypeHierarchy"))
    keymap("n", "<leader>lt", "<cmd>ClangdSymbolInfo<cr>", opts("ClangdSymbolInfo"))
    keymap("n", "<leader>lm", "<cmd>ClangdMemoryUsage<cr>", opts("ClangdMemoryUsage"))
end

local function on_attach(client, bufnr)
    lsp_keymaps(bufnr)
    require("illuminate").on_attach(client)
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
end

local function on_init(_, _)
    require("clangd_extensions.config").setup {}
    require("clangd_extensions.ast").init()

    vim.cmd [[
        command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
        command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
        command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
        command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
        command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
    ]]
end

local settings = {
    cpp = {
        cmd = {
                "clang",
                "--background-index",
                "--fallback-style=Google",
                "--all-scopes-completion",
                "--clang-tidy",
                "--log=error",
                "--suggest-missing-includes",
                "--cross-file-rename",
                "--completion-style=detailed",
                "--pch-storage=memory", -- could also be disk
                "--folding-ranges",
                "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
                "--offset-encoding=utf-16", --temporary fix for null-ls
                -- "--limit-references=1000",
                -- "--limit-resutls=1000",
                -- "--malloc-trim",
                -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
                -- "--header-insertion=never",
                -- "--query-driver=<list-of-white-listed-complers>"
        }
    }
}

return {
    settings = settings,
    on_init = on_init,
    on_attach = on_attach,
}
