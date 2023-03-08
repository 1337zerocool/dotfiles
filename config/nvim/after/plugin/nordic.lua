local ok, nordic = pcall(require, 'nordic')
if not ok then
  return
end

nordic.colorscheme({
  underline_option = 'none',
  italic = true,
  italic_comments = false,
  minimal_mode = false,
  alternate_backgrounds = false
})
vim.api.nvim_set_hl(0, 'SpellBad', { sp='#BF616A', undercurl=true })
vim.api.nvim_set_hl(0, 'CmpMenuBorder', { fg='#434C5E', bg= '#2E3440'})
vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', { fg='#88c0d0', bg='#4c566a' })
vim.api.nvim_set_hl(0, 'NeoTreeFloatNormal', { fg='#d8dee9', bg='#2e3440' })
vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg='#4c566a', bg='#2e3440' })

-- needs some virtualtext highlight group colors set
-- vim.diagnostic.config({ virtual_text = true })
