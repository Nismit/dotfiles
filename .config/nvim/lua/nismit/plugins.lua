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
  {
    'gennaro-tedesco/nvim-possession',
    dependencies = {
      { 'junegunn/fzf', build = "./install --bin" },
      'ibhagwan/fzf-lua',
    },
    config = true,
    init = function()
      local possession = require('nvim-possession')
      vim.keymap.set("n", "<leader>sl", function()
        possession.list()
      end, { desc = 'Open sessions list' })
      vim.keymap.set("n", "<leader>sn", function()
        possession.new()
      end, { desc = 'Save new session' })
      vim.keymap.set("n", "<leader>su", function()
        possession.update()
      end, { desc = 'Update session' })
      vim.keymap.set("n", "<leader>sd", function()
        possession.delete()
      end, { desc = 'Delete session' })
    end,
  },
}

local opts = {
  install = {
    colorscheme = { 'catppuccin' },
  },
}

require("lazy").setup(plugins, opts);
