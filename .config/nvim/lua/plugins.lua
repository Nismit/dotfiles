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

  -- Filer
  -- use 'lambdalisue/fern.vim'
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup({
        hijack_cursor = true,
        renderer = {
          icons = {
            webdev_colors = false,
            show = {
              file = false,
            },
            glyphs = {
              default = '',
              folder = {
                default = '',
                arrow_closed = '→',
                arrow_open = '↓',
                open = '',
              },
              git = {
                unstaged = '✗',
              	staged = '✓',
              	unmerged = '>>',
              	renamed = '➜',
              	untracked = '★',
              	deleted = '-',
              	ignored = '◌',
            	},
            },
          },
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })
    end
  }

  -- Terminal
  use({
    'akinsho/toggleterm.nvim', tag = '*',
    config = function()
      require('toggleterm').setup({
        persist_mode = false,
      })
    end
  })


  -- Tabline
  use({
    'crispgm/nvim-tabline',
    config = function()
      require('tabline').setup({})
    end,
  })

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = false,
          section_separators = '|',
          component_separators = '',
        },
      })
    end
  }

  -- Git sign
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Color Scheme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- CoC
  use {
    'neoclide/coc.nvim', branch = 'release',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
