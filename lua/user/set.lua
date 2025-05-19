-- Block cursor everywhere except insert mode
vim.opt.guicursor = { "i:ver2" }
-- vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 5

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"
