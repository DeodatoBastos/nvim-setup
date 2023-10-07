return {
    "neovim/nvim-lspconfig",
    lazy = false,
    event = { "BufReadPre" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        }
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

        local lspconfig = require("lspconfig")
        local on_attach = function(client, bufnr)
            require("deodato.utils.functions").lsp_keymaps(bufnr)
            require("illuminate").on_attach(client)
        end

        for _, server in pairs(require("utils.servers")) do
            server = vim.split(server, "@")[1]

            if server == "clangd" then
                local provider = require("settings.lsp.clangd_setup")
                Opts = {
                    on_attach = provider.on_attach,
                    capabilities = capabilities,
                    on_init = provider.on_init,
                }
            else
                Opts = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
            end

            local require_ok, conf_opts = pcall(require, "settings.lsp." .. server)
            if require_ok then
                Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
            end

            lspconfig[server].setup(Opts)
        end

        local icons = require("deodato.utils.icons").diagnostics

        local signs = {
            { name = "DiagnosticSignError", text = icons.BoldError },
            { name = "DiagnosticSignWarn",  text = icons.BoldWarning },
            { name = "DiagnosticSignHint",  text = icons.BoldInformation },
            { name = "DiagnosticSignInfo",  text = icons.BoldQuestion },
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

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
        })

        -- table from lsp severity to vim severity.
        local severity = {
            "error",
            "warn",
            "info",
            "hint",
        }

        vim.lsp.handlers["window/showMessage"] = function(_, method, params, _)
            vim.notify(method.message, severity[params.type])
        end
    end
}
