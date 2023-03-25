-- Lazy packer manager bootstrap
require("lazy_bootstrap")
require("lazy").setup("plugins")

-- load neovim options
require("core/opts")
require("core/key_bindings")
require("core/color")

vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("UiEnter", {
	desc = "Open Neotree automatically",
	group = "neotree",
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("Neotree toggle")
		end
	end,
})
