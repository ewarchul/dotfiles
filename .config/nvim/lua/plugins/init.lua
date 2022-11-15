require('nvim_context_vt').setup({})
require('numb').setup()
require('aerial').setup({})
require("symbols-outline").setup()
require('neogen').setup {}
require("todo-comments").setup {}
require("twilight").setup {expand = {"function", "method"}}
require('hlargs').setup()
require("virt-column").setup{}
require('quantum').setup()
require('telescope').setup{}
require("telescope").load_extension "file_browser"
require 'gitsigns'.setup()
require 'lsp_signature'.setup()
require'colorizer'.setup()
require'nvim-web-devicons'.get_icons()
require'nvim-treesitter.configs'.setup {
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000,
    }
}
require 'trouble'.setup {}
require'nvim-treesitter.configs'.setup {
--[[    ensure_installed = "maintained",]]
    highlight = {enable = true},
 rainbow = {
    enable = true,
    extended_mode = true, 
    max_file_lines = nil, 
  }
}

local parser_configs = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = {"src/parser.c"},
        branch = "main"
    }
}
local saga = require('lspsaga')
--saga.init_lsp_saga()


-- MarkdownPreview settings
vim.g.mkdp_theme = "dark"
require("toggleterm").setup{}

