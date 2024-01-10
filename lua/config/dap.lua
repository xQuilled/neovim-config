require("mason-nvim-dap").setup({
	handlers = {},

	ensure_installed = {
		"python",
		"js",
		"chrome",
		"node",
		"codelldb",
		"javadbg",
	},
})
