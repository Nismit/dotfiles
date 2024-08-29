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
  { 'lewis6991/gitsigns.nvim' }, -- Git Sign
  { 'folke/which-key.nvim' }, -- Key bind Helper
  { 'numToStr/Comment.nvim' }, -- Comment out toggle
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
  }, -- Color Scheme
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  }, -- LSP Config enhancement
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
  }, -- Indent
}

local opts = {
  install = {
    colorscheme = { 'catppuccin' },
  },
}

require("lazy").setup(plugins, opts);
