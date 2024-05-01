local ok, gitlinker = pcall(require, 'gitlinker')
if not ok then
  return
end

gitlinker.setup({
  highlight_duration = 0,
})

vim.keymap.set({ 'n', 'v' }, '<leader>gl', '<cmd>GitLink<CR>', { silent = true, desc = "Copy the link to the current file or selection on github.com"})
vim.keymap.set({ 'n', 'v' }, '<leader>gL', '<cmd>GitLink!<CR>', { silent = true, desc = "Open the link for the current file or selection on github.com in the browser"})
