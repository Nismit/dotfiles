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

vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':T<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
