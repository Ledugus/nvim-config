vim.g.mapleader = " "

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Execute the current file in Python
vim.keymap.set("n", "<leader>rp", ":w<CR>:!python3 %<CR>")

-- Run Manim for the class under the cursor and open the resulting video
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

	local cmd = string.format("uv run manim -ql '%s' '%s' && xdg-open '%s'", file_path, class_name, video_path)

	require("toggleterm.terminal").Terminal:new({ cmd = cmd }):toggle()
end, { noremap = false, silent = true })
