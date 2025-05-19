vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>rp", ":w<CR>:!python3 %<CR>")
vim.keymap.set("n", "<leader>rl", ":w<CR>:VimtexCompile<CR>")

vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>wd", ":wincmd j<CR>")
