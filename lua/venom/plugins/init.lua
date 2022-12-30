return {
	{
		"nvim-lualine/lualine.nvim",
		config = true,
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	{
		"Lommix/godot.nvim",
		ft = { "gd" },
		config = true,
	},
	"tjvr/vim-nearley",
	{
		"kylechui/nvim-surround",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		config = true,
	},
	"andymass/vim-matchup",
	"gpanders/editorconfig.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"navarasu/onedark.nvim",
	"marko-cerovac/material.nvim",
	"tanvirtin/monokai.nvim",
	{
		"bbenzikry/snazzybuddy.nvim",
		dependencies = "tjdevries/colorbuddy.nvim",
	},
	"EdenEast/nightfox.nvim",
	"aliou/bats.vim",
	"jghauser/mkdir.nvim",
	{
		"NvChad/nvim-colorizer.lua",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},
	"sindrets/diffview.nvim",
	"kdheepak/lazygit.nvim",
	{
		"karb94/neoscroll.nvim",
		config = true,
	},
	{ "michaelb/sniprun", build = "bash install.sh" },
	{ "turbio/bracey.vim", build = "npm install --prefix server" },

	{ "toppair/peek.nvim", build = "deno task --quiet build:fast" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	"xiyaowong/nvim-cursorword",
	"andweeb/presence.nvim",
	-- lsp,
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	{
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"onsails/lspkind.nvim",
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				filters = { custom = { "^.git$" } },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPre",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("venom.treesitter")
		end,
	},
	{
		"kdheepak/tabline.nvim",
		config = function()
			require("tabline").setup()
		end,
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
}
