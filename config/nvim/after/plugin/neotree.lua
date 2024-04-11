local ok, neotree = pcall(require, 'neo-tree')
if not ok then
  return
end

neotree.setup({
  window = {
    position = "right",
    width = 40,
  },
  consumers = {
    overseer = require("neotest.consumers.overseer"),
  },
  sources = {
    "filesystem",
    "git_status",
  },
  sort_case_insensitive = true,
  enable_git_status = false,
  enable_diagnostics = false,
  name = {
    git_status_colors = false
  }
})

vim.keymap.set('n', '<leader>l', '<cmd>Neotree toggle<cr>', { silent = true })
