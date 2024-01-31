local ok, indent = pcall(require, 'indent_blankline')
if not ok then
  return
end

indent.setup({ })

-- maybe this belongs in the nordic config. There is no harm in setting
-- colours for HL groups that don't exist
vim.api.nvim_set_hl(0, 'IndentBlankLineChar', { fg='#3B4252' })
vim.api.nvim_set_hl(0, 'IndentBlankLineContextChar', { fg='#4C566A' })
vim.api.nvim_set_hl(0, 'IndentBlankLineContextStart', { underline=true, sp='#4C566A' })
