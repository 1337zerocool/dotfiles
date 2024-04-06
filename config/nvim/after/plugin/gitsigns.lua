local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
  return
end
gitsigns.setup({
   signcolumn = false,
   current_line_blame = false,
})
local opt = { silent = true }
vim.keymap.set('n', '<leader>gs', '<cmd>Gitsigns toggle_signs<cr>', opt)
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame_line<cr>', opt)
vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns diffthis<cr>', opt)
