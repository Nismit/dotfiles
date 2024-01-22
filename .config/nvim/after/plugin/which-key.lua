local ok, whichKey = pcall(require, 'which-key')

if not ok then
  return
end

whichKey.register {
  ['<leader>s'] = { name = '[S]creen[sv|hjkl]', _ = 'which_key_ignore' },
}


