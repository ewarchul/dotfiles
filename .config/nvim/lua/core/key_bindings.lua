-- wrapper for the vim.api.nvim_set_keymap
function key_mapper(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

key_mapper("n", "<C-LEFT>", "<C-W><LEFT>")
key_mapper("n", "<C-RIGHT>", "<C-W><RIGHT>")
key_mapper("n", "<C-DOWN>", "<C-W><DOWN>")
key_mapper("n", "<C-UP>", "<C-W><UP>")

key_mapper("n", "<C-w>", ":ArgWrap<CR>", { silent = true })
key_mapper("n", "<C-a>", ":ClangdSwitchSourceHeader<CR>", { silent = true })
key_mapper("n", "<C-n>", ":NvimTreeOpen<CR>", { silent = true })
key_mapper("n", "<space>f", ":lua require'conform'.format()<CR>", { silent = true })
key_mapper("n", "<leader>]", ":lua vim.lsp.buf.format()<CR>", { silent = true })

key_mapper("n", "<C-x>", ":Lspsaga outline<CR>", { silent = true })

key_mapper("n", "gh", ":Lspsaga finder def+ref<CR>", { silent = true })
key_mapper("n", "gy", ":Lspsaga rename<CR>", { silent = true })
key_mapper("n", "gd", ":Lspsaga peek_definition<CR>", { silent = true })
key_mapper("n", "gc", ":Lspsaga code_action<CR>", { silent = true })
key_mapper("n", "gK", ":Lspsaga hover_doc<CR>", { silent = true })

key_mapper("n", "<C-f>", ":WindowsMaximize<CR>", { silent = true })

key_mapper("n", "<C-s>", ":WinShift<CR>", { silent = true })

key_mapper("n", "<Leader>ff", ":Telescope find_files<CR>")
key_mapper("n", "<Leader>fg", ":FzfLua live_grep<CR>")
key_mapper("n", "<Leader>fb", ":Telescope buffers<CR>")
key_mapper("n", "<Leader>fh", ":Telescope help_tags<CR>")

key_mapper("n", "<Leader>l", ":LazyGit<CR>")

key_mapper("n", "<Leader>x", ":Trouble document_diagnostics<CR>")
key_mapper("n", "<Leader>X", ":TroubleClose<CR>")

key_mapper("n", "<Leader>s", ":split<CR>")
key_mapper("n", "<Leader>v", ":vsplit<CR>")
key_mapper("n", "<Leader>q", ":close<CR>")

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

vim.api.nvim_set_keymap("n", "gK", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
