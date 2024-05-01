local ok, neotest = pcall(require, 'neotest')
if not ok then
  return
end

local ok_minitest, neotest_minitest = pcall(require, 'neotest-minitest')
if not ok_minitest then
  return
end

local ok_overseer, overseer = pcall(require, 'neotest.consumers.overseer')
if not ok_overseer then
  return
end


neotest.setup({
  overseer = {
    enabled = true,
    force_default = true,
  },
  consumers = {
    overseer = overseer,
  },
  adapters = {
    neotest_minitest,
  },
})

vim.keymap.set({ 'n','v' }, "<leader>T", neotest.summary.toggle, { silent = true, desc="Toggle test summary" })
vim.keymap.set({ 'n','v' }, "<leader>t", neotest.overseer.run, { silent = true, desc="Run tests" })
-- vim.keymap.set({ 'n','v' }, "]t", neotest.jump.next({ status = 'failed' }) { silent = true, desc="Jump to next failing test" })
-- vim.keymap.set({ 'n','v' }, "[t", neotest.jump.prev({ status = 'failed' }), { silent = true, desc="Jump to previous failing test" })
