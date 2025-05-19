local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Check if lazy.nvim is already installed
if not vim.loop.fs_stat(lazypath) then
	-- bootstrap lazy.nvim
	-- stylua: ignore
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end
-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
-- Load plugins
require("lazy").setup("user.plugins")
