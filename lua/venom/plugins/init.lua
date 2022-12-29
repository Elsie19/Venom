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
	"editorconfig/editorconfig-vim",
	"preservim/nerdcommenter",
	"joshdick/onedark.vim",
	"drewtempelmeyer/palenight.vim",
	"sickill/vim-monokai",
	"connorholyday/vim-snazzy",
	"EdenEast/nightfox.nvim",
	"aliou/bats.vim",
	"mhinz/vim-startify",
	"pbrisbin/vim-mkdir",
	"lilydjwg/colorizer",
	"airblade/vim-gitgutter",
	"tpope/vim-fugitive",
	"samoshkin/vim-mergetool",
	"kdheepak/lazygit.nvim",
	"psliwka/vim-smoothie",
	{ "michaelb/sniprun", build = "bash install.sh" },
	{ "turbio/bracey.vim", build = "npm install --prefix server" },

	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"ctrlpvim/ctrlp.vim",
	"itchyny/vim-cursorword",
	"andweeb/presence.nvim",
	-- lsp,
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"rafamadriz/friendly-snippets",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",
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
}
