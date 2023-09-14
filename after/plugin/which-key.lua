local whichkey = require("which-key")

local mappings = {
    S = {
        name = "Session",
        c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
        l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
        Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
    },
    t = {
        name = "Trouble",
        r = { "<cmd>Trouble lsp_references<cr>", "References" },
        f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
        q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
        l = { "<cmd>Trouble loclist<cr>", "LocationList" },
        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
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
        f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format" },
        F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
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
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
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
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Diff",
        },
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
        l = { "<cmd>BufferLineCloseLeft<cr>", "Close next left" },
        r = { "<cmd>BufferLineCloseRight<cr>", "Close next right" },
    },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    f = { "<cmd>Telescope git_files<cr>", "Find git files" },
    c = { "<cmd>lua require('close_buffers').delete({type = 'this'})<cr>", "Close Buffer" },
    s = { "<cmd>source %<cr>", "Source file" },
    h = { "<cmd>nohlsearch<cr>", "No Highlight" },
    ["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },
}

whichkey.register(mappings, { prefix = "<leader>" })
