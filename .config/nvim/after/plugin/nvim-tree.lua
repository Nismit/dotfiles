local ok, nvimtree = pcall(require, 'nvim-tree')

if not ok then
  return
end



local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local function swap_then_open_tab()
    local node = api.tree.get_node_under_cursor()
    vim.cmd("wincmd l")
    api.tree.close()
    api.node.open.tab(node)
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- <CR> opens a file with a new tab instead of buffer
  vim.keymap.set('n', 't', swap_then_open_tab, opts('Open: New Tab'))
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
  on_attach = my_on_attach,
})
