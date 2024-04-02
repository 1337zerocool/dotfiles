local ok, gitlinker = pcall(require, 'gitlinker')
if not ok then
  return
end

gitlinker.setup({
  highlight_duration = 0,
})

vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>GitLink<CR>', { silent = true })
vim.api.nvim_set_keymap('v', '<leader>gl', '<cmd>GitLink<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gL', '<cmd>GitLink!<CR>', { silent = true })
vim.api.nvim_set_keymap('v', '<leader>gL', '<cmd>GitLink!<CR>', { silent = true })
