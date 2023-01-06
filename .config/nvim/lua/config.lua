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
vim.opt.background = "dark"
vim.opt.foldlevel = 50 -- Not fold
-- CoC Recommend config
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.g.coc_global_extensions = { 'coc-json', 'coc-tsserver', 'coc-html', 'coc-prettier' }
-- Mac default terminal does not support 24bit colors
vim.opt.termguicolors = true
local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin')
if not ok then
  vim.cmd 'colorscheme default'
end

-- Keymaps

-- Terminal
vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })

-- Screen
vim.api.nvim_set_keymap('n', '<leader>sj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sk', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ss', '<C-u>:sp<CR><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', '<C-u>:vs<CR><C-w>i', { noremap = true, silent = true })

-- Plugins
vim.api.nvim_set_keymap('n', '<leader>j', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- Treesitter
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

