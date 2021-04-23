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
"" Interface

Plug 'cloudhead/neovim-fuzzy'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'FooSoft/vim-argwrap'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'xolox/vim-easytags'
Plug 'Shougo/defx.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'ludovicchabant/vim-gutentags'

" Programming

Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'prabirshrestha/vim-lsp' " vim-lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc'
Plug 'lervag/vimtex'
Plug 'vim-scripts/a.vim'
Plug 'deoplete-plugins/deoplete-clang'
Plug 'cespare/vim-toml'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'LnL7/vim-nix'

" Languages 

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ekalinin/Dockerfile.vim'
Plug 'lifepillar/pgsql.vim'

" Themes

Plug 'dracula/vim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sickill/vim-monokai'

" Misc

Plug 'roxma/nvim-yarp'
Plug 'enricobacis/vim-airline-clock'
Plug 'junegunn/goyo.vim'
Plug 'luochen1990/rainbow'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
Plug 'xolox/vim-misc'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'megantiu/true.vim'


call plug#end()

" Functions


" BINDINGS 

nnoremap <C-p> :FZF<CR>
nnoremap <C-\> :ArgWrap<CR>
nnoremap <C-]> <C-w><C-]><C-w>T

" THEME

"colorscheme gruvbox
colorscheme true


" Plugins settings: 

" @NERDTREE

let g:NERDTreeShowHidden = 1
"let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd VimEnter * NERDTree | wincmd p

" @COC

let g:coc_diagnostic_disable = 1
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <c-space> coc#refresh()

" @NEOMAKE

let g:neomake_verbose=3

" @RAINBOW

let g:rainbow_active = 1

" @DEOPLETE

let g:deoplete#enable_at_startup = 1

" @NEOFORMAT

let g:neoformat_cpp_clangformat = {
  \ 'exe': 'clang-format',
  \ 'args': ['--style="{IndentWidth: 2}"'],
  \}

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" @HASKELL-VIM

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"set local formatprg=hindent

" @FZF

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" @TAGBAR
nmap <F8> :TagbarToggle<CR>
