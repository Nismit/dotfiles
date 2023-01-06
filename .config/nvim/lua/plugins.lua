-- packer.nvim bootstrap
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-tree/nvim-tree.lua' } -- Filer
  use { 'akinsho/toggleterm.nvim', tag = '*' } -- Terminal
  use { 'crispgm/nvim-tabline' } -- Tabline
  use { 'nvim-lualine/lualine.nvim' } -- Status line
  use { 'lewis6991/gitsigns.nvim' } -- Git Sign
  use { "catppuccin/nvim", as = "catppuccin" } -- Color Scheme
  use { 'neoclide/coc.nvim', branch = 'release' } -- CoC
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
