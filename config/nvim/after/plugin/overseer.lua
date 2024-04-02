local ok, overseer = pcall(require, 'overseer')
if not ok then
  return
end

overseer.setup({})

-- CR = action menu
-- e = edit task
-- o = open in window
-- f = open in float
-- p = open in preview pane
-- v = more detail
-- V = less detail
-- [ = smaller
-- ] = bigger
-- { = last
-- } = next
-- q = close
-- ? = binding
vim.keymap.set('n', '<leader>t', '<cmd>OverseerRun<cr>', { silent = true })
vim.keymap.set('n', '<leader>T', '<cmd>OverseerToggle<cr>', { silent = true })
vim.keymap.set('v', '<leader>t', '<cmd>OverseerRun<cr>', { silent = true })
vim.keymap.set('v', '<leader>T', '<cmd>OverseerToggle<cr>', { silent = true })
