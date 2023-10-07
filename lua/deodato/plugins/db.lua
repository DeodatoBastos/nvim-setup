local dbui_conf = require("settings.dbui")

return {
    "kristijanhusak/vim-dadbod-ui",
    cmd = dbui_conf.cmd,
    init = function()
        dbui_conf.init()
    end,
    dependencies = dbui_conf.dependencies,
}
