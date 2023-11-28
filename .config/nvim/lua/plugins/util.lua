return {
	{ "nvim-tree/nvim-web-devicons" },
	{ "neomake/neomake" },
	{
    "lewis6991/gitsigns.nvim",
      config = function()
			require("gitsigns").setup({})
		end,
	},
	{ "f-person/git-blame.nvim" },
	{ "kdheepak/lazygit.nvim" },
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{ "FooSoft/vim-argwrap" },
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup({})
		end,
	},
	{ "anuvyklack/pretty-fold.nvim", config = true },
	{ "folke/todo-comments.nvim", config = true },
  {
    "NoahTheDuke/vim-just",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "\\cjustfile", "*.just", ".justfile" },
  }
}
