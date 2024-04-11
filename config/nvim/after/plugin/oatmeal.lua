local ok, oatmeal = pcall(require, "oatmeal")
if not ok then
  return
end

oatmeal.setup({
  backend = "ollama",
  model = "dolphin-mixtral:latest",
  close_terminal_on_quit = true,
})

vim.keymap.del('n', '<leader>om')
vim.keymap.del('v', '<leader>om')

vim.keymap.set({ 'n', 'v' }, '<leader>co', '<cmd>Oatmeal<cr>', { silent = true })
