-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ewarchul/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ewarchul/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ewarchul/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ewarchul/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ewarchul/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["adwaita.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/adwaita.nvim",
    url = "https://github.com/Mofiqul/adwaita.nvim"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  aurora = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/aurora",
    url = "https://github.com/ray-x/aurora"
  },
  ["clangd_extensions.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/clangd_extensions.nvim",
    url = "https://github.com/p00f/clangd_extensions.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  echodoc = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/echodoc",
    url = "https://github.com/Shougo/echodoc"
  },
  edge = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/edge",
    url = "https://github.com/ewarchul/edge"
  },
  ["everblush.vim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/everblush.vim",
    url = "https://github.com/mangeshrex/everblush.vim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-baby"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["hlargs.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["luatab.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/luatab.nvim",
    url = "https://github.com/alvarosevilla95/luatab.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  neogen = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["neoline.vim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/neoline.vim",
    url = "https://github.com/adelarsq/neoline.vim"
  },
  neomake = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/neomake",
    url = "https://github.com/neomake/neomake"
  },
  neovim = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/neovim",
    url = "https://github.com/rose-pine/neovim"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["neovim-fuzzy"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/neovim-fuzzy",
    url = "https://github.com/cloudhead/neovim-fuzzy"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nortia.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nortia.nvim",
    url = "https://github.com/alaric/nortia.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["numb.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-quantum"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-quantum",
    url = "https://github.com/mastertinner/nvim-quantum"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  nvim_context_vt = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt"
  },
  onehalf = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/onehalf",
    url = "https://github.com/sonph/onehalf"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/papercolor-theme",
    url = "https://github.com/NLKNguyen/papercolor-theme"
  },
  ["peepsight.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/peepsight.nvim",
    url = "https://github.com/koenverburg/peepsight.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["shades-of-purple.vim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/shades-of-purple.vim",
    url = "https://github.com/Rigellute/shades-of-purple.vim"
  },
  shadotheme = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/shadotheme",
    url = "https://github.com/Shadorain/shadotheme"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/snippets.nvim",
    url = "https://github.com/norcalli/snippets.nvim"
  },
  spaceduck = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/spaceduck",
    url = "https://github.com/pineapplegiant/spaceduck"
  },
  ["staline.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/staline.nvim",
    url = "https://github.com/tamton-aquib/staline.nvim"
  },
  ["starry.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/opt/starry.nvim",
    url = "https://github.com/ray-x/starry.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["true.vim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/true.vim",
    url = "https://github.com/megantiu/true.vim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["uwu.vim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/uwu.vim",
    url = "https://github.com/mangeshrex/uwu.vim"
  },
  vim = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim",
    url = "https://github.com/dracula/vim"
  },
  ["vim-argwrap"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim-argwrap",
    url = "https://github.com/FooSoft/vim-argwrap"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim-cmake",
    url = "https://github.com/cdelledonne/vim-cmake"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim-elixir",
    url = "https://github.com/elixir-editors/vim-elixir"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim-misc",
    url = "https://github.com/xolox/vim-misc"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-purpura"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim-purpura",
    url = "https://github.com/yassinebridi/vim-purpura"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim-smoothie",
    url = "https://github.com/psliwka/vim-smoothie"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  },
  ["virt-column.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/virt-column.nvim",
    url = "https://github.com/lukas-reineke/virt-column.nvim"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["winbar.nvim"] = {
    loaded = true,
    path = "/home/ewarchul/.local/share/nvim/site/pack/packer/start/winbar.nvim",
    url = "https://github.com/fgheng/winbar.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: starry.nvim
time([[Setup for starry.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\27starry_italic_comments\6g\bvim\0", "setup", "starry.nvim")
time([[Setup for starry.nvim]], false)
time([[packadd for starry.nvim]], true)
vim.cmd [[packadd starry.nvim]]
time([[packadd for starry.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
