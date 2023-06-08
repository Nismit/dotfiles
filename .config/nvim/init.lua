require "nismit.config"
require "nismit.plugins"

local has = vim.fn.has
local is_mac = has "macunix"
local is_wsl = has "wsl"

if is_wsl == 1 then
  require "nismit.wsl"
end

-- Packer will be generated /plugin/packer_compiled.lua
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "nismit/plugins.lua" },
  command = "source <afile> | PackerCompile",
})
