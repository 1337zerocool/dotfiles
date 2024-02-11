local ok, trouble = pcall(require, 'trouble')
if not ok then
  return
end
trouble.setup({
  mode = 'document_diagnostics',
  height = 5,
})
vim.keymap.set('n', '<leader>e', '<cmd>TroubleToggle document_diagnostics<cr>', { silent = true })
vim.keymap.set('n', '<leader>E', '<cmd>TroubleToggle workspace_diagnostics<cr>', { silent = true })
vim.keymap.set('n', '<leader>r', '<cmd>TroubleToggle lsp_references<cr>', { silent = true })
