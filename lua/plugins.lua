local dbui_conf = require("settings.dbui")

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "moon", -- "strom", "night", "moon"
                transparent = true,
                on_colors = function(colors)
                    colors.hint = colors.blue
                    colors.info = colors.green
                    colors.error = colors.red
                    colors.warning = colors.orange
                end,
                sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" },
                dim_inactive = true,
                lualine_bold = true,
            })

            vim.cmd.colorscheme("tokyonight")
        end,
    },
    { "lunarvim/colorschemes" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 200
        end,
        opts = {},
    },
    {
        "folke/neoconf.nvim",
        cmd = "Neoconf"
    },
    {
        "folke/neodev.nvim",
        lazy = true,
        opts = {}
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "ahmedkhalf/project.nvim",
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build =
                'cmake -S. -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
            },
        }
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
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
            },
        },
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        event = "BufReadPre",
        build = ":MasonUpdate",
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
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" }
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
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
    },
    { "lewis6991/gitsigns.nvim" },
    { "rcarriga/nvim-notify", },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { ignore_missing = true },
    },
    { "ChristianChiarulli/swenv.nvim" },
    { "stevearc/dressing.nvim" },
    { "p00f/clangd_extensions.nvim" },
    { "pixelneo/vim-python-docstring" },
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
        init = function()
            require("settings.terminal").init()
        end,
        event = "VeryLazy",
        config = true
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-tree.lua",
        },
        config = function()
            require("lsp-file-operations").setup({ debug = false })
        end,
    },
    { "stevearc/dressing.nvim" },
    {
        "mrded/nvim-lsp-notify",
        dependencies = { "rcarriga/nvim-notify" },
        config = function()
            require("lsp-notify").setup({
                notify = require("notify"),
            })
        end
    },
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
        "kristijanhusak/vim-dadbod-ui",
        cmd = dbui_conf.cmd,
        init = function()
            dbui_conf.init()
        end,
        dependencies = dbui_conf.dependencies,
    },
    -- {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = { "MunifTanjim/nui.nvim", }
    },
    { "b0o/schemastore.nvim" },
}
