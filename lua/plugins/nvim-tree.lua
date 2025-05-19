-- Explorateur de fichiers
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			git = {
				enable = true,
			},
			-- Mettre à true pour ignorer les catégories suivantes :
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
		})
	end,
}
