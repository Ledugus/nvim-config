return {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").setup({
			style = "cool",
			code_style = {
				comments = "none",
			},
			colors = {
				cyan = "#99ddee",
			},
		})
		require("onedark").load()
	end,
}
--[[
{
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({ disable_italics = true })
		vim.cmd("colorscheme rose-pine")
	end,
}
]]
--
