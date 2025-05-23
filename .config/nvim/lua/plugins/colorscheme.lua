return {
  { "luisiacc/gruvbox-baby" },
  { "sainnhe/gruvbox-material" },
  -- {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     require("onedark").setup({
  --       style = "warmer",
  --     })
  --   end,
  -- },
  { "rmehri01/onenord.nvim" },
  { "ray-x/aurora" },
  { "olimorris/onedarkpro.nvim" },
  { "nvimdev/zephyr-nvim" },
  { "NTBBloodbath/doom-one.nvim" },
  { "FrenzyExists/aquarium-vim" },
  { "maxmx03/FluoroMachine.nvim" },
  { "yazeed1s/oh-lucy.nvim" },
  { "dasupradyumna/midnight.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "marko-cerovac/material.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "sainnhe/edge" },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").load()
    end,
  },
  { "blazkowolf/gruber-darker.nvim" },
  { "projekt0n/github-nvim-theme" },
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup({
        code_style = {
          comments = { italic = true },
          conditionals = { italic = false },
          keywords = {},
          functions = { bold = true },
          namespaces = { italic = true },
          parameters = { italic = false },
          strings = {},
          variables = {},
        },
        colors = {
          bg0 = "#050505"
        }
      })
      require("bamboo").load()
    end,
  },
  { 'shaunsingh/nord.nvim' },
  { 'scottmckendry/cyberdream.nvim' },
  { 'sho-87/kanagawa-paper.nvim' },
  { 'niyabits/calvera-dark.nvim' },
  { 'sontungexpt/witch' },
  { "folke/tokyonight.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "loctvl842/monokai-pro.nvim" },
  { "miikanissi/modus-themes.nvim", priority = 1000 },
  { "bluz71/vim-moonfly-colors",    name = "moonfly",    lazy = false,   priority = 1000 },
  { "srcery-colors/srcery-vim" },
  { "catppuccin/nvim",              name = "catppuccin", priority = 1000 },
  {
    "ilof2/posterpole.nvim",
    config = function()
      require("posterpole").setup({
        brightness = -5,
        fg_saturation = 25,
        bg_saturation = 1,
      })
    end,
  }
}
