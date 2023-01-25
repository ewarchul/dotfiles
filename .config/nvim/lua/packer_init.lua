vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- LSP
	use({
		"neovim/nvim-lspconfig",
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use("onsails/lspkind.nvim")
	use("ray-x/lsp_signature.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("williamboman/nvim-lsp-installer")
	use("mfussenegger/nvim-dap")
	-- Status lines
	use("tamton-aquib/staline.nvim")
	use("nvim-lualine/lualine.nvim")
	--use("adelarsq/neoline.vim")
	-- Tree
	use("kyazdani42/nvim-tree.lua")
	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	-- Terminal
	use("akinsho/toggleterm.nvim")
	-- Markdown
	use({ "ellisonleao/glow.nvim" })
	-- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("kdheepak/lazygit.nvim")
	-- TreeSitter
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/playground")
	use("nvim-treesitter/nvim-treesitter-context")
	use("haringsrob/nvim_context_vt")
	-- Interface tweaks
	use({
		"nvim-zh/colorful-winsep.nvim",
		config = function()
			require("colorful-winsep").setup()
		end,
	})
	use({
		"anuvyklack/windows.nvim",
		requires = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
	})
	use("sindrets/winshift.nvim")
	use("fgheng/winbar.nvim")
	use("nacro90/numb.nvim")
	use("stevearc/aerial.nvim")
	use("m-demare/hlargs.nvim")
	use("cloudhead/neovim-fuzzy")
	use("preservim/nerdcommenter")
	use("FooSoft/vim-argwrap")
	use("NvChad/nvim-colorizer.lua")
	use("simrat39/symbols-outline.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lua/popup.nvim")
	use("liuchengxu/vista.vim")
	use("nvim-lua/plenary.nvim")
	use("folke/todo-comments.nvim")
	use("folke/twilight.nvim")
	use("norcalli/snippets.nvim")
	use("SmiteshP/nvim-navic")
	use("lukas-reineke/virt-column.nvim")
	use("koenverburg/peepsight.nvim")
	use("Shougo/echodoc")
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use({ "alvarosevilla95/luatab.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use("danilamihailov/beacon.nvim")
	--   Programming
	use("danymat/neogen")
	use("glepnir/lspsaga.nvim")
	use("neomake/neomake")
	use("sbdchd/neoformat")
	use("cdelledonne/vim-cmake")

	-- use { 'mhartington/formatter.nvim' }
	use("folke/trouble.nvim")
	-- C++
	use("p00f/clangd_extensions.nvim")
	-- Elixir
	use("elixir-editors/vim-elixir")
	-- Just
	use("IndianBoy42/tree-sitter-just")
	-- Themes
	use("Iron-E/nvim-highlite")
	use("titanzero/zephyrium")
	use("projekt0n/github-nvim-theme")
	use("luisiacc/gruvbox-baby")
	use("dracula/vim")
	use("tiagovla/tokyodark.nvim")
	use("NLKNguyen/papercolor-theme")
	use("EdenEast/nightfox.nvim")
	use("Shatur/neovim-ayu")
	use("bluz71/vim-moonfly-colors")
	use("mangeshrex/everblush.vim")
	use("rebelot/kanagawa.nvim")
	use("Rigellute/shades-of-purple.vim")
	use("yassinebridi/vim-purpura")
	use("rktjmp/lush.nvim")
	use("alaric/nortia.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("sonph/onehalf")
	use("Shadorain/shadotheme")
	use("ray-x/aurora")
	use("folke/tokyonight.nvim")
	use("rose-pine/neovim")
	use("sainnhe/edge")
	use("mangeshrex/uwu.vim")
	use("mastertinner/nvim-quantum")
	use("sheerun/vim-polyglot")
	use("pineapplegiant/spaceduck")
	use({
		"ray-x/starry.nvim",
		setup = function()
			vim.g.starry_italic_comments = true
		end,
	})
	use("Mofiqul/adwaita.nvim")
	use("tjdevries/colorbuddy.vim")
	use("bkegley/gloombuddy")
	use("yonlu/omni.vim")
	--use("olimorris/onedarkpro.nvim")
	use("navarasu/onedark.nvim")
	use({ "kaiuri/nvim-juliana" })
	use({
		"ramojus/mellifluous.nvim",
		requires = { "rktjmp/lush.nvim" },
		config = function()
			require("mellifluous").setup({ --[[...]]
			}) -- optional, see configuration section.
			vim.cmd("colorscheme mellifluous")
		end,
	})
	--  Misc
	use("psliwka/vim-smoothie")
	use("xolox/vim-misc")
	use("megantiu/true.vim")
	use("p00f/nvim-ts-rainbow")
	use("folke/lsp-colors.nvim")
	use("sindrets/diffview.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
end)
