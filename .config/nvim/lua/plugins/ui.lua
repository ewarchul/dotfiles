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
					},
				},
			})
		end,
	},
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "m-demare/hlargs.nvim" },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "winston0410/cmd-parser.nvim" },
	{ "winston0410/range-highlight.nvim" },
	{ "danilamihailov/beacon.nvim" },
	{ "nacro90/numb.nvim" },
	{ "sindrets/winshift.nvim" },
	{ "SmiteshP/nvim-navic" },
	-- {
	-- 	"fgheng/winbar.nvim",
	-- 	config = function()
	-- 		vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
	-- 	end,
	-- },
	{ "RRethy/vim-illuminate" },
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{ "HiPhish/rainbow-delimiters.nvim" },
	{
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = { "WinNew" },
	},
	{ "ibhagwan/fzf-lua" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
}
