local ok, nvimtree = pcall(require, 'nvim-tree')

if not ok then
  return
end

nvimtree.setup({
  hijack_cursor = true,
  view = {
    width = 35,
  },
  renderer = {
    highlight_git = true,
    highlight_modified = 'name',
    icons = {
      show = {
        git = true,
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
})

