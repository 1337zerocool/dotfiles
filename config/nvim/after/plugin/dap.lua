-- This contains setup for multiple debugger related things because it just makes sense
-- to do it all in one place.

local ok_dap, dap = pcall(require, 'dap')
if not ok_dap then
  return
end

local ok_dapui, dapui = pcall(require, 'dapui')
if not ok_dapui then
  return
end

local ok_ruby, dap_ruby = pcall(require, 'dap-ruby')
if not ok_ruby then
  return
end

local ok_dap_vt, dap_vt = pcall(require, 'nvim-dap-virtual-text')
if not ok_dap_vt then
  return
end

dap_ruby.setup(
-- interesting part fo the youtube video at 22 mins
-- https://www.youtube.com/watch?v=VoyENLM2uto
-- https://github.com/ruby/vscode-rdbg  for launch.json
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ruby
)

dapui.setup(
  -- https://github.com/rcarriga/nvim-dap-ui/blob/aster/doc/nvim-dap-ui.txt
  -- https://github.com/rcarriga/nvim-dap-ui for setup of ui
)

dap_vt.setup({
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
  only_first_definition = true,
  all_references = false,
  clear_on_continue = false,
  all_frames = false,
  virt_lines = false,
  virt_text_win_col = nil,
  virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
  display_callback = function(variable, _buf, _stackframe, _node, options)
    if options.virt_text_pos == 'inline' then
      return ' → ' .. variable.value
    else
      return variable.name .. ' → ' .. variable.value
    end
  end,
})

-- Using capital D to toggle so that lowercase d can be the interact with debugger commands without lag
vim.keymap.set({ "n", "v" }, "<leader>D", dapui.toggle, { silent = true, desc = "Toggle debugger UI" })
vim.keymap.set({ "n", "v" }, "<leader>dd", dap.continue, { silent = true, desc = "Debugger continue" })
vim.keymap.set({ "n", "v" }, "<leader>dc", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Condition: '))<cr>", { silent = true, desc = "Debugger conditional breakpoint" })
vim.keymap.set({ "n", "v" }, "<leader>db", dap.toggle_breakpoint, { silent = true, desc = "Debugger toggle breakpoint" })
vim.keymap.set({ "n", "v" }, "<leader>do", dap.step_over, { silent = true, desc = "Debugger step over" })
vim.keymap.set({ "n", "v" }, "<leader>di", dap.step_into, { silent = true, desc = "Debugger step into" })
vim.keymap.set({ "n", "v" }, "<leader>dt", dap.step_out, { silent = true, desc = "Debugger step out" })
vim.keymap.set({ "n", "v" }, "<leader>dk", dap.up, { silent = true, desc = "Debugger go up call stack" })
vim.keymap.set({ "n", "v" }, "<leader>dj", dap.down, { silent = true, desc = "Debugger go down call stack" })
vim.keymap.set({ "n", "v" }, "<leader>dx", dap.terminate, { silent = true, desc = "Debugger quit" })
vim.keymap.set({ "n", "v" }, "<leader>dr", dap.repl.toggle, { silent = true, desc = "Debugger toggle REPL"})

-- there is additional config in telescope to show breakpoints
