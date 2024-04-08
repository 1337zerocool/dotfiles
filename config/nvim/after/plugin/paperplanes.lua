local ok, paperplanes = pcall(require, 'paperplanes')
if not ok then
  return
end

paperplanes.setup({
  register = "+",
  provider = "gist",
  provider_options = {
    command = "gh"
  },
  notifier = vim.notify or print,
})

-- needs better bindings. Doesn't reliably use visual select
vim.keymap.set('n', '<leader>gg', '<cmd>PP<cr>')
vim.keymap.set('v', '<leader>gg', "<cmd>'<,'>PP<cr>")
