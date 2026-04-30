require "config"
require "plugins"

if vim.fn.has("wsl") == 1 then
  require "wsl"
end

