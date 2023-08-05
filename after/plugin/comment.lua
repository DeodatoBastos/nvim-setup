require('Comment').setup({
    ignore = "^$",
    pre_hook = function(...)
      local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      if loaded and ts_comment then
        return ts_comment.create_pre_hook()(...)
      end
    end,
})

vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")
