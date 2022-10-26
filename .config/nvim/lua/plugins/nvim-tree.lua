local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = {},
    open_on_tab = false,
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
        side = 'left',
        mappings = {
            custom_only = false,
            list = {{key = "t", cb = tree_cb("tabnew")}}
        }
    },
    git = {
      ignore = false,
    },
}
