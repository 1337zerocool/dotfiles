local ok, overseer = pcall(require, 'overseer')
if not ok then
  return
end

overseer.setup({
  strategy = "terminal",
  templates = { "builtin" },
  auto_detect_success_color = true,
  dap = true,
  task_list = {
    default_detail = 1,
    max_width = { 100, 0.2 },
    min_width = { 40, 0.1 },
    direction = "right",
    bindings = {
      ["?"] = "ShowHelp",
      ["<CR>"] = "RunAction",
      ["e"] = "Edit",
      ["o"] = "Open",
      ["-"] = "OpenVsplit",
      ["|"] = "OpenSplit",
      ["f"] = "OpenFloat",
      ["p"] = "TogglePreview",
      ["v"] = "IncreaseDetail",
      ["V"] = "DecreaseDetail",
      ["H"] = "IncreaseAllDetail",
      ["L"] = "DecreaseAllDetail",
      ["["] = "DecreaseWidth",
      ["]"] = "IncreaseWidth",
      ["{"] = "PrevTask",
      ["}"] = "NextTask",
      ["<C-k>"] = "ScrollOutputUp",
      ["<C-j>"] = "ScrollOutputDown",
      ["q"] = "Close",
    },
  },
  actions = {},
})
vim.keymap.set('n', '<leader>a', '<cmd>OverseerRun<cr>', { silent = true })
vim.keymap.set('n', '<leader>A', '<cmd>OverseerToggle<cr>', { silent = true })
vim.keymap.set('v', '<leader>a', '<cmd>OverseerRun<cr>', { silent = true })
vim.keymap.set('v', '<leader>T', '<cmd>OverseerToggle<cr>', { silent = true })
