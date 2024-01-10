local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"lewis6991/gitsigns.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-treesitter/nvim-treesitter",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"zbirenbaum/copilot.lua",
	{ "williamboman/mason.nvim", dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	} },
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"mfussenegger/nvim-jdtls",

	"hrsh7th/nvim-cmp",
	{
		"hrsh7th/cmp-nvim-lsp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
		},
	},
	{ "mfussenegger/nvim-lint", event = {
		"BufReadPre",
		"BufNewFile",
	} },
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	"rcarriga/nvim-dap-ui",
	"stevearc/conform.nvim",
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	"akinsho/toggleterm.nvim",
	"kdheepak/lazygit.nvim",

	"romgrk/barbar.nvim",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	"folke/todo-comments.nvim",
	"goolord/alpha-nvim",
	"rcarriga/nvim-notify",
	"stevearc/dressing.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"echasnovski/mini.indentscope",

	"lervag/vimtex",
}

local opts = {}

require("lazy").setup(plugins, opts)
