local ok, trouble = pcall(require, 'trouble')
if not ok then
  return
end
trouble.setup({
  mode = 'document_diagnostics',
  height = 5,
})
vim.keymap.set('n', '<leader>EE', '<cmd>TroubleToggle document_diagnostics<cr>', { silent = true })
vim.keymap.set('n', '<leader>EEE', '<cmd>TroubleToggle workspace_diagnostics<cr>', { silent = true })
vim.keymap.set('n', '<leader>R', '<cmd>TroubleToggle lsp_references<cr>', { silent = true })
