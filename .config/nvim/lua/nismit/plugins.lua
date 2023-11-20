local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  }, -- Color Scheme
  {
    'neoclide/coc.nvim',
    branch = 'release'
  }, -- CoC
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  { 'nvim-tree/nvim-tree.lua' }, -- Filer
  { 'akinsho/toggleterm.nvim' }, -- Terminal
  { 'lewis6991/gitsigns.nvim' }, -- Git Sign
  {
    'crispgm/nvim-tabline',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = true,
  }, -- Tabline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  }, -- Status line

})
