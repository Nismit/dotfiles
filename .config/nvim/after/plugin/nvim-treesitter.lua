local ok, treesitter = pcall(require, 'nvim-treesitter')

if not ok then
  return
end

treesitter.setup({
  ensure_installed = { 'c', 'lua', 'rust', 'javascript', 'typescript', 'tsx', 'html', 'css', 'glsl' },
  auto_install = true,
})

