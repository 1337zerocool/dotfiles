local ok, indent = pcall(require, 'ibl')
if not ok then
  return
end

indent.setup({
  scope = { enabled = false },
})

vim.api.nvim_set_hl(0, 'IndentBlankLineChar', { fg='#3B4252' })
vim.api.nvim_set_hl(0, 'IndentBlankLineContextChar', { fg='#4C566A' })
vim.api.nvim_set_hl(0, 'IndentBlankLineContextStart', { underline=true, sp='#4C566A' })
