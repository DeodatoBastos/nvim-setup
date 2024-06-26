return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
    config = function()
        local whichkey = require("which-key")

        whichkey.setup({
            triggers_blacklist = {
                -- list of mode / prefixes that should never be hooked by WhichKey
                -- this is mostly relevant for keymaps that start with a native binding
                i = { "j", "k" },
                v = { "j", "k", "y", "d" },
                n = { "y", "d", "v" },
            },
        })

        local mappings = {
            P = { "<cmd>Telescope projects<cr>", "Projects" },
            S = {
                name = "Session",
                c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
                l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
                Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
            },
            N = {
                "<cmd>edit ~/.config/nvim/init.lua<cr>",
                "Edit Nvim Settings",
            },
            C = {
                name = "Connections",
                a = { "<cmd>DBUIAddConnection<cr>", "Add Connection" },
                f = { "<cmd>DBUIFindBuffer<cr>", "Find Buffer" },
                r = { "<cmd>DBUIRenameBuffer<cr>", "Rename Buffer" },
                l = { "<cmd>DBUILastQueryInfo<cr>", "Last Query Info" },
                h = { "<cmd>DBUIHideNotifications<cr>", "Hide Notifications" },
            },
            a = { "<cmd>DBUIToggle<cr>", "Toggle DB Connections" },
            t = {
                name = "Trouble",
                r = { "<cmd>Trouble lsp_references<cr>", "References" },
                f = { "<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>", "Definitions" },
                d = { "<cmd>Trouble diagnostics<cr>", "Diagnostics" },
                s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols" },
                q = { "<cmd>Trouble qflist toggle<cr>", "QuickFix" },
                l = { "<cmd>Trouble loclist toggle<cr>", "LocationList" },
                b = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics" },
                t = { "<cmd>Trouble diagnostics toggle<cr>", "Toggle Trouble" },
            },
            p = {
                name = "Find in Project",
                f = { "<cmd>Telescope find_files<cr>", "Find Files" },
                g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
                h = { "<cmd>Telescope help_tags<cr>", "Help" },
                b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
                c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
                M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
                r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
                R = { "<cmd>Telescope registers<cr>", "Registers" },
                k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
                C = { "<cmd>Telescope commands<cr>", "Commands" },
                F = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in current buffer" },
            },
            T = {
                name = "Treesitter",
                i = { "<cmd>TSInstallInfo<cr>", "Install info" },
                u = { "<cmd>TSUpdate<cr>", "Update" },
                s = { "<cmd>TSUpdateSync<cr>", "Update and sync" },
                e = { "<cmd>TSEnable<cr>", "Enable" },
                d = { "<cmd>TSDisable<cr>", "Disable" },
            },
            l = {
                name = "LSP",
                a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                F = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format (LSP)" },
                f = { "<cmd>FormatWriteLock<cr>", "Format" },
                i = { "<cmd>LspInfo<cr>", "Info" },
                I = { "<cmd>Mason<cr>", "Mason" },
                j = {
                    "<cmd>lua vim.diagnostic.goto_next()<CR>",
                    "Next Diagnostic",
                },
                k = {
                    "<cmd>lua vim.diagnostic.goto_prev()<cr>",
                    "Prev Diagnostic",
                },
                L = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
                t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
                q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
                r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
                s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
                S = {
                    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                    "Workspace Symbols",
                },
            },
            g = {
                name = "Git",
                j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
                k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
                l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
                p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
                r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
                R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
                s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
                f = { "<cmd>Git<cr>", "Fugitive" },
                u = {
                    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                    "Undo Stage Hunk",
                },
                o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
                b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
                c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
                d = { "<cmd>Gvdiffsplit<cr>", "Diff" },
            },
            L = {
                name = "Lazy",
                i = { "<cmd>Lazy install<cr>", "Install" },
                u = { "<cmd>Lazy update<cr>", "Update" },
                s = { "<cmd>Lazy sync<cr>", "Sync" },
                l = { "<cmd>Lazy log<cr>", "Log" },
                p = { "<cmd>Lazy profile<cr>", "Profile" },
                d = { "<cmd>Lazy debug<cr>", "Debug" },
                c = { "<cmd>Lazy clean<cr>", "Clean" },
                S = { "<cmd>Lazy<cr>", "Lazy" },
            },
            b = {
                name = "Buffers",
                n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
                b = { "<cmd>BufferLineCyclePrev<cr>", "Prev" },
                p = { "<cmd>BufferLinePick<cr>", "Pick" },
                s = { "<cmd>BufferLineSortByDirectory<cr>", "Sort" },
                d = { "<cmd>BufferLinePickClose<cr>", "Pick Close" },
                D = { "<cmd>BufferLineCloseOthers<cr>", "Close all others buffers" },
                l = { "<cmd>BufferLineCloseLeft<cr>", "Close all left" },
                r = { "<cmd>BufferLineCloseRight<cr>", "Close all right" },
            },
            e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
            f = { "<cmd>Telescope git_files<cr>", "Find git files" },
            c = {
                "<cmd>lua require('close_buffers').delete({type = 'this'})<cr>",
                "Close Buffer",
            },
            s = { "<cmd>source %<cr>", "Source file" },
            d = { "<Plug>(doge-generate)", "Generate docstring" },
            h = { "<cmd>nohlsearch<cr>", "No Highlight" },
            ["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },
        }

        whichkey.register(mappings, { prefix = "<leader>" })
    end,
    opts = {},
}
