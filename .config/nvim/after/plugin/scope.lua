local ok, scope = pcall(require, 'scope')

if not ok then
  return
end

scope.setup({})
