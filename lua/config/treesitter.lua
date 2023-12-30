require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"typescript",
		"javascript",
		"html",
		"css",
		"java",
		"latex",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
})
