-- Lazy packer manager bootstrap
require("lazy_bootstrap")
require("lazy").setup("plugins")

-- load neovim options
require("core/opts")
require("core/key_bindings")
require("core/color")

vim.api.nvim_create_autocmd("VimEnter", {
  command = "Neotree toggle",
})

