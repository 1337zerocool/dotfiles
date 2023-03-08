local ok, saga = pcall(require, 'lspsaga')
if not ok then
  return
end

saga.setup({
  ui = {
    title = false,
    border = 'rounded',
  },
  diagnostic = {
    on_insert = false,
    on_insert_follow = false,
    border_follow = false,
  },
  lightbulb = {
    enable = false
  },
  symbol_in_winbar = {
    enable = false,
  },
})
