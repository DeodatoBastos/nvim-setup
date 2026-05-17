local opts = require("deodato.utils.functions").opts
local term_opts = { silent = true }

vim.keymap.set("", "<Space>", "<Nop>", opts("Leader"))
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save File" })
vim.keymap.set("n", "\\", vim.cmd.vsplit, { desc = "Vertical Split" })
vim.keymap.set("n", "|", vim.cmd.split, { desc = "Horizontal Split" })

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts("Move to window on the left"))
vim.keymap.set("n", "<C-j>", "<C-w>j", opts("Move to window below"))
vim.keymap.set("n", "<C-k>", "<C-w>k", opts("Move to window above"))
vim.keymap.set("n", "<C-l>", "<C-w>l", opts("Move to window on the right"))

-- Resize with arrows
vim.keymap.set("n", "<M-Up>", "<cmd>resize -2<cr>", opts("Increase vertical window size"))
vim.keymap.set("n", "<M-Down>", "<cmd>resize +2<cr>", opts("Decrease vertical window size"))
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<cr>", opts("Increase horizontal window size"))
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<cr>", opts("Increase horizontal window size"))

vim.keymap.set("t", "<M-Up>", "<cmd>resize +2<cr>", opts("Increase vertical window size"))
vim.keymap.set("t", "<M-Down>", "<cmd>resize -2<cr>", opts("Decrease vertical window size"))
vim.keymap.set("t", "<M-Left>", "<cmd>vertical resize +2<cr>", opts("Increase horizontal window size"))
vim.keymap.set("t", "<M-Right>", "<cmd>vertical resize -2<cr>", opts("Increase horizontal window size"))

-- Move text up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts("Move the current line up"))
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts("Move the current line down"))

-- Keep cursor in same line
vim.keymap.set("n", "J", "mzJ`z", opts("Move the line from below upwards"))

-- Kepp curso in the middle of screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts("Page down"))
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts("Page up"))
vim.keymap.set("n", "n", "nzzzv", opts("Next item"))
vim.keymap.set("n", "N", "Nzzzv", opts("Previus item"))
vim.keymap.set("n", "<C-f>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts("Rename current item"))

---- greatest remap ever
vim.keymap.set("x", "<C-p>", [["_dP]], opts("Paste & Keep register"))

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", [["+y]], opts("Copy to clipboard"))
vim.keymap.set("v", "<leader>y", [["+y]], opts("Copy to clipboard"))
vim.keymap.set("n", "<leader>Y", [["+Y]], opts("Copy to the end of line to clipboard"))

vim.keymap.set("n", "<leader>d", [["_d]], opts("Delete to null register"))
vim.keymap.set("v", "<leader>d", [["_d]], opts("Delete to null register"))

---
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
---

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts("Stay in indent mode"))
vim.keymap.set("v", ">", ">gv", opts("Stay in indent mode"))

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts("Move the current line down"))
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts("Move the current line up"))

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts("Move the current line down"))
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts("Move the current line up"))

-- Terminal --
-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Command --
-- Menu navigation
vim.keymap.set("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
vim.keymap.set("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })
