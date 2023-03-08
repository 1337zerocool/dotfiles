local ok, dap = pcall(require, 'dap')
if not ok then
  return
end

dap.adapters.ruby = function(callback, config)
  callback {
    type = 'server',
    host = '127.0.0.1',
    port = 1234,
    executable = {
      command = 'rdbg',
      args = {
        '-o', '--port', config.port, '-c', '--',
        'bundle', 'exec', config.command
      },
    },
  }
end

-- needs to take command from prompt
-- consider using something from overwatch
dap.configurations.ruby = {
  {
    type = 'ruby',
    name = 'run app',
    request = 'attach',
    localfs = true,
    port = 1234,
    command = 'exe/rub',
  },
  {
    type = 'ruby',
    name = 'run tests',
    request = 'attach',
    localfs = true,
    port = 1234,
    command = 'rspec',
  },
}


require('dapui').setup()
require('nvim-dap-virtual-text').setup({})
vim.keymap.set('n', 'Q', function() require('dapui').toggle() end, {silent=true})
vim.keymap.set('n', '<leader>dd', function() require('dap').continue() end, {silent=true})
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end, {silent=true})
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, {silent=true})
-- needs stepover and stepinto
