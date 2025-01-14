local opts = require("deodato.utils.functions").opts
local term_opts = { silent = true }

vim.keymap.set("", "<Space>", "<Nop>", opts("Leader"))
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save File" })
vim.keymap.set("n", "<leader>s", vim.cmd.so)
vim.keymap.set("n", "\\", vim.cmd.vsplit, { desc = "Vertical Split" })
vim.keymap.set("n", "|", vim.cmd.split, { desc = "Horizontal Split" })

local keymap = vim.api.nvim_set_keymap

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts("Move to window on the left"))
keymap("n", "<C-j>", "<C-w>j", opts("Move to window below"))
keymap("n", "<C-k>", "<C-w>k", opts("Move to window above"))
keymap("n", "<C-l>", "<C-w>l", opts("Move to window on the right"))

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts("Increase vertical window size"))
keymap("n", "<C-Down>", ":resize +2<CR>", opts("Decrease vertical window size"))
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts("Increase horizontal window size"))
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts("Increase horizontal window size"))

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts("Move the current line up"))
keymap("n", "<A-k>", ":m .-2<CR>==", opts("Move the current line down"))

-- Keep cursor in same line
keymap("n", "J", "mzJ`z", opts("Move the line from below upwards"))

-- Kepp curso in the middle of screen
keymap("n", "<C-d>", "<C-d>zz", opts("Page down"))
keymap("n", "<C-u>", "<C-u>zz", opts("Page up"))
keymap("n", "n", "nzzzv", opts("Next item"))
keymap("n", "N", "Nzzzv", opts("Previus item"))
keymap("n", "<C-f>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts("Rename current item"))

---- greatest remap ever
keymap("x", "<C-p>", [["_dP]], opts("Paste & Keep register"))

-- next greatest remap ever : asbjornHaland
keymap("n", "<leader>y", [["+y]], opts("Copy to clipboard"))
keymap("v", "<leader>y", [["+y]], opts("Copy to clipboard"))
keymap("n", "<leader>Y", [["+Y]], opts("Copy to the end of line to clipboard"))

keymap("n", "<leader>d", [["_d]], opts("Delete to null register"))
keymap("v", "<leader>d", [["_d]], opts("Delete to null register"))

---
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
---


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts("Stay in indent mode"))
keymap("v", ">", ">gv", opts("Stay in indent mode"))

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts("Move the current line up"))
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts("Move the current line up"))

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts("Move the current line up"))
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts("Move the current line up"))

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Command --
-- Menu navigation
keymap("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
keymap("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })
