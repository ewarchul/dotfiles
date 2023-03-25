-- Lazy packer manager bootstrap
require("lazy_bootstrap")
require("lazy").setup("plugins")

vim.api.nvim_create_autocmd("VimEnter", {
	command = "set nornu nonu | Neotree toggle",
})
vim.api.nvim_create_autocmd("BufEnter", {
	command = "set rnu nu",
})

-- load neovim options
require("core/opts")
require("core/key_bindings")
require("core/color")
