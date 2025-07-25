return {
    "neovim/nvim-lspconfig",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        inlay_hint = {
            enabled = true,
        },
    },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local icons = require("deodato.utils.icons").diagnostics
        local servers = require("deodato.utils.servers")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_nvim_lsp.default_capabilities()
        )
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        }

        local on_attach = function(_, bufnr)
            require("deodato.utils.functions").lsp_keymaps(bufnr)
            -- require("illuminate").on_attach(client)
        end

        mason_lspconfig.setup({
            automatic_enable = true,
            ensure_installed = servers,
            handlers = {
                function(server_name)
                    Opts = {
                        on_attach = on_attach,
                        capabilities = capabilities,
                    }

                    local require_ok, conf_opts = pcall(require, "settings.lsp." .. server_name)
                    if require_ok then
                        Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
                    end

                    lspconfig[server_name].setup(Opts)
                end,

                ["clangd"] = function()
                    local provider = require("settings.lsp.clangd_setup")
                    Opts = {
                        capabilities = capabilities,
                        on_attach = provider.on_attach,
                        on_init = provider.on_init,
                    }

                    local require_ok, conf_opts = pcall(require, "settings.lsp.clangd")
                    if require_ok then
                        Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
                    end
                    lspconfig["clangd"].setup(Opts)
                end,
            },
        })

        local signs = {
            { name = "DiagnosticSignError", text = icons.BoldError },
            { name = "DiagnosticSignWarn", text = icons.BoldWarning },
            { name = "DiagnosticSignHint", text = icons.BoldInformation },
            { name = "DiagnosticSignInfo", text = icons.BoldQuestion },
        }

        vim.diagnostic.config({
            signs = { text = signs },
        })

        local config = {
            virtual_text = true,
            signs = {
                active = signs,
            },
            update_in_insert = true,
            underline = false,
            severity_sort = true,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
                suffix = "",
            },
        }
        vim.diagnostic.config(config)

        -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        --     border = "rounded",
        -- })

        -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        --     border = "rounded",
        -- })

        -- table from lsp severity to vim severity.
        local severity = {
            "error",
            "warn",
            "info",
            "hint",
        }

        vim.lsp.handlers["window/showMessage"] = function(_, _, ctx, _)
            vim.notify(ctx.method, severity[ctx.params.type])
        end
    end,
}
