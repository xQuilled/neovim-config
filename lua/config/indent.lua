require("mini.indentscope").setup({
	-- symbol = "▏",
	symbol = "│",
	options = { try_as_border = true },
})

require("ibl").setup({

	indent = {
		char = "│",
		tab_char = "│",
	},
	scope = { enabled = false },
	exclude = {
		filetypes = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"trouble",
			"lazy",
			"mason",
			"notify",
			"toggleterm",
			"lazyterm",
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"help",
		"alpha",
		"dashboard",
		"neo-tree",
		"Trouble",
		"trouble",
		"lazy",
		"mason",
		"notify",
		"toggleterm",
		"lazyterm",
	},
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})
