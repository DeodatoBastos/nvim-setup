return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        -- "mfussenegger/nvim-dap",
        -- "mfussenegger/nvim-dap-python", -- Optional if you use DAP
    },
    ft = "python",
    opts = {
        options = {
            notify_user_on_venv_activation = true,
            statusline_func = {
                lualine = function() -- called by lualine
                    local venv_path = require("venv-selector").venv()
                    local icon = require("nvim-web-devicons")
                    local py_icon, _ = icon.get_icon(".py")

                    if not venv_path or venv_path == "" then
                        return "1"
                    end

                    local venv_name = vim.fn.fnamemodify(venv_path, ":t")
                    if not venv_name then
                        return "2"
                    end

                    return " " .. py_icon .. " " .. venv_name .. " "
                end,
            },
        },
    },
    keys = {
        { "<leader>v", "<cmd>VenvSelect<cr>" },
    },
}
