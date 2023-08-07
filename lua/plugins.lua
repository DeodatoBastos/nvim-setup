return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    { "lunarvim/colorschemes" },
    { "folke/which-key.nvim" },
    { "folke/neoconf.nvim",   cmd = "Neoconf" },
    { "folke/neodev.nvim",    opts = {} },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "mrjones2014/nvim-ts-rainbow",
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function()
            require("nvim-autopairs").setup {}
            -- If you want to automatically add `(` after selecting a function or method
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end,
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            {
                "L3MON4D3/LuaSnip",
                event = "InsertEnter",
                dependecies = {
                    "rafamadriz/friendly-snippets",
                },
            },
        },
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        event = "BufReadPre",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        event = { "BufReadPre" },
        dependencies = { { "hrsh7th/cmp-nvim-lsp" }, },
    },
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        "SmiteshP/nvim-navic",
        requires = { "neovim/nvim-lspconfig" }
    },
    { "lukas-reineke/indent-blankline.nvim" },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    { 'kazhala/close-buffers.nvim' },
    { "onsails/lspkind.nvim" },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    { "lewis6991/gitsigns.nvim" },
    {
        "rcarriga/nvim-notify",
        config = function() require("notify").setup() end
    },
    { "Tastyep/structlog.nvim", },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    { "ChristianChiarulli/swenv.nvim" },
    { "stevearc/dressing.nvim" },
    { "mfussenegger/nvim-dap-python" },
    { "nvim-neotest/neotest" },
    { "nvim-neotest/neotest-python" },
    { "p00f/clangd_extensions.nvim" },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    { "pixelneo/vim-python-docstring" },
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "folke/lsp-colors.nvim",
        event = "BufRead",
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        module = "persistence",
        config = function()
            require("persistence").setup {
                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            }
        end,
    },
    { "RRethy/vim-illuminate" },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        event = "VeryLazy",
        config = true
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependecies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-tree.lua",
        },
        config = function()
            require("lsp-file-operations").setup({ debug = false })
        end,
    },
}
