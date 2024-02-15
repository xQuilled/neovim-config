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

	-- themes
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = false,
			})
		end,
	},
	{ "folke/tokyonight.nvim", name = "tokyonight" },
	{ "gbprod/nord.nvim", name = "nord" },
	{ "Mofiqul/dracula.nvim", name = "dracula" },
	{ "ellisonleao/gruvbox.nvim", name = "gruvbox" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "navarasu/onedark.nvim", name = "onedark" },
	"zaldih/themery.nvim",

	-- syntax highlighting, lsp, and autocompletion
	"nvim-treesitter/nvim-treesitter",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"zbirenbaum/copilot.lua",
	"williamboman/mason.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"windwp/nvim-ts-autotag",
	"stevearc/conform.nvim",
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
	"hrsh7th/cmp-cmdline",
	{ "mfussenegger/nvim-lint", event = {
		"BufReadPre",
		"BufNewFile",
	} },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- language specific tools
	"mfussenegger/nvim-jdtls",
	"lervag/vimtex",
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- debuggers
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	"rcarriga/nvim-dap-ui",

	-- git
	"kdheepak/lazygit.nvim",
	"lewis6991/gitsigns.nvim",

	-- typing and navigation tools
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	"windwp/nvim-ts-autotag",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").setup({})
			require("leap").create_default_mappings()
		end,
	},

	-- buffers
	"nvim-tree/nvim-tree.lua",
	"akinsho/toggleterm.nvim",
	"romgrk/barbar.nvim",

	-- ui and visual tools
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	},
	"goolord/alpha-nvim",
	"lukas-reineke/indent-blankline.nvim",
	"echasnovski/mini.indentscope",
	"xiyaowong/transparent.nvim",
	"norcalli/nvim-colorizer.lua",
	"folke/which-key.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"stevearc/dressing.nvim",
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- others
	{ "folke/persistence.nvim", event = "BufReadPre" },
}

local opts = {}

require("lazy").setup(plugins, opts)
