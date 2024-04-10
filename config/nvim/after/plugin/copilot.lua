local ok, copilot = pcall(require, 'copilot')
if not ok then
  return
end

copilot.setup({
  suggestion = {
    enabled = false
  },
  panel = {
    enabled = false,
    auto_refresh = true,
    layout = {
      position = "right",
      ratio = 0.4
    },
  },
})

vim.keymap.set('n', '<leader>cc', '<cmd>Copilot panel<cr>', { silent = true })
vim.keymap.set('n', '<leader>cd', '<cmd>Copilot disable<cr>', { silent = true })
vim.keymap.set('n', '<leader>ce', '<cmd>Copilot enable<cr>', { silent = true })
