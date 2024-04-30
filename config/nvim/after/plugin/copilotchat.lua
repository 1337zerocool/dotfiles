local ok, copilotchat = pcall(require, 'CopilotChat')
if not ok then
  return
end

copilotchat.setup({
})

vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>CopilotChat<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>cd', '<cmd>CopilotChatDocs<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>ce', '<cmd>CopilotChatExplain<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>cf', '<cmd>CopilotChatFix<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>co', '<cmd>CopilotChatOptimize<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>ct', '<cmd>CopilotChatTests<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>cr', '<cmd>CopilotChatReview<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>cg', '<cmd>CopilotChatCommit<cr>', { silent = true })

-- enable git commit writing. Figure out a better message into commit workflow
