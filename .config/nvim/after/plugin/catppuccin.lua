local ok, catppuccin = pcall(require, 'catppuccin')

if not ok then
  return
end

catppuccin.setup({
  transparent_background = true,
})

