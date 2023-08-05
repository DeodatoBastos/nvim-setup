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

local function delete_current_buffer()
    require("close_buffers").delete({ type = "this" })
end

vim.keymap.set({ "n", "t" }, "<leader>c", delete_current_buffer, { noremap = true, silent = true })
