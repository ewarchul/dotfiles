--- startup and add configure plugins
require('packer_init')
require('plugins/init')
require('plugins/lsp')
require('plugins/cmp')
require('plugins/clangd')
require('plugins/nvim-tree')
require('plugins/diffview')

-- load neovim options
require('core/options')
require('core/bindings')
require('core/themes')

