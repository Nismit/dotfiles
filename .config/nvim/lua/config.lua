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
vim.opt.foldlevel = 99
vim.opt.hidden = true
vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

local set = vim.keymap.set

set("n", "s", "<Nop>", { silent = true })
set("n", "S", "<Nop>", { silent = true })
set("n", "<ESC><ESC>", ":noh<CR>", { silent = true })

set("n", "<Tab>", ":bnext<CR>")
set("n", "<S-Tab>", ":bprev<CR>")
set("n", "<leader>bd", ":bd<CR>")

set("n", "<leader>ss", "<C-u>:sp<CR><C-w>j", { silent = true })
set("n", "<leader>sv", "<C-u>:vs<CR><C-w>l", { silent = true })
set("n", "<leader>sh", "<C-w>h", { silent = true })
set("n", "<leader>sl", "<C-w>l", { silent = true })
set("n", "<leader>sk", "<C-w>k", { silent = true })
set("n", "<leader>sj", "<C-w>j", { silent = true })

set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
set("n", "<leader>n", ":NvimTreeFocus<CR>", { silent = true })
set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.frag", "*.vert", "*.glsl" },
  command = "set filetype=glsl | TSEnable highlight",
})

vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
  pattern = "*",
  command = "normal zR",
})
