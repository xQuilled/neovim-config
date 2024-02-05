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

	"folke/which-key.nvim",

	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	{
		"lewis6991/gitsigns.nvim",
		cofing = function()
			require("gitsigns").setup()
		end,
	},
	"nvim-lualine/lualine.nvim",

	-- syntax highlighting, lsp, and autocompletion
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
	"windwp/nvim-ts-autotag",
	"mfussenegger/nvim-jdtls",
	"lervag/vimtex",
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

	-- debuggers
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	"rcarriga/nvim-dap-ui",

	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	"windwp/nvim-ts-autotag",
	"akinsho/toggleterm.nvim",
	"kdheepak/lazygit.nvim",
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	"romgrk/barbar.nvim",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{ "folke/persistence.nvim", event = "BufReadPre" },

	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	},
	"goolord/alpha-nvim",
	"rcarriga/nvim-notify",
	"stevearc/dressing.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"echasnovski/mini.indentscope",
	"xiyaowong/transparent.nvim",
	"norcalli/nvim-colorizer.lua",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").setup({})
			require("leap").create_default_mappings()
		end,
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
