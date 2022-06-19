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

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234


function Setup_tabs()
  set ruler
  set number
  set smartcase                   
  set autoindent
  set tabstop=2 shiftwidth=2 expandtab
  set smarttab
  set si
  set wrap
  set textwidth=80
  set clipboard+=unnamedplus
  set encoding=UTF-8
  set showcmd
  set showmatch
  set colorcolumn=80
  set foldmethod=indent
  set foldlevelstart=10
  set foldnestmax=10
  set termguicolors
  set mouse=a
endfunction

augroup myautocmds 
  au FileType * :call Setup_tabs()
augroup END

call plug#begin()
""" Interface
  Plug 'onsails/lspkind.nvim'
  Plug 'nacro90/numb.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'stevearc/aerial.nvim'
  Plug 'm-demare/hlargs.nvim'
 " Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'tamton-aquib/staline.nvim'
  Plug 'cloudhead/neovim-fuzzy'
"  Plug 'kosayoda/nvim-lightbulb'
  Plug 'preservim/nerdcommenter'
  Plug 'FooSoft/vim-argwrap'
  Plug 'ryanoasis/vim-devicons'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'anuvyklack/pretty-fold.nvim'
"  Plug 'RRethy/vim-illuminate'
  Plug 'kyazdani42/nvim-web-devicons' 
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'nvim-lua/popup.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'liuchengxu/vista.vim'
  Plug 'nvim-lualine/lualine.nvim'
"  Plug 'famiu/feline.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'folke/todo-comments.nvim'
  Plug 'folke/twilight.nvim'
  Plug 'nvim-telescope/telescope.nvim'
"  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  Plug 'f-person/git-blame.nvim'
  Plug 'norcalli/snippets.nvim'
  Plug 'SmiteshP/nvim-gps'
"  Plug 'hrsh7th/nvim-compe'
  Plug 'alvarosevilla95/luatab.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'lukas-reineke/virt-column.nvim'
  "" Programming
  Plug 'danymat/neogen'
  Plug 'koenverburg/peepsight.nvim'
  Plug 'p00f/clangd_extensions.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'SmiteshP/nvim-gps'
  Plug 'nvim-treesitter/playground'
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'tami5/lspsaga.nvim'
  Plug 'neomake/neomake'
  Plug 'sbdchd/neoformat'
  Plug 'Shougo/echodoc'
  Plug 'folke/trouble.nvim'
  Plug 'cdelledonne/vim-cmake' 
  Plug 'elixir-editors/vim-elixir' 
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'p00f/clangd_extensions.nvim'
  "" Themes
  Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
  Plug 'dracula/vim'
  Plug 'tiagovla/tokyodark.nvim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'Shatur/neovim-ayu'
  Plug 'bluz71/vim-moonfly-colors'
  Plug 'mangeshrex/everblush.vim'
  Plug 'rebelot/kanagawa.nvim'
  Plug 'Rigellute/shades-of-purple.vim'
  Plug 'yassinebridi/vim-purpura'
"  Plug 'gruvbox-community/gruvbox'
  Plug 'rktjmp/lush.nvim'
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'Shadorain/shadotheme'
  Plug 'ray-x/aurora'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'rose-pine/neovim'
  Plug 'sainnhe/edge'
  Plug 'mangeshrex/uwu.vim' 
  Plug 'mastertinner/nvim-quantum'
  Plug 'sheerun/vim-polyglot'
  Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
  Plug 'sainnhe/edge'
  "" Misc
  Plug 'psliwka/vim-smoothie'
  Plug 'Yggdroot/indentLine'
  Plug 'xolox/vim-misc'
  Plug 'megantiu/true.vim'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'folke/lsp-colors.nvim'
  Plug 'vhyrro/neorg'
  Plug 'ellisonleao/glow.nvim', {'branch': 'main'}
  Plug 'sindrets/diffview.nvim'
call plug#end()

let g:cmake_root_markers = ['CMakeLists.txt']
set completeopt=menu,menuone,noselect


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

nnoremap <silent> gh <cmd> lua require('lspsaga.provider').lsp_finder()<CR>
nnoremap <silent> gy <cmd> lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gd <cmd> lua require('lspsaga.provider').preview_definition()<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-\> :ArgWrap<CR>
nnoremap <C-]> <C-w><C-]><C-w>T
nnoremap <C-LEFT> <C-W><LEFT>
nnoremap <C-RIGHT> <C-W><RIGHT>
nnoremap <C-DOWN> <C-W><DOWN>
nnoremap <C-UP> <C-W><UP>

nnoremap <C-k> :Neoformat<CR>
nnoremap <C-x> :SymbolsOutline<CR>
nnoremap <C-s> :ClangdSwitchSourceHeader<CR>


map gx <Cmd>call jobstart(["xdg-open", expand ("<cfile>")])<CR>

"" THEME
"colorscheme PaperColor
"colorscheme gruvbox-baby
let g:edge_style = 'aura'
let g:edge_better_performance = 1
colorscheme kanagawa
"colorscheme edge
"set background=dark
"highlight Normal guibg='#202020'

"" Plugins settings: 

"" @NvimTreeLua
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 10
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
nnoremap <C-n> :NvimTreeOpen<CR>

" a list of groups can be found at `:help nvim_tree_highlight`
"highlight NvimTreeFolderIcon guibg=blue
"" @NEOMAKE
let g:neomake_verbose=3
"" @RAINBOW
let g:rainbow_active = 1
"" @NEOFORMAT
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_cpp_clangformat = {
  \ 'exe': 'clang-format',
  \ 'args':
  \['--style="{ TabWidth: 2,
  \ColumnLimit: 130,
  \UseTab: Never,
  \CompactNamespaces: false,
  \Cpp11BracedListStyle: true,
  \SortIncludes: false,
  \IncludeBlocks: Merge,
  \SpaceBeforeParens: Never,
  \AlignAfterOpenBracket: Align,
  \AlignConsecutiveMacros: true,
  \AlignConsecutiveAssignments: true,
  \AlignConsecutiveDeclarations: false,
  \AlignEscapedNewlines: Left,
  \AlignOperands: true,
  \AlignTrailingComments: true,
  \AllowAllArgumentsOnNextLine: true,
  \AllowAllConstructorInitializersOnNextLine: true,
  \AllowAllParametersOfDeclarationOnNextLine: true,
  \AllowShortBlocksOnASingleLine: Empty,
  \AllowShortCaseLabelsOnASingleLine: false,
  \AllowShortIfStatementsOnASingleLine: Never,
  \AllowShortLoopsOnASingleLine: false,
  \BreakBeforeBinaryOperators: NonAssignment,
  \BreakConstructorInitializers: BeforeColon,
  \BreakStringLiterals: true,
  \DerivePointerAlignment: true,
  \FixNamespaceComments: true,
  \Language: Cpp,
  \NamespaceIndentation: All,
  \PointerAlignment: Right,
  \ReflowComments: true,
  \Standard: "c++17",
  \}"'],
  \}

