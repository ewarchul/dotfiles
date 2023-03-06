require('windows').setup()
require'range-highlight'.setup{}
require"fidget".setup{}

require("onedark").setup({
	style = "warmer",
	code_style = {
		comments = "none",
		keywords = "italic,bold",
		functions = "bold",
		strings = "none",
		variables = "none",
	},
})
require('aerial').setup()
require("nvim_context_vt").setup({})
require("numb").setup()
require("symbols-outline").setup()
require("neogen").setup({})
require("todo-comments").setup({})
require("twilight").setup({ expand = { "function", "method" } })
require("hlargs").setup()
require("virt-column").setup({})
require("quantum").setup()
require("telescope").setup({})
require("telescope").load_extension("file_browser")
require("gitsigns").setup()
require("lsp_signature").setup()
require("colorizer").setup()
require("nvim-web-devicons").get_icons()
require("nvim-treesitter.configs").setup({
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
	},
})
require("trouble").setup({})
require("nvim-treesitter.configs").setup({
	--[[    ensure_installed = "maintained",]]
	highlight = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.norg = {
	install_info = {
		url = "https://github.com/vhyrro/tree-sitter-norg",
		files = { "src/parser.c" },
		branch = "main",
	},
}

require('lspsaga').setup({
 outline = {
    win_position = 'right',
    win_with = '',
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = 'o',
      expand_collapse = 'u',
      quit = 'q',
    },
  },
	})

-- MarkdownPreview settings
vim.g.mkdp_theme = "dark"
require("toggleterm").setup()

require("luatab").setup({})

require("glow").setup({
	style = "dark",
	width = 1000,
	width_ratio = 0.9,
	height_ratio = 0.9
})
