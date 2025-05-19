-- Thème et apparence du code
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
