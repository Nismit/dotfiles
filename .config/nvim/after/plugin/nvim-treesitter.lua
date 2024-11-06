local ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if not ok then
  return
end

treesitter.setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    'c',
    'lua',
    'rust',
    'javascript',
    'typescript',
    'tsx',
    'html',
    'css',
    'glsl'
  },
  auto_install = true,
})

