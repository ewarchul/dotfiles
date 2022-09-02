local cb = require'diffview.config'.diffview_callback
require'diffview'.setup {
    diff_binaries = false,

      file_panel = {
        listing_style = "tree",             -- One of 'list' or 'tree'
        tree_options = {                    -- Only applies when listing_style is 'tree'
          flatten_dirs = true,              -- Flatten dirs that only contain one single dir
          folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
        },
        win_config = {                      -- See |diffview-config-win_config|
          position = "left",
          width = 35,
        },
      },

    key_bindings = {
        disable_defaults = false,
        view = {
            ["<C-tab>"] = cb("select_next_entry"),
            ["<s-tab>"] = cb("select_prev_entry"),
            ["<leader>e"] = cb("focus_files"),
            ["<leader>b"] = cb("toggle_files")
        },
        file_panel = {
            ["j"] = cb("next_entry"),
            ["<down>"] = cb("next_entry"),
            ["k"] = cb("prev_entry"),
            ["<up>"] = cb("prev_entry"),
            ["<cr>"] = cb("select_entry"),
            ["o"] = cb("select_entry"),
            ["<2-LeftMouse>"] = cb("select_entry"),
            ["-"] = cb("toggle_stage_entry"),
            ["S"] = cb("stage_all"),
            ["U"] = cb("unstage_all"),
            ["X"] = cb("restore_entry"),
            ["R"] = cb("refresh_files"),
            ["<tab>"] = cb("select_next_entry"),
            ["<s-tab>"] = cb("select_prev_entry"),
            ["<leader>e"] = cb("focus_files"),
            ["<leader>b"] = cb("toggle_files")
        }
    }
}
