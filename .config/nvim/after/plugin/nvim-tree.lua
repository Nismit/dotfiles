local ok, nvimtree = pcall(require, 'nvim-tree')

if not ok then
  return
end

nvimtree.setup({
  hijack_cursor = true,
  renderer = {
    icons = {
      webdev_colors = false,
      show = {
        file = false,
      },
      glyphs = {
        default = '',
        folder = {
          default = '',
          arrow_closed = '→',
          arrow_open = '↓',
          open = '',
        },
        git = {
          unstaged = '✗',
          staged = '✓',
          unmerged = '>>',
          renamed = '➜',
          untracked = '★',
          deleted = '-',
          ignored = '◌',
        },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
})

