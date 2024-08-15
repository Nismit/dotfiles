local ok, whichKey = pcall(require, 'which-key')

if not ok then
  return
end

whichKey.add({
  {
    { '<leader>s', group = '[S]creen[sv|hjkl]' },
    { '<leader>s_', hidden = true },
  }
})


