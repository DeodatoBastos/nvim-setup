return {
    settings = {
        bash = {
            cmd = { "bash-language-server", "start" },
            filetypes = { "bash", "zsh", "sh" },
            settings = {
                bashIde = {
                    globPattern = "*@(.sh|.inc|.bash|.command|.zsh)"
                }
            }
        }
    }
}
