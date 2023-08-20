return {
	{ "neomake/neomake" },
	{ "lewis6991/gitsigns.nvim" },
	{ "f-person/git-blame.nvim" },
	{ "kdheepak/lazygit.nvim" },
	{ "preservim/nerdcommenter" },
	{ "FooSoft/vim-argwrap" },
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup({})
		end,
	},
  { "anuvyklack/pretty-fold.nvim", config = true },
  
}
