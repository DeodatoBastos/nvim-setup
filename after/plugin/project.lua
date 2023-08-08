require("project_nvim").setup({
    detection_methods = { "pattern" },
    patterns = { ".git", "Makefile", "package.json", "requirements.txt" },
})

require("telescope").load_extension("projects")
require("which-key").register({
    P = { "<cmd>Telescope projects<cr>", "Projects" }
}, { prefix = "<leader>" })
