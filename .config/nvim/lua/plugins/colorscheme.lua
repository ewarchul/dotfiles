return {
	{ "luisiacc/gruvbox-baby" },
	{ "sainnhe/gruvbox-material" },
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "warmer",
			})
		end,
	},
	{ "rmehri01/onenord.nvim" },
	{ "ray-x/aurora" },
	--	{ "olimorris/onedarkpro.nvim" },
	{ "nvimdev/zephyr-nvim" },
	{ "NTBBloodbath/doom-one.nvim" },
	{ "FrenzyExists/aquarium-vim" },
	{ "maxmx03/FluoroMachine.nvim" },
	{ "yazeed1s/oh-lucy.nvim" },
	{ "dasupradyumna/midnight.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "marko-cerovac/material.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "sainnhe/edge" },
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
	{ "blazkowolf/gruber-darker.nvim" },
	{ "projekt0n/github-nvim-theme" },
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				-- optional configuration here
			})
			require("bamboo").load()
		end,
	},
  { 'shaunsingh/nord.nvim' },
  { 'scottmckendry/cyberdream.nvim' },
  { 'sho-87/kanagawa-paper.nvim' },
  { 'niyabits/calvera-dark.nvim' },
  { 'sontungexpt/witch' },
}
