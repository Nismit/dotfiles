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

local plugins = {
  { 'nvim-treesitter/nvim-treesitter' }, -- Tree Sitter
  { 'nvim-tree/nvim-tree.lua' }, -- Filer
  { 'akinsho/toggleterm.nvim' }, -- Terminal
  { 'lewis6991/gitsigns.nvim' }, -- Git Sign
  { 'folke/which-key.nvim' }, -- Key bind Helper
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
  }, -- Color Scheme
  {
    'neoclide/coc.nvim',
    branch = 'release'
  }, -- CoC
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  }, -- Bufferline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  }, -- Status line
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
}

local opts = {
  install = {
    colorscheme = { 'catppuccin' },
  },
}

require("lazy").setup(plugins, opts);
