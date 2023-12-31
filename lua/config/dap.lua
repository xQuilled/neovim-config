vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", { desc = "Continue" })
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dn", "<cmd>lua require('dap').step_over()<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>", { desc = "Step out" })
vim.keymap.set("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", { desc = "Run last" })
vim.keymap.set("n", "<leader>ds", "<cmd>lua require('dap').close()<CR>", { desc = "Stop" })

local dap = require("dap")

if not dap.adapters["pwa-node"] then
	require("dap").adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "node",
			-- 💀 Make sure to update this path to point to your installation
			args = {
				require("mason-registry").get_package("js-debug-adapter"):get_install_path()
					.. "/js-debug/src/dapDebugServer.js",
				"${port}",
			},
		},
	}
end
for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
	if not dap.configurations[language] then
		dap.configurations[language] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
		}
	end
end
