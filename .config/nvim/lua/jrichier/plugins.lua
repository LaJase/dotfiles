local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

---@diagnostic disable-next-line: unused-local
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  use { 'nvim-lua/plenary.nvim' } -- Common utilities
  use { "kyazdani42/nvim-web-devicons"}

  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "kyazdani42/nvim-tree.lua" }
  use { "nvim-lualine/lualine.nvim" }
  use { 'akinsho/nvim-bufferline.lua' } -- To have a nice buffer line}
  use { 'onsails/lspkind-nvim' } -- vscode-like pictograms
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "goolord/alpha-nvim" }
  use { 'windwp/nvim-ts-autotag' }

  -- doesnt seems to work with my actual theme
  use { "RRethy/vim-illuminate"}

  -- Colorschemes
  use { "folke/tokyonight.nvim" }
  use { "lunarvim/darkplus.nvim" }
  use { "navarasu/onedark.nvim" }
  --[[ use { "monsonjeremy/onedark.nvim" } ]]

  -- cmp plugins
  use { "hrsh7th/cmp-path" } -- path completions
  use { "hrsh7th/cmp-cmdline" } -- cmdline completions
  use { "hrsh7th/nvim-cmp"} -- The completion plugin
  use { "hrsh7th/cmp-buffer"} -- buffer completions
  use { "hrsh7th/cmp-nvim-lsp"}
  use { "hrsh7th/cmp-nvim-lua"}
  use { "saadparwaiz1/cmp_luasnip"} -- snippet completions

  -- snippets
  use { "L3MON4D3/LuaSnip"} --snippet engine
  use { "rafamadriz/friendly-snippets"} -- a bunch of snippets to use

  -- LSP server manager
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }

  -- get the things done
  use { "neovim/nvim-lspconfig"} -- enable LSP
  use { 'glepnir/lspsaga.nvim' }
  use { "jose-elias-alvarez/null-ls.nvim"} -- for formatters and linters
  use { "folke/trouble.nvim" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim"}

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Git
  use { "lewis6991/gitsigns.nvim"}

  use 'norcalli/nvim-colorizer.lua'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
