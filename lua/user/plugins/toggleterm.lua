return {
	"akinsho/toggleterm.nvim",
	config = function()
		local status_ok, toggleterm = pcall(require, "toggleterm")
		if not status_ok then
			return
		end

		toggleterm.setup({
			size = 20,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
		local function get_class_name()
			local node = vim.treesitter.get_node()
			while node do
				if node:type() == "class_definition" then
					local name_node = node:field("name")[1]
					if name_node then
						local class_name = vim.treesitter.get_node_text(name_node, 0)
						return class_name
					end
				end
				node = node:parent()
			end
			return nil
		end

		vim.keymap.set("n", "<leader>mm", function()
			vim.cmd("w")
			local class_name = get_class_name()
			if not class_name then
				print("No class name found at cursor!")
				return
			end

			local file_path = vim.fn.expand("%:p")
			local dir_name = vim.fn.expand("%:p:h")
			local file_name = vim.fn.expand("%:t:r")
			local video_path = dir_name .. "/media/videos/" .. file_name .. "/480p15/" .. class_name .. ".mp4"

			local cmd = string.format("uv run manim -pql '%s' '%s' && xdg-open '%s'", file_path, class_name, video_path)

			require("toggleterm.terminal").Terminal:new({ cmd = cmd }):toggle()
		end, { noremap = false, silent = true })
	end,
}
