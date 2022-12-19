vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.api.nvim_create_autocmd({'TermOpen'},{
  pattern = '*',
  command = 'startinsert',
})

vim.api.nvim_create_autocmd({'TermOpen'},{
  pattern = '*',
  command = 'setlocal nonumber norelativenumber nocursorline',
})

vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':Fern . -reveal=% -drawer -toggle -width=40<cr>', { noremap = true })

