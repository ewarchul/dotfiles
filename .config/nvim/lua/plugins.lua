require 'gitsigns'.setup()
require 'feline'.setup()
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
    ensure_installed = "maintained",
    highlight = {enable = true}
}

local cmp = require 'cmp'
local saga = require 'lspsaga'
saga.init_lsp_saga()

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}
    }, {{name = 'buffer'}})
})

cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

local on_attach = function(client, bufnr)
    require"lsp_signature".setup()
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<L>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)
    buf_set_keymap('n', '<space>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                   opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                   opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                   opts)
    buf_set_keymap('n', '<space>q',
                   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                   opts)
end

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = on_attach
    }

    server:setup(opts)
end)

local nvim_lsp = require("lspconfig")

nvim_lsp.r_language_server.setup {
  on_attach = on_attach
}

vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

local parser_configs = require 'nvim-treesitter.parsers'.get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = {"src/parser.c"},
        branch = "main"
    }
}

local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
    diff_binaries = false,
    file_panel = {
        position = "left",
        width = 35,
        height = 10
    },
    key_bindings = {
        disable_defaults = false,
        view = {
            ["<C-tab>"] = cb("select_next_entry"),
            ["<s-tab>"] = cb("select_prev_entry"),
            ["<leader>e"] = cb("focus_files"),
            ["<leader>b"] = cb("toggle_files")
        },
        file_panel = {
            ["j"] = cb("next_entry"),
            ["<down>"] = cb("next_entry"),
            ["k"] = cb("prev_entry"),
            ["<up>"] = cb("prev_entry"),
            ["<cr>"] = cb("select_entry"),
            ["o"] = cb("select_entry"),
            ["<2-LeftMouse>"] = cb("select_entry"),
            ["-"] = cb("toggle_stage_entry"),
            ["S"] = cb("stage_all"),
            ["U"] = cb("unstage_all"),
            ["X"] = cb("restore_entry"),
            ["R"] = cb("refresh_files"),
            ["<tab>"] = cb("select_next_entry"),
            ["<s-tab>"] = cb("select_prev_entry"),
            ["<leader>e"] = cb("focus_files"),
            ["<leader>b"] = cb("toggle_files")
        }
    }
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = {},
    auto_close = false,
    open_on_tab = false,
    update_to_buf_dir = {
        enable = true,
        auto_open = true
    },
    hijack_cursor = false,
    update_cwd = false,

    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    view = {
        width = 30,
        height = 30,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {{key = "t", cb = tree_cb("tabnew")}}
        }
    }
}
