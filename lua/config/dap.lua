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

require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
