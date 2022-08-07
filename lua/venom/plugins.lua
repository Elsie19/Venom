return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'
        use {
                'nvim-lualine/lualine.nvim',
                requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        use 'preservim/nerdtree'
        use 'Xuyuanp/nerdtree-git-plugin'
        use 'mattn/emmet-vim'
        use 'rust-lang/rust.vim'
        use 'tjvr/vim-nearley'
        use 'sheerun/vim-polyglot'
        use 'tpope/vim-surround'
        use 'tmsvg/pear-tree'
        use 'ryanoasis/vim-devicons'
        use 'Yggdroot/indentLine'
        use 'andymass/vim-matchup'
        use 'dense-analysis/ale'
        use {
                'habamax/vim-godot',
                ft = {'gd'}
        }
        use 'editorconfig/editorconfig-vim'
        use 'preservim/nerdcommenter'
        use 'joshdick/onedark.vim'
        use 'drewtempelmeyer/palenight.vim'
        use 'sickill/vim-monokai'
        use 'connorholyday/vim-snazzy'
        use 'EdenEast/nightfox.nvim'
        use 'aliou/bats.vim'
        use 'mhinz/vim-startify'
        use 'pbrisbin/vim-mkdir'
        use 'lilydjwg/colorizer'
        use 'airblade/vim-gitgutter'
        use 'tpope/vim-fugitive'
        use 'samoshkin/vim-mergetool'
        use 'kdheepak/lazygit.nvim'
        use 'psliwka/vim-smoothie'
        use { 'turbio/bracey.vim', run = 'npm install --prefix server' }
        use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
        use 'ctrlpvim/ctrlp.vim'
        use { 'michaelb/sniprun', run = 'bash install.sh' }
        use 'itchyny/vim-cursorword'
        use 'andweeb/presence.nvim'
        use '/home/henry/.local/share/nvim/site/pack/themes/start/dracula_pro'
        -- lsp
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'
        use 'lewis6991/impatient.nvim'
        use 'jayli/vim-easycomplete'
        use {
          "nanozuki/tabby.nvim",
          config = function() require("tabby").setup() end,
        }
        use 'kyazdani42/nvim-tree.lua'
        use {
          'nvim-treesitter/nvim-treesitter',
          run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        }
end)
