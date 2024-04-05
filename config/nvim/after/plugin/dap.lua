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

dap_ruby.setup()

dapui.setup(
-- https://github.com/rcarriga/nvim-dap-ui/blob/master/doc/nvim-dap-ui.txt
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
  display_callback = function(variable, buf, stackframe, node, options)
    if options.virt_text_pos == 'inline' then
      return ' → ' .. variable.value
    else
      return variable.name .. ' → ' .. variable.value
    end
  end,
})

-- bind a bunch of stuff
-- toggle ui
-- continue
-- terminate
-- step into
-- step over
-- step out
-- repl
-- eval?
-- stepup?
-- stepdown?
-- hovervariables?
-- toggle breakpoint
-- conditional breakpoint
--
-- https://github.com/ruby/vscode-rdbg  for launch.json
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ruby
-- interesting part fo the youtube video at 22 mins
-- https://www.youtube.com/watch?v=VoyENLM2uto
-- https://github.com/rcarriga/nvim-dap-ui for setup of ui
