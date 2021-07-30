syntax enable
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
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10
set termguicolors
set mouse=a

set filetype=on

function Setup_tabs()
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
  set foldmethod=indent
  set foldlevelstart=10
  set foldnestmax=10
  set termguicolors
  set mouse=a
endfunction

augroup myautocmds 
  au FileType * echom "test"
  au FileType * :call Setup_tabs()
augroup END

call plug#begin()
""" Interface
  Plug 'cloudhead/neovim-fuzzy'
  Plug 'preservim/nerdcommenter'
  Plug 'FooSoft/vim-argwrap'
  Plug 'ryanoasis/vim-devicons'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'RRethy/vim-illuminate'
  Plug 'kyazdani42/nvim-web-devicons' 
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  Plug 'f-person/git-blame.nvim'
  "" Programming
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'hrsh7th/nvim-compe'
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'neomake/neomake'
  Plug 'sbdchd/neoformat'
  Plug 'Shougo/echodoc'
  Plug 'folke/trouble.nvim'
  Plug 'cdelledonne/vim-cmake' 
  "" Themes
  Plug 'dracula/vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'Shadorain/shadotheme'
  "" Misc
  Plug 'psliwka/vim-smoothie'
  Plug 'Yggdroot/indentLine'
  Plug 'xolox/vim-misc'
  Plug 'megantiu/true.vim'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'folke/lsp-colors.nvim'
  Plug 'vhyrro/neorg'

call plug#end()

let g:cmake_root_markers = ['CMakeLists.txt']


lua << EOF
require('plugins')
EOF

"" symbols-outline
let g:symbols_outline = {
    \ "highlight_hovered_item": v:true,
    \ "show_guides": v:true,
    \ "position": 'right',
    \ "auto_preview": v:true,
    \ "keymaps": {
        \ "close": "<Esc>",
        \ "goto_location": "<Cr>",
        \ "focus_location": "o",
        \ "hover_symbol": "<C-space>",
        \ "rename_symbol": "r",
        \ "code_actions": "a",
    \ },
    \ "lsp_blacklist": [],
\ }

"" BINDINGS 
nnoremap <silent> gy :Lspsaga rename<CR> 
nnoremap <silent>gh :Lspsaga hover_doc<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>

nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <C-\> :ArgWrap<CR>
nnoremap <C-]> <C-w><C-]><C-w>T
nnoremap <C-LEFT> <C-W><LEFT>
nnoremap <C-RIGHT> <C-W><RIGHT>
nnoremap <C-DOWN> <C-W><DOWN>
nnoremap <C-UP> <C-W><UP>

"" THEME
colorscheme gruvbox

"" Plugins settings: 

"" @NvimTreeLua
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 30
let g:nvim_tree_auto_open = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }

let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
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


