vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-c>", "<Esc>")

local augroup = vim.api.nvim_create_augroup
local AugustinGroup = augroup("AugustinGroup", {})

local autocmd = vim.api.nvim_create_autocmd
