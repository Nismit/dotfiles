vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.mouse = "a"
-- Mac default terminal does not support 24bit colors
-- vim.opt.termguicolors = true
vim.cmd [[ colorscheme iceberg ]]

--[[
vim.api.nvim_create_autocmd({'TermOpen'},{
  pattern = '*',
  command = 'startinsert',
})

vim.api.nvim_create_autocmd({'TermOpen'},{
  pattern = '*',
  command = 'setlocal nonumber norelativenumber nocursorline',
})

vim.api.nvim_create_user_command(
  'T',
  'split | wincmd j | terminal',
  {
    nargs = 0,
  }
)
]]

-- Keymaps

-- Terminal
vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })

-- Screen
vim.api.nvim_set_keymap('n', '<leader>sj', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sk', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ss', '<C-u>sp<CR><C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sv', '<C-u>vs<CR><C-w>i', { noremap = true })

-- Plugins
vim.api.nvim_set_keymap('n', '<leader>j', ':ToggleTerm<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })

