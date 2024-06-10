require 'nvim-treesitter.install'.compilers = { "clang" }

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
		"markdown",
		"hyprlang",
		"xml",
		"json",
		"yaml",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
})

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
