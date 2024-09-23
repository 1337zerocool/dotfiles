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
  }
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
}

return { nvio, dap, dap_ui, dap_ruby, dap_virtual_text }
