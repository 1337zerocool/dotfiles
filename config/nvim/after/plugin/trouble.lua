local ok, trouble = pcall(require, 'trouble')
if not ok then
  return
end
trouble.setup({
  mode = 'document_diagnostics',
  height = 8,
})

vim.keymap.set('n', '<leader>E', '<cmd>TroubleToggle workspace_diagnostics<cr>', { silent = true })
vim.keymap.set('n', '<leader>R', '<cmd>TroubleToggle lsp_references<cr>', { silent = true })

-- Just so you remember, the default virtual text for errors is in settings.lua,
-- if you use e to show line diagnostic with sata you'll need to change the document_diagnostics and workspace_diagnostics above.
-- also, references are provided by lspsaga in a window
