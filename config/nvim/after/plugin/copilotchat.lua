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

local ok_prompt, prompts = pcall(require, 'CopilotChat.prompts')
if not ok_prompt then
  return
end

-- look in https://github.com/deathbeam/dotfiles/blob/master/nvim/.config/nvim/lua/config/copilot.lua#L14

copilotchat.setup({
  debug = false,
  system_prompt = prompts.COPILOT_INSTRUCTIONS,
  model = 'gpt-3.5-turbo',
  temperature = 0.1,
  auto_insert_mode = true,
  clear_chat_on_new_prompt = true,
  context = 'buffers',
  selection = function(source)
    return select.visual(source) or select.line(source)
  end,
})

vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>CopilotChat<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>ca', function()
  actions.pick(actions.prompt_actions({ selection = select.visual, }))
end, { silent = true })
