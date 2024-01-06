require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		-- formatters
		"stylua",
		"prettierd",
		"prettier",
		"isort",
		"black",
		"latexindent",
		"clang-format",

		-- linters
		"eslint_d",
		"eslint",
		"stylelint",
		"flake8",
		"luacheck",

		-- debug adapters
		"google-java-format",
		"java-debug-adapter",
		"js-debug-adapter",
	},
})

local lsp = require("lspconfig")

-- setting up lsp servers
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"tsserver",
		"cssls",
		"html",
		"texlab",
		"jdtls",
		"clangd",
	},
})

lsp.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
lsp.pyright.setup({})
lsp.tsserver.setup({})
lsp.cssls.setup({})
lsp.html.setup({})
lsp.texlab.setup({})
lsp.clangd.setup({})

-- setting up formatters
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		tex = { "latexindent" },
		java = { "google-java-format" },
		c = { "clang-format" },
		cpp = { "clang-format" },
	},

	format_on_save = {
		timeout_ms = 2000,
		lsp_fallback = true,
	},
})

-- setting up linters
local lint = require("lint")

lint.linters_by_ft = {
	-- lua = { "luacheck" },
	python = { "flake8" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	css = { "stylelint" },
	html = { "stylelint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

-- keymaps for lsp servers
-- vim.keymap.set("n", "<leader>ll", function()
-- 	lint.try_lint()
-- end, { desc = "Trigger linting for current file" })

vim.keymap.set("n", "<space>cd", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>cD", vim.diagnostic.setloclist, { desc = "List diagnostics" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "go to implementation" })
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set(
			"n",
			"<space>wa",
			vim.lsp.buf.add_workspace_folder,
			{ buffer = ev.buf, desc = "Add workspace folder" }
		)
		vim.keymap.set(
			"n",
			"<space>wr",
			vim.lsp.buf.remove_workspace_folder,
			{ buffer = ev.buf, desc = "Remove workspace folder" }
		)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { buffer = ev.buf, desc = "List workspace folders" })
		vim.keymap.set("n", "<space>cm", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Type definition" })
		vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		-- vim.keymap.set("n", "<space>f", function()
		-- vim.lsp.buf.format({ async = true })
		-- end, opts)
	end,
})
