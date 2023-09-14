require("neotest").setup({
    adapters = {
        require("neotest-python")({
            -- Extra arguments for nvim-dap configuration
            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
            dap = {
                justMyCode = false,
                console = "integratedTerminal",
            },
            args = { "--log-level", "DEBUG", "--quiet" },
            runner = "pytest",
        })
    }
})

local which_key = require("which-key")

which_key.register({
    d = {
        name = "Debug",
        m = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
        M = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" },
        f = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
        F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },
        S = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
    },
    P = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}, { prefix = "<leader>" })
