vim.o.tabline = '%!v:lua.require\'luatab\'.tabline()'
local gps = require("nvim-gps")

require'colorizer'.setup()
  require'nvim-web-devicons'.get_icons()
  require'nvim-treesitter.configs'.setup {
    rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    }
  }
  require("trouble").setup {}
  local saga = require 'lspsaga'
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", 
    highlight = {
      enable = true
    },
  }
  saga.init_lsp_saga()

  local nvim_lsp = require('lspconfig')
  require'lspinstall'.setup()

  local on_attach = function(client, bufnr)
    require "lsp_signature".setup()
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<L>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{ on_attach = on_attach }
  end
  require'lspconfig'.rnix.setup{}

  -- Compe setup
    require'compe'.setup {
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;
      documentation = true;
      source = {
        path = true;
        nvim_lsp = true;
        neorg = true;
      };
    }

    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            return true
        else
            return false
        end
    end

    _G.tab_complete = function()
      if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
      elseif check_back_space() then
        return t "<Tab>"
      else
        return vim.fn['compe#complete']()
      end
    end
    _G.s_tab_complete = function()
      if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
      else
        return t "<S-Tab>"
      end
    end
  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

  local gl = require('galaxyline')
  local gls = gl.section
  gl.short_line_list = {'LuaTree','vista','dbui'}

  local colors = {
    bg = '#282c34',
    yellow = '#fabd2f',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#afd700',
    orange = '#FF8800',
    purple = '#5d4d7a',
    magenta = '#d16d9e',
    grey = '#c0c0c0',
    blue = '#0087d7',
    red = '#ec5f67'
  }

  local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
      return true
    end
    return false
  end

  gls.left[1] = {
    nvimGPS = {
          provider = function()
            return gps.get_location()
          end,
          condition = function()
            return gps.is_available()
          end,
          highlight = {colors.blue,colors.yellow}
    },
    FirstElement = {
      provider = function() return '▋' end,
      highlight = {colors.blue,colors.yellow}
    },
  }
  gls.left[2] = {
    ViMode = {
      provider = function()
        local alias = {n = 'NORMAL',i = 'INSERT',c= 'COMMAND',v= 'VISUAL',V= 'VISUAL LINE', [''] = 'VISUAL BLOCK'}
        return alias[vim.fn.mode()]
      end,
      separator = '',
      separator_highlight = {colors.purple,function()
        if not buffer_not_empty() then
          return colors.purple
        end
        return colors.darkblue
      end},
      highlight = {colors.darkblue,colors.purple,'bold'},
    },
  }
  gls.left[3] ={
    FileIcon = {
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.darkblue},
    },
  }
  gls.left[4] = {
    FileName = {
      provider = {'FileName','FileSize'},
      condition = buffer_not_empty,
      separator = '',
      separator_highlight = {colors.purple,colors.darkblue},
      highlight = {colors.magenta,colors.darkblue}
    }
  }

  gls.left[5] = {
    GitIcon = {
      provider = function() return '  ' end,
      condition = buffer_not_empty,
      highlight = {colors.orange,colors.purple},
    }
  }
  gls.left[6] = {
    GitBranch = {
      provider = 'GitBranch',
      condition = buffer_not_empty,
      highlight = {colors.grey,colors.purple},
    }
  }

  local checkwidth = function()
    local squeeze_width  = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
      return true
    end
    return false
  end

  gls.left[7] = {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.green,colors.purple},
    }
  }
  gls.left[8] = {
    DiffModified = {
      provider = 'DiffModified',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.orange,colors.purple},
    }
  }
  gls.left[9] = {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.red,colors.purple},
    }
  }
  gls.left[10] = {
    LeftEnd = {
      provider = function() return '' end,
      separator = '',
      separator_highlight = {colors.purple,colors.bg},
      highlight = {colors.purple,colors.purple}
    }
  }
  gls.left[11] = {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '  ',
      highlight = {colors.red,colors.bg}
    }
  }
  gls.left[12] = {
    Space = {
      provider = function () return ' ' end
    }
  }
  gls.left[13] = {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = {colors.blue,colors.bg},
    }
  }
  gls.right[1]= {
    FileFormat = {
      provider = 'FileFormat',
      separator = '',
      separator_highlight = {colors.bg,colors.purple},
      highlight = {colors.grey,colors.purple},
    }
  }
  gls.right[2] = {
    LineInfo = {
      provider = 'LineColumn',
      separator = ' | ',
      separator_highlight = {colors.darkblue,colors.purple},
      highlight = {colors.grey,colors.purple},
    },
  }
  gls.right[3] = {
    PerCent = {
      provider = 'LinePercent',
      separator = '',
      separator_highlight = {colors.darkblue,colors.purple},
      highlight = {colors.grey,colors.darkblue},
    }
  }
  gls.right[4] = {
    ScrollBar = {
      provider = 'ScrollBar',
      highlight = {colors.yellow,colors.purple},
    }
  }

  gls.short_line_left[1] = {
    BufferType = {
      provider = 'FileTypeName',
      separator = '',
      separator_highlight = {colors.purple,colors.bg},
      highlight = {colors.grey,colors.purple}
    }
  }

  gls.short_line_right[1] = {
    BufferIcon = {
      provider= 'BufferIcon',
      separator = '',
      separator_highlight = {colors.purple,colors.bg},
      highlight = {colors.grey,colors.purple}
    }
  }

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main"
    },
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
  {
    key = "t",
    cb = tree_cb("tabnew")
  }
}

require("nvim-gps").setup({
	icons = {
		["class-name"] = ' ',      -- Classes and class-like objects
		["function-name"] = ' ',   -- Functions
		["method-name"] = ' '      -- Methods (functions inside class-like objects)
	},
	-- Disable any languages individually over here
	-- Any language not disabled here is enabled by default
	languages = {
		-- ["bash"] = false,
		-- ["go"] = false,
	},
	separator = ' > ',
})

local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  file_panel = {
    position = "left",      -- One of 'left', 'right', 'top', 'bottom'
    width = 35,             -- Only applies when position is 'left' or 'right'
    height = 10,            -- Only applies when position is 'top' or 'bottom'
    use_icons = true        -- Requires nvim-web-devicons
  },
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<C-tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file 
      ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),          -- Stage all entries.
      ["U"]             = cb("unstage_all"),        -- Unstage all entries.
      ["X"]             = cb("restore_entry"),      -- Restore entry to the state on the left side.
      ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    }
  }
}
