local ok, overseer = pcall(require, 'overseer')
if not ok then
  return
end

overseer.setup({})
-- https://github.com/stevearc/overseer.nvim/blob/master/doc/reference.md#setup-options
-- CR = action menu
-- e = edit task
-- o = open in window
-- f = open in float
-- p = open in preview pane
-- d = dispose
-- v = more detail
-- V = less detail
-- [ = smaller
-- ] = bigger
-- { = last
-- } = next
-- q = close
-- ? = binding
vim.keymap.set('n', '<leader>a', '<cmd>OverseerRun<cr>', { silent = true })
vim.keymap.set('n', '<leader>A', '<cmd>OverseerToggle<cr>', { silent = true })
vim.keymap.set('v', '<leader>a', '<cmd>OverseerRun<cr>', { silent = true })
vim.keymap.set('v', '<leader>T', '<cmd>OverseerToggle<cr>', { silent = true })
