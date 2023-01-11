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
vim.opt.foldlevel = 5
vim.opt.hidden = true
vim.opt.swapfile = true
-- CoC Recommend config
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.g.coc_global_extensions = { 'coc-json', 'coc-tsserver', 'coc-html', 'coc-prettier', 'coc-eslint' }
-- Mac default terminal does not support 24bit colors
vim.opt.termguicolors = true
local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin')
if not ok then
  vim.cmd 'colorscheme default'
end

-- Keymaps

vim.api.nvim_set_keymap('n', 's', '<Nop>', { noremap = true, silent = true }) -- disable default s on normal mode
vim.api.nvim_set_keymap('n', 'S', '<Nop>', { noremap = true, silent = true }) -- disable default S on normal mode

-- Tab
vim.api.nvim_set_keymap('n', '<leader>st', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', 'gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', 'gT', { noremap = true, silent = true })

-- Buffer
vim.api.nvim_set_keymap('n', '<leader>bn', ':bNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true })

-- Terminal
vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })

-- Screen
-- vim.api.nvim_set_keymap('n', '<leader>sj', '<C-w>j', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>sk', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ss', '<C-u>:sp<CR><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', '<C-u>:vs<CR><C-w>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s<Left>', '<C-w><Left><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s<Right>', '<C-w><Right><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s<Up>', '<C-w><Up><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s<Down>', '<C-w><Down><CR>', { noremap = true, silent = true })

-- Plugins
vim.api.nvim_set_keymap('n', '<leader>j', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })


-- Treesitter
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- GLSL file type support
-- Treesitter doesn't enable highlight automatically
local au_filetype = vim.api.nvim_create_augroup('fileType', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'GLSL file type',
  pattern = '*.glsl, *.frag, *.vert',
  group = au_filetype,
  command = 'set filetype=glsl | :TSEnable highlight',
})

local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
      vim.api.nvim_command('augroup END')
  end
end


local autoCommands = {
  -- other autocommands
  open_folds = {
    { 'BufReadPost, FileReadPost', '*', 'normal zR' }
  }
}

M.nvim_create_augroups(autoCommands)
