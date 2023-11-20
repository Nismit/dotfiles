require "nismit.config"
require "nismit.plugins"

local has = vim.fn.has
local is_mac = has "macunix"
local is_wsl = has "wsl"

if is_wsl == 1 then
  require "nismit.wsl"
end

