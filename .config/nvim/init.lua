require "config"
require "plugins"

-- Packer will be generated /plugin/packer_compiled.lua 

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "plugins.lua" },
  command = "PackerCompile",
})
