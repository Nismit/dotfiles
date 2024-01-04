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
  -- vim.keymap.set('n', 't', swap_then_open_tab, opts('Open: New Tab'))
end

local HEIGHT_RATIO = 0.8  -- You can change this
local WIDTH_RATIO = 0.5   -- You can change this too

nvimtree.setup({
  hijack_cursor = true,
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
        end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
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
