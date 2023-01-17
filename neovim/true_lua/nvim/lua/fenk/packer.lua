vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- For fuzzy finding or something like that
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = {{'nvim-lua/plenary.nvim'}}
	}

	-- Rose pine colorscheme
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocomplete
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippers
			{'L3MON4D3/LuaSnip'},
			{"rafamadriz/friendly-snippets"},
		}
	}
	use('nvim-lualine/lualine.nvim')
	use('lukas-reineke/indent-blankline.nvim')
	use('tpope/vim-sleuth')
	-- use('kamykn/spelunker')
end)
