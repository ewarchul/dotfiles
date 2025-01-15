return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        ui = {
          enable = true,
          code_action = ''

        },
      })
    end,
  },
  { "williamboman/nvim-lsp-installer" },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        "nvimdev/lspsaga.nvim",
      },
    },
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = false,
        update_in_insert = false,
        virtual_text = false, --{ spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      autoformat = false,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        clangd = {
          mason = false,
          cmd = {
            "clangd",
            "--function-arg-placeholders=false",
            "--enable-config",
            "--fallback-style=llvm",
            "--header-insertion=iwyu",
            "--background-index",
            "--completion-style=detailed",
            "--pretty",
            "--j=4",
          },
          single_file_support = true,
        },
        volar = {
          mason = false,
          cmd = {
            "/home/user/.nvm/versions/node/v18.20.4/bin/vue-language-server",
            "--stdio",
          },
          init_options = {
            filetypes = {
              'vue',
            },
          }
        },
        ts_ls = {
          mason = false,
          cmd = {
            "/home/user/.nvm/versions/node/v18.20.4/bin/typescript-language-server",
            "--stdio",
          },
          init_options = {
            filetypes = {
              "javascript",
              "typescript",
            },
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "/home/user/.nvm/versions/node/v18.20.4/lib/node_modules/@vue/typescript-plugin",
                languages = { "vue" },
              },
            },
          }

        },
        ruff = {
          mason = false,
          cmd = { "ruff-lsp" },
        },
        pyright = {
          mason = true,
        },
        r_language_server = {
          mason = true,
        },
        rust_analyzer = {
          mason = false,
        },
        cmake = {
          mason = false,
          cmd = { "cmake-language-server" },
        },
        zls = {
          mason = false,
          cmd = {
            "/usr/bin/zls"
          }
        },
        lua_ls = {
          mason = false,
          cmd = {
            "/usr/local/bin/lua-language-server"
          }
        },
        jsonls = {
          mason = false,
          cmd = {
            "/home/user/.nvm/versions/node/v18.20.4/bin/vscode-json-language-server",
            "--stdio"
          }
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- setup autoformat

      local servers = opts.servers
      local capabilities =
          require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      local all_mslp_servers = {}

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          setup(server)
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
}
