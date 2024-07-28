-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle file tree" })

-- barbar
vim.g.barbar_auto_setup = true

require("barbar").setup({
	auto_hide = 1,
	animation = true,
})

-- toggleterm
require("toggleterm").setup({
	open_mapping = [[<F7>]],
	auto_scroll = true,
	direction = "float",
	float_opts = {
		border = "curved",
	},
})
