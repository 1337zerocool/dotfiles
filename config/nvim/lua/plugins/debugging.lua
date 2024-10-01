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
