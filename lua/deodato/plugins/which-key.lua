return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
    dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
    config = function()
        local wk = require("which-key")
        local _border = "rounded"

        local function bordered_hover(_opts)
            _opts = _opts or {}
            return vim.lsp.buf.hover(vim.tbl_deep_extend("force", _opts, {
                border = _border,
            }))
        end

        local function bordered_signature_help(_opts)
            _opts = _opts or {}
            return vim.lsp.buf.signature_help(vim.tbl_deep_extend("force", _opts, {
                border = _border,
            }))
        end

        local mappings = {
            -- { "K", bordered_hover, desc = "Hover" },
            { "K", require("pretty_hover").hover, desc = "Hover" },
            { "gd", vim.lsp.buf.definition, desc = "Go to Definition" },
            { "gD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
            { "gi", vim.lsp.buf.implementation, desc = "Go to Implementation" },
            { "gr", vim.lsp.buf.references, desc = "Find references" },
            { "gl", vim.diagnostic.open_float, desc = "Open float" },
            { "<leader>P", "<cmd>Telescope projects<cr>", desc = "Projects" },
            {
                "<leader>S",
                group = "Session",
                {
                    "<leader>Sc",
                    require("persistence").load,
                    desc = "Restore last session for current dir",
                },
                {
                    "<leader>Sl",
                    function()
                        require("persistence").load({ last = true })
                    end,
                    desc = "Restore last session",
                },
                { "<leader>SQ", require("persistence").stop, desc = "Quit without saving session" },
            },
            { "<leader>N", "<cmd>edit ~/.config/nvim/init.lua<cr>", desc = "Edit Nvim Settings" },
            {
                "<leader>C",
                group = "Connections",
                { "<leader>Ca", vim.cmd.DBUIAddConnection, desc = "Add Connection" },
                { "<leader>Cf", vim.cmd.DBUIFindBuffer, desc = "Find Buffer" },
                { "<leader>Cr", vim.cmd.DBUIRenameBuffer, desc = "Rename Buffer" },
                { "<leader>Cl", vim.cmd.DBUILastQueryInfo, desc = "Last Query Info" },
                { "<leader>Ch", vim.cmd.DBUIHideNotifications, desc = "Hide Notifications" },
            },
            {
                "<leader>T",
                group = "Treesitter",
                { "<leader>Ti", vim.cmd.TSInstallInfo, desc = "Install info" },
                { "<leader>Tu", vim.cmd.TSUpdate, desc = "Update" },
                { "<leader>Ts", vim.cmd.TSUpdateSync, desc = "Update and sync" },
                { "<leader>Te", vim.cmd.TSEnable, desc = "Enable" },
                { "<leader>Td", vim.cmd.TSDisable, desc = "Disable" },
            },
            {
                "<leader>l",
                group = "LSP",
                { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
                { "<leader>ld", vim.diagnostic.setloclis, desc = "List Diagnostic" },
                {
                    "<leader>lF",
                    function()
                        vim.lsp.buf.format({ async = true })
                    end,
                    desc = "Format (LSP)",
                },
                { "<leader>lf", vim.cmd.FormatWriteLock, desc = "Format" },
                { "<leader>li", vim.cmd.LspInfo, desc = "Info" },
                { "<leader>lI", vim.cmd.Mason, desc = "Mason" },
                {
                    "<leader>lj",
                    function()
                        vim.diagnostic.jump({ buffer = 0, count = 1, float = true })
                    end,
                    desc = "Next Diagnostic",
                },
                {
                    "<leader>lk",
                    function()
                        vim.diagnostic.jump({ buffer = 0, count = -1, float = true })
                    end,
                    desc = "Prev Diagnostic",
                },
                { "<leader>lL", vim.lsp.codelens.run, desc = "CodeLens Action" },
                { "<leader>lh", bordered_signature_help, desc = "Signature Help" },
                { "<leader>lt", vim.lsp.buf.type_definition, desc = "Type Definition" },
                { "<leader>lq", vim.diagnostic.setqflist, desc = "Quickfix" },
                { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
                { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
                { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
            },
            {
                "<leader>p",
                group = "Find in Project",
                { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
                { "<leader>pg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
                { "<leader>ph", "<cmd>Telescope help_tags<cr>", desc = "Help" },
                { "<leader>pb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
                { "<leader>pc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
                { "<leader>pM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
                { "<leader>pr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
                { "<leader>pR", "<cmd>Telescope registers<cr>", desc = "Registers" },
                { "<leader>pk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
                { "<leader>pC", "<cmd>Telescope commands<cr>", desc = "Commands" },
                { "<leader>pF", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in current buffer" },
            },
            {
                "<leader>L",
                group = "Lazy",
                { "<leader>Li", "<cmd>Lazy install<cr>", desc = "Install" },
                { "<leader>Lu", "<cmd>Lazy update<cr>", desc = "Update" },
                { "<leader>Ls", "<cmd>Lazy sync<cr>", desc = "Sync" },
                { "<leader>Ll", "<cmd>Lazy log<cr>", desc = "Log" },
                { "<leader>Lp", "<cmd>Lazy profile<cr>", desc = "Profile" },
                { "<leader>Ld", "<cmd>Lazy debug<cr>", desc = "Debug" },
                { "<leader>Lc", "<cmd>Lazy clean<cr>", desc = "Clean" },
                { "<leader>LS", vim.cmd.Lazy, desc = "Lazy" },
            },
            {
                "<leader>b",
                group = "Buffers",
                { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
                { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev" },
                { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick" },
                { "<leader>bs", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort" },
                { "<leader>bd", "<cmd>BufferLinePickClose<cr>", desc = "Pick Close" },
                { "<leader>bD", "<cmd>BufferLineCloseOthers<cr>", desc = "Close all others buffers" },
                { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all left" },
                { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close all right" },
            },

            {
                "<leader>g",
                group = "Git",
                { "<leader>gj", require("gitsigns").next_hunk, desc = "Next Hunk" },
                { "<leader>gk", require("gitsigns").prev_hunk, desc = "Prev Hunk" },
                { "<leader>gl", require("gitsigns").blame_line, desc = "Blame" },
                { "<leader>gp", require("gitsigns").preview_hunk, desc = "Preview Hunk" },
                { "<leader>gr", require("gitsigns").reset_hunk, desc = "Reset Hunk" },
                { "<leader>gR", require("gitsigns").reset_buffer, desc = "Reset Buffer" },
                { "<leader>gs", require("gitsigns").stage_hunk, desc = "Stage Hunk" },
                { "<leader>gu", require("gitsigns").undo_stage_hunk, desc = "Undo Stage Hunk" },
                { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
                { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
                { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
                { "<leader>gd", vim.cmd.Gvdiffsplit, desc = "Diff" },
            },
            { "<leader>e", vim.cmd.NvimTreeToggle, desc = "Explorer" },
            { "<leader>f", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
            {
                "<leader>c",
                function()
                    require("close_buffers").delete({ type = "this" })
                end,
                desc = "Close Buffer",
            },
            { "<leader>s", vim.cmd.so, desc = "Source file" },
            { "<leader>d", "<Plug>(doge-generate)", desc = "Generate docstring" },
            { "<leader>h", vim.cmd.nohlsearch, desc = "No Highlight" },
        }

        wk.add(mappings)
    end,
}
