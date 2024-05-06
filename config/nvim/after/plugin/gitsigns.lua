local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
  return
end

gitsigns.setup({
   signcolumn = false,
   current_line_blame = false,
})

-- figure out how to get the gd to be on the right side with the new code
vim.keymap.set({ 'n', 'v' }, '<leader>gs', gitsigns.toggle_signs, { silent = true, desc = "Git show changes in sign column" })
vim.keymap.set({ 'n', 'v' }, '<leader>gb', function() gitsigns.blame_line({ full = true }) end, { silent = true, desc = "Git blame the current line" })
vim.keymap.set({ 'n', 'v' }, '<leader>gd', gitsigns.diffthis, { silent = true, desc = "Git diff this file" })
vim.keymap.set({ 'n', 'v' }, ']g', gitsigns.next_hunk, { silent = true, desc = "Git next hunk" })
vim.keymap.set({ 'n', 'v' }, '[g', gitsigns.prev_hunk, { silent = true, desc = "Git previous hunk" })
