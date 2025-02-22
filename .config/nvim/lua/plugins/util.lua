return {
  { "nvim-tree/nvim-web-devicons" },
  { "neomake/neomake" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },
  { "f-person/git-blame.nvim" },
  { "kdheepak/lazygit.nvim" },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  { "FooSoft/vim-argwrap" },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup({})
    end,
  },
  { "folke/todo-comments.nvim", config = true },
  {
    "NoahTheDuke/vim-just",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "\\cjustfile", "*.just", ".justfile" },
  },
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          cpp = { "clang_format" },
          lua = { "stylua" },
          python = { "black" },
          r = { "styler" },
          rust = { "rustfmt" },
          vue = { "volar" },
        },
      })
    end,
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {
      }
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  {
    "wallpants/github-preview.nvim",
    cmd = { "GithubPreviewToggle" },
    opts = {
    },
    config = function(_, opts)
      local gpreview = require("github-preview")
      gpreview.setup(opts)
    end,
  }

}
