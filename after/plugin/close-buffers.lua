require('close_buffers').setup({
  preserve_window_layout = { 'this' },
  next_buffer_cmd = function(windows)
    require('bufferline').cycle(1)
    local bufnr = vim.api.nvim_get_current_buf()

    for _, window in ipairs(windows) do
      vim.api.nvim_win_set_buf(window, bufnr)
    end
  end,
})

vim.keymap.set("n", "<leader>c", "[[<CMD>lua require('close_buffers').delete({type = 'this'})<CR>]]", { noremap = true, silent = true })
