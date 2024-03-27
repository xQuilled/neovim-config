require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		keymap = {
			accept = "<S-Tab>",
		},
	},
})

require("CopilotChat").setup({
	debug = true,
	window = {
		layout = "float",
		title = "Copilot Chat",
		border = "rounded",
	},
})
