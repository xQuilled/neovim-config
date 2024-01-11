require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"python",
		"c",
		"cpp",
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
		"make",
		"cmake",
		"glimmer",
		"xml",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
})
