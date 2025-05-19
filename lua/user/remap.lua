vim.g.mapleader = " "

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Execute the current file in Python
vim.keymap.set("n", "<leader>rp", ":w<CR>:!python3 %<CR>")
