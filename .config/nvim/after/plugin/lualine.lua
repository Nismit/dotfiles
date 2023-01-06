local ok, lualine = pcall(require, 'lualine')

if not ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = false,
    section_separators = '|',
    component_separators = '',
  },
})

