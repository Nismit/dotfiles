local ok, tabline = pcall(require, 'tabline')

if not ok then
  return
end

tabline.setup({})
