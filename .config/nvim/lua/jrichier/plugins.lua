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
  use 'wbthomason/packer.nvim'

  use 'navarasu/onedark.nvim' -- Color theme

  use 'nvim-lualine/lualine.nvim' -- Status line
  use 'kyazdani42/nvim-web-devicons' -- Be able to use Nerd Font in status line & other
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'akinsho/nvim-bufferline.lua' -- To have a nice buffer line
  use 'kyazdani42/nvim-tree.lua'

end)
