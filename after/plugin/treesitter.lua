require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "c", "cpp", "lua", "javascript",
  		       "json", "typescript", "python", "tsx",
		       "r", "latex", "cmake", "make", "bibtex",
		       "git_rebase", "sql", "ninja", "markdown",
               "verilog",
	            },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

   context_commentstring = {
    enable = true,
  },
}
