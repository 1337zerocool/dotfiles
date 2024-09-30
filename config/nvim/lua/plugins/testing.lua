-- 'zidhuss/neotest-minitest',                -- make it work with minitest

-- Hard requirement for Neotest: a library for asyncronus programming
-- https://github.com/nvim-neotest/nvim-nio
local nvio = {
  "nvim-neotest/nvim-nio",
  priority = 100,
}

-- Hard requirement for Neotest: a library for asyncronus programming
-- https://github.com/nvim-lua/plenary.nvim
local plenary = {
  "nvim-lua/plenary.nvim",
}

-- Hard requirement for Neotest. See treesitter.lua for the full config
-- https://github.com/nvim-treesitter/nvim-treesitter
local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
}

-- Support ruby minitest
-- https://github.com/zidhuss/neotest-minitest
local neotest_minitest = {
  "zidhuss/neotest-minitest"
}

-- Interact with test framworks from within neovim
-- https://github.com/nvim-neotest/neotest
local neotest = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "zidhuss/neotest-minitest",
  },
  keys = {
    { "<leader>t", "<cmd>Neotest run<cr>", mode = { "n", "v" }, desc = "Show spell check suggestions" },
    { "<leader>T", "<cmd>Neotest summary<cr>", mode = { "n", "v" }, desc = "Show spell check suggestions" },
  },
  config = function()
    require('neotest').setup({
      overseer = {
        enabled = true,
        force_default = true,
      },
      consumers = {
        overseer = require('neotest.consumers.overseer'),
      },
      adapters = {
        require('neotest-minitest'),
      },
    })
  end
}

return { nvio, plenary, treesitter, neotest, neotest_minitest }
