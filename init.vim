set ruler
set number
set smartcase                   
set autoindent
set tabstop=2 shiftwidth=2 expandtab
set smarttab
set si
set wrap
set textwidth=79
set clipboard+=unnamedplus
set encoding=UTF-8
set showcmd
set showmatch
set colorcolumn=79
set foldmethod=syntax
set foldlevelstart=10
set foldnestmax=10
set mouse=a

syntax enable

call plug#begin()

""" Interface
Plug 'neovim/nvim-lspconfig'
Plug 'cloudhead/neovim-fuzzy'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'FooSoft/vim-argwrap'
Plug 'ryanoasis/vim-devicons'

"" Programming
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'hrsh7th/nvim-compe'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'Shougo/echodoc'

"" Themes
Plug 'dracula/vim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sickill/vim-monokai'

"" Misc
Plug 'enricobacis/vim-airline-clock'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
Plug 'xolox/vim-misc'
Plug 'megantiu/true.vim'

call plug#end()

"" nvim-tree-sitter { NEOVIM 0.5 }

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = {
    enable = true
  },
}
EOF

"" nvim-lspoconfig { NEOVIM 0.5 } 
lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local servers = {
  "clangd",
  "bashls",
  "angularls",
  "rnix",
  "jsonls",
  "html",
  "dockerls",
  "yamlls",
  "r_language_server",
  "tsserver"
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
require'lspconfig'.sqls.setup{
  cmd = {"/home/ewarchul/sqls", "-config", "/home/ewarchul/dbconfig.yml"};
}
EOF



"" nvim-compe { NEOVIM 0.5 }
lua << EOF
-- Compe setup
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    source = {
      path = true;
      nvim_lsp = true;
    };
  }

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
      local col = vim.fn.col('.') - 1
      if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          return true
      else
          return false
      end
  end

  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    else
      return t "<S-Tab>"
    end
  end

  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

"" BINDINGS 

"nnoremap <C-p> :FZF<CR>
nnoremap <C-\> :ArgWrap<CR>
nnoremap <C-]> <C-w><C-]><C-w>T

"" THEME

colorscheme gruvbox

"" Plugins settings: 

"" @NERDTREE

let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd VimEnter * NERDTree | wincmd p

"" @NEOMAKE

let g:neomake_verbose=3

"" @RAINBOW

let g:rainbow_active = 1

"" @NEOFORMAT

let g:neoformat_cpp_clangformat = {
  \ 'exe': 'clang-format',
  \ 'args': ['--style="{IndentWidth: 2}"'],
  \}

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
