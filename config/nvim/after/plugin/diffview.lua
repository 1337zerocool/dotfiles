local ok, _ = pcall(require, 'diffview')
if not ok then
  return
end
vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>')