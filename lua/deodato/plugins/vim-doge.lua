return {
    "kkoomen/vim-doge",
    build = ":call doge#install()",
    init = function ()
        vim.g.doge_doc_standard_python = "google"
    end
}
