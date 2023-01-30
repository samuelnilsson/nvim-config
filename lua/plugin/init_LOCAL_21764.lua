-- Auto install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git", "clone", "https://github.com/wbthomason/packer.nvim",
		install_path
	})
	execute("packadd packer.nvim")
end

-- Packages
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function() require("plugin.treesitter") end
	})

	use({
		"neovim/nvim-lspconfig",
		config = function() require("plugin.lspconfig") end
	})

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'onsails/lspkind.nvim'
	use 'SirVer/ultisnips'
	use 'honza/vim-snippets'
	use 'quangnguyen30192/cmp-nvim-ultisnips'
	use({ 'hrsh7th/nvim-cmp', config = function() require("plugin.cmp") end })

	use({
		'glepnir/lspsaga.nvim',
		branch = 'main',
		config = function() require("plugin.lspsaga") end
	})

	use({
		"ray-x/lsp_signature.nvim",
		config = function() require("lsp_signature").setup({}) end
	})

	use {
		'nvim-orgmode/orgmode',
		config = function() require('plugin.orgmode') end
	}

	use("navarasu/onedark.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function() require("plugin.telescope") end
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function() require("plugin.gitsigns") end
	})

	use({
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup() end
	})

	use("dstein64/nvim-scrollview")

	use 'nvim-lua/lsp-status.nvim'
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function() require("plugin.lualine") end
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function() require("plugin.nvimtree") end
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function() require("colorizer").setup() end
	})

	use("tpope/vim-fugitive")

	use("b3nj5m1n/kommentary")

	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")
	use("kristijanhusak/vim-dadbod-completion")

	use("diepm/vim-rest-console")

	use({
		"puremourning/vimspector",
		config = function() require("plugin.vimspector") end
	})
end)
