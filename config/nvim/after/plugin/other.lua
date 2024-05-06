local ok, other = pcall(require, 'other-nvim')
if not ok then
  return
end


other.setup({
  style = {
    border = 'solid',
  },
  mappings = {
    'rails',
  },
})
print('loaded other')
vim.keymap.set({ "n", "v" }, "<leader>m", "<cmd>Other<cr>", { silent = true, desc = "Load alternate file" })
