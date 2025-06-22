local cmd_table = {
    "clang",
    "--background-index",
    "--fallback-style=WebKit",
    "--all-scopes-completion",
    "--clang-tidy",
    "--log=error",
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--pch-storage=memory", -- could also be disk
    "--folding-ranges",
    "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
    "--offset-encoding=utf-16", --temporary fix for null-ls
    "--indent-width=4",
    -- "--limit-references=1000",
    -- "--limit-resutls=1000",
    -- "--malloc-trim",
    -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
    -- "--header-insertion=never",
    -- "--query-driver=<list-of-white-listed-complers>"
}

return {
    settings = {
        cpp = {
            cmd = cmd_table,
        },
        c = {
            cmd = cmd_table,
        },
    },
}
