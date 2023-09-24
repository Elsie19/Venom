return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup {
				options = { theme = "dracula-nvim" },
				extensions = { 'nvim-dap-ui', 'nvim-tree' },
			}
		end,
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"Lommix/godot.nvim",
		ft = { "gd" },
		config = true,
		event = "VeryLazy",
	},
	"tjvr/vim-nearley",
	{
		"kylechui/nvim-surround",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				enable_check_bracket_line = false,
			})
		end,
	},
	{
		"andymass/vim-matchup",
		event = "VeryLazy",
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "VeryLazy",
	},
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
		config = function()
			require 'colorizer'.setup()
			require("colorizer").attach_to_buffer(0, { mode = "background", css = true })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
	},
	"kdheepak/lazygit.nvim",
	{
		"karb94/neoscroll.nvim",
		config = true,
		event = "VeryLazy",
	},
	{ "turbio/bracey.vim", build = "npm install --prefix server" },
	{ "toppair/peek.nvim", build = "deno task --quiet build:fast" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"xiyaowong/nvim-cursorword",
		event = "VeryLazy",
	},
	{
		"andweeb/presence.nvim",
		config = function()
			require("presence").setup({
				enable_line_number = true,
			})
		end,
	},
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
		event = "VeryLazy",
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
		event = "VeryLazy",
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
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
			})
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
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
	},
	"Mofiqul/dracula.nvim",
	{
		"NoahTheDuke/vim-just",
		event = "VeryLazy",
	},
	{ "rcarriga/nvim-dap-ui",           dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" } },
	({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	}),
	"mhartington/formatter.nvim",
	{
		"p00f/clangd_extensions.nvim",
		config = function()
			require("clangd_extensions").setup({
				extensions = {
					autoSetHints = true,
					inlay_hints = {
						only_current_line = false,
						show_parameter_hints = true,
						parameter_hints_prefix = "↞ ",
						other_hints_prefix = "➾ ",
						highlight = "Comment",
					}
				}
			})
		end,
	},
	{
		"LhKipp/nvim-nu",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require('nvim-ts-autotag').setup()
		end,
	},
}
