-- 'rcarriga/nvim-dap-ui',                      -- A UI for debugger access protocol
-- 'mfussenegger/nvim-dap',                   -- Support for debugger access protocol. Unfortunately mason is limited
-- 'nvim-neotest/nvim-nio',                   -- an async-io library for vim
-- 'suketa/nvim-dap-ruby',                    -- dap config for ruby -- might be better to do this manually. see dap.lua for notes
-- 'nvim-telescope/telescope-dap.nvim',       -- explore breakpoints, variables, frames, and debugger command in telescope
-- 'theHamsta/nvim-dap-virtual-text',         -- when using the debugger put variable values in virtual text in the source
--
--
-- Configuratino for debugging Ruby/Rails applications
-- https://github.com/suketa/nvim-dap-ruby/blob/main/lua/dap-ruby.lua
local dap_ruby = {
  "suketa/nvim-dap-ruby",
}

-- Debugger adapater protocol client
-- https://github.com/mfussenegger/nvim-dap
local dap = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "suketa/nvim-dap-ruby"
  },
  config = function()
    require("dap-ruby").setup()
    local dap = require("dap")
    dap.set_log_level("TRACE")
    dap.configurations.ruby = {
      {
        type = "ruby",
        name = "This File",
        request = "attach",
        command = "bundle",
        -- --nonstop doesn't seem to work. neither does setting env
        -- commandArgs = function()…end seems to work.  could make this exe/fooapp call a
        -- vim.fn.input
        args = { "exec", "rdbg", "--open", "--command", "--", "${file}" },
        port = 38698,
        server = "127.0.0.1",
        localfs = true,
      },
      {
        type = "ruby",
        name = "Choose from exe/",
        request = "attach",
        command = "bundle",
        -- commandArgs = function()…end seems to work.  could make this exe/fooapp call a
        -- vim.fn.input
        args = { "exec", "rdbg", "--command", "--", "${file}" },
        port = 38698,
        server = "127.0.0.1",
        localfs = true,
      },
      {
        type = "ruby",
        name = "Minitest (broken)",
        request = "attach",
        command = "bundle",
        commandArgs = { "exec", "rdbg", "--open", "-command", "--", "rake", "test", vim.fn.expand("%:p") },
        port = 1234,
        server = "127.0.0.1",
        env = {
          ["RUBYOPT"] = "-rdebug/open_nonstop",
          ["RUBY_DEBUG_PORT"] = "38698",
        },
        localfs = true,
      },
      {
        type = "ruby",
        name = "Working version, do not edit",
        request = "attach",
        command = "bundle",
        args = { "exec", "rdbg", "-c", "bundle", "exec", "exe/fooapp" },
        port = 38698,
        server = "127.0.0.1",
        env = {
          ["RUBYOPT"] = "-rdebug/open_nonstop",
        },
        localfs = true,
      }
    }

    ---  https://github.com/suketa/nvim-dap-ruby
    ---  https://www.reddit.com/r/ruby/comments/1ctwtrd/debugging_ruby_in_neovim/
    -- doing this does start the debugger properly. seems like it's missing a bundle exec in the
    -- config though because the 'requires' fail
    -- require("dap").continue()
    -- vim.fn.setenv("RUBYOPT", "-rdebug/open_nonstop")
    -- require("dap").run({ type = "ruby", name = "RunIt", request = "attach", command = "bundle", args = { "exec" }, script = "${file}", port = 38698, server = "127.0.0.1", localfs = true, waiting = 100, })
    -- https://www.pudn.com/Download/item/id/1726358848734809.html
    -- https://gorails.com/episodes/better-debugging-with-the-ruby-debug-gem
    -- rdbg -c  bundle exec exe/fooapp
    -- https://github.com/kaka-ruto/nvim-ruby-debugger/blob/master/lua/nvim-ruby-debugger/configurations.lua
    -- probably going to have to make your own plugin or something
    -- For the one above, then add some configurations:

  end
}

-- Hard requirement for Neotest: a library for asyncronus programming
-- https://github.com/nvim-neotest/nvim-nio
local nvio = {
  "nvim-neotest/nvim-nio",
  priority = 100,
}

-- An interface library for nvim DAP
-- https://github.com/rcarriga/nvim-dap-ui
local dap_ui = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require('dapui').setup()
  end,
  keys = {
    { "<leader>D", function() require("dapui").toggle() end, mode = { "v", "n"}, desc = "Debugger: toggle UI" },
    { "<leader>dd", "<cmd>DapContinue<cr>", mode = { "v", "n"}, desc = "Debugger: Continue debugging" },
    { "<leader>dc", function() require('dap').set_breakpoint(vim.fn.input('Condition: ')) end, mode = { "v", "n"}, desc = "Debugger: Set conditional breakpoint" },
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", mode = { "v", "n"}, desc = "Debugger: Toggle breakpoint" },
    { "<leader>do", "<cmd>DapStepOver<cr>", mode = { "v", "n"}, desc = "Debugger: Step over" },
    { "<leader>di", "<cmd>DapStepInto<cr>", mode = { "v", "n"}, desc = "Debugger: Step into" },
    { "<leader>du", "<cmd>DapStepOut<cr>", mode = { "v", "n"}, desc = "Debugger: Step out/up" },
    { "<leader>dk", function() require('dap').up() end, mode = { "v", "n"}, desc = "Debugger: Jump up callstack" },
    { "<leader>dj", function() require('dap').down() end, mode = { "v", "n"}, desc = "Debugger: Jump down callstack" },
    { "<leader>dx", function() require('dap').down() end, mode = { "v", "n"}, desc = "Debugger: Terminate execution" },
    { "<leader>dr", function() require('dap').repl.toggle() end, mode = { "v", "n"}, desc = "Debugger: Start REPL" },
  }
}

-- Expands Telescope to support debugger features. Replaces parts of the standard DAP ui.
-- https://github.com/nvim-telescope/telescope-dap.nvim
local telescope_dap = {
  "nvim-telescope/telescope-dap.nvim",
  config = function()
    require('telescope').load_extension('dap')
  end
}

-- Adds information in the debugger (like variable values) to buffers as virtual text
-- https://github.com/theHamsta/nvim-dap-virtual-text
local dap_virtual_text = {
  "theHamsta/nvim-dap-virtual-text",
  opts = {
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
  }
}

return { nvio, dap, dap_ui, dap_ruby, telescope_dap, dap_virtual_text }
