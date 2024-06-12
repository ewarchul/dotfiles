return {
  { 'nvim-tree/nvim-web-devicons' },
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
					preserve_window_proportions = true,
				},
			})
		end,
	},
	{ "folke/trouble.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = { theme = "aurora" },
			})
		end,
	},
	{
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          previewer = true,
          vimgrep_arguments = {
            "rg",
            "--line-number",
            "--column",
            "--smart-case",
          }
        }
      })
    end,
	},
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "m-demare/hlargs.nvim" },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
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
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
  { "HiPhish/rainbow-delimiters.nvim"},
  {
  "nvim-zh/colorful-winsep.nvim",
  config = true,
  event = { "WinNew" },
  },
  { "ibhagwan/fzf-lua" },
}
