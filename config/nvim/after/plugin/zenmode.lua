local ok, zenmode = pcall(require, 'zen-mode')
if not ok then
  return
end
zenmode.setup({})
vim.keymap.set('n', '<leader><cr>', '<cmd>ZenMode<CR>', { silent = true })
