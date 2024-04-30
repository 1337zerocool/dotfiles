local ok, copilotchat = pcall(require, 'CopilotChat')
if not ok then
  return
end

local ok_actions, actions = pcall(require, 'CopilotChat.actions')
if not ok_actions then
  return
end

local ok_select, select = pcall(require, 'CopilotChat.select')
if not ok_select then
  return
end


copilotchat.setup({
  -- look in https://github.com/deathbeam/dotfiles/blob/master/nvim/.config/nvim/lua/config/copilot.lua#L14
})

vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>CopilotChat<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>ca', function()
  actions.pick(actions.prompt_actions({ selection = select.visual, }))
end, { silent = true })
