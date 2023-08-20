return {
	{ "j-hui/fidget.nvim" },
  { "nvim-lua/plenary.nvim"},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = { theme = "aurora" },
			})
		end,
	},
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "m-demare/hlargs.nvim" },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"anuvyklack/windows.nvim",
		dependencies = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" },
		config = true,
	},
	{ "winston0410/cmd-parser.nvim" },
	{ "winston0410/range-highlight.nvim" },
	{ "danilamihailov/beacon.nvim" },
	{ "kevinhwang91/nvim-ufo" },
	{ "nacro90/numb.nvim" },
	{ "sindrets/winshift.nvim" },
	{ "SmiteshP/nvim-navic" },
	{
		"fgheng/winbar.nvim",
		config = function()
			vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
		end,
	},
	{ "RRethy/vim-illuminate" },
}
