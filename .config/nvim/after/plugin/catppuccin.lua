local ok, catppuccin = pcall(require, 'catppuccin')

if not ok then
  return
end

catppuccin.setup({
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  integrations = {
    treesitter = true,
    telescope = { enabled = true },
    indent_blankline = {
      enabled = true,
      scope_color = "",
      colored_indent_levels = false,
    },
  },
})

vim.cmd.colorscheme "catppuccin"
