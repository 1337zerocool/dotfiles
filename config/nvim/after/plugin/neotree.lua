local ok, neotree = pcall(require, 'neo-tree')
if not ok then
  return
end

neotree.setup({
  sort_case_insensitive = true,
})

vim.keymap.set('n', '<leader>l', '<cmd>Neotree toggle<cr>')
