local ok, overseer = pcall(require, 'overseer')
if not ok then
  return
end
overseer.setup({
  task_list = {
    direction = 'right',
  },
})
vim.keymap.set('n', '<leader>t', '<cmd>OverseerRun<cr>', { silent = true })
vim.keymap.set('n', '<leader>T', '<cmd>OverseerToggle<cr>', { silent = true })
