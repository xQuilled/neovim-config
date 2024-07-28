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
		"cmakelang",
		"xmlformatter",
		"djlint",

		-- linters
		"eslint_d",
		"eslint",
		"checkmake",

		-- lsp
		"lua_ls",
		"pyright",
		"tsserver",
		"cssls",
		"html",
		"texlab",
		"jdtls",
		"clangd",
		"cmake",
		"lemminx",
		"glint",
		"tailwindcss",
		"jsonls",
		"omnisharp",
	},
})

local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
lsp.pyright.setup({ capabilities = capabilities })
lsp.tsserver.setup({ capabilities = capabilities })
lsp.cssls.setup({ capabilities = capabilities })
lsp.html.setup({ capabilities = capabilities })
lsp.texlab.setup({ capabilities = capabilities })
lsp.clangd.setup({
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})
lsp.lemminx.setup({ capabilities = capabilities })
lsp.glint.setup({ capabilities = capabilities })
lsp.cmake.setup({ capabilities = capabilities })
lsp.tailwindcss.setup({ capabilities = capabilities })
lsp.jsonls.setup({ capabilities = capabilities })
lsp.omnisharp.setup({ capabilities = capabilities, cmd = { "omnisharp", "--languageserver" } })
lsp.cmake.setup({ capabilities = capabilities })
lsp.gdscript.setup({ capabilities = capabilities })

-- setting up formatters
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		tex = { "latexindent" },
		java = { "google_java_format" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		handlebars = { "djlint" },
		xml = { "xmlformatter" },
		ui = { "xmlformatter" },
		cmake = { "cmakelang" },
		make = { "cmakelang" },
	},

	formatters = {
		clang_format = {
			-- to create default config, $ clang-format -style=llvm -dump-config > .clang-format
			prepend_args = { ("-style=file:" .. vim.fn.expand("~/.config/nvim/format/.clang-format")) },
		},
	},
})

-- setting up linters
local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	cmake = { "checkmake" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

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

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false,
	},
})
