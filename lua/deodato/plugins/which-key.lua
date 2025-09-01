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

        wk.setup({
            -- triggers = {
            --     -- list of mode / prefixes that should never be hooked by WhichKey
            --     -- this is mostly relevant for keymaps that start with a native binding
            --     { i = { "j", "k" }, mode = "xo" } ,
            --     { v = { "j", "k", "y", "d" }, mode = "xo" },
            --     { n = { "y", "d", "v" }, mode = "xo" }
            -- },
        })

        local mappings = {
            -- { "K", bordered_hover, desc = "Hover" },
            { "K", "<cmd>lua require('pretty_hover').hover()<cr>", desc = "Hover" },
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
                    "<cmd>lua require('persistence').load()<cr>",
                    desc = "Restore last session for current dir",
                },
                {
                    "<leader>Sl",
                    "<cmd>lua require('persistence').load({ last = true })<cr>",
                    desc = "Restore last session",
                },
                { "<leader>SQ", "<cmd>lua require('persistence').stop()<cr>", desc = "Quit without saving session" },
            },
            { "<leader>N", "<cmd>edit ~/.config/nvim/init.lua<cr>", desc = "Edit Nvim Settings" },
            {
                "<leader>C",
                group = "Connections",
                { "<leader>Ca", "<cmd>DBUIAddConnection<cr>", desc = "Add Connection" },
                { "<leader>Cf", "<cmd>DBUIFindBuffer<cr>", desc = "Find Buffer" },
                { "<leader>Cr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename Buffer" },
                { "<leader>Cl", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
                { "<leader>Ch", "<cmd>DBUIHideNotifications<cr>", desc = "Hide Notifications" },
            },
            {
                "<leader>T",
                group = "Treesitter",
                { "<leader>Ti", "<cmd>TSInstallInfo<cr>", desc = "Install info" },
                { "<leader>Tu", "<cmd>TSUpdate<cr>", desc = "Update" },
                { "<leader>Ts", "<cmd>TSUpdateSync<cr>", desc = "Update and sync" },
                { "<leader>Te", "<cmd>TSEnable<cr>", desc = "Enable" },
                { "<leader>Td", "<cmd>TSDisable<cr>", desc = "Disable" },
            },
            {
                "<leader>l",
                group = "LSP",
                { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
                { "<leader>ld", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "List Diagnostic" },
                { "<leader>lF", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", desc = "Format (LSP)" },
                { "<leader>lf", "<cmd>FormatWriteLock<cr>", desc = "Format" },
                { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
                { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason" },
                {
                    "<leader>lj",
                    "<cmd>lua vim.diagnostic.jump({ buffer = 0, count =  1, float = true})<cr>",
                    desc = "Next Diagnostic",
                },
                {
                    "<leader>lk",
                    "<cmd>lua vim.diagnostic.jump({ buffer = 0, count = -1, float = true})<cr>",
                    desc = "Prev Diagnostic",
                },
                { "<leader>lL", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
                { "<leader>lh", bordered_signature_help, desc = "Signature Help" },
                { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition" },
                { "<leader>lq", "<cmd>lua vim.diagnostic.setqflist()<cr>", desc = "Quickfix" },
                { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
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
                { "<leader>LS", "<cmd>Lazy<cr>", desc = "Lazy" },
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
                { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
                { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
                { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
                { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
                { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
                { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
                { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
                { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
                { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
                { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
                { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
                { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Diff" },
            },
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
            { "<leader>f", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
            { "<leader>c", "<cmd>lua require('close_buffers').delete({type = 'this'})<cr>", desc = "Close Buffer" },
            { "<leader>s", "<cmd>source %<cr>", desc = "Source file" },
            { "<leader>d", "<Plug>(doge-generate)", desc = "Generate docstring" },
            { "<leader>h", "<cmd>nohlsearch<cr>", desc = "No Highlight" },
            { "<leader>/", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', desc = "Comment" },
            { "<C-;>", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', desc = "Comment" },
        }

        wk.add(mappings)
    end,
    -- opts = {},
}
