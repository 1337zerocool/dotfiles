local ok, copilot = pcall(require, 'copilot')
if not ok then
  return
end

copilot.setup({
  panel = {
    enabled = true,
    auto_refresh = true,
  },
  suggestion = {
    enabled = true,
    keymap = {
      accept = "<S-Tab>",
    },
    auto_trigger = true,
    accept = true,
  },
})

vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>Copilot panel<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>ce', '<cmd>Copilot enable<cr>', { silent = true})
vim.keymap.set({ 'n', 'v' }, '<leader>cd', '<cmd>Copilot disable<cr>', { silent = true})
