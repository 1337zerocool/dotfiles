-- Hard requirement for Copilot chat: a library for asyncronus programming
-- used specifically to do curl requests to copilot
-- https://github.com/nvim-lua/plenary.nvim
local plenary = {
  "nvim-lua/plenary.nvim"
}

-- A lua rewrite of the standard github.com copilot plugin
-- https://github.com/zbirenbaum/copilot.lua
local copilot = {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = "Copilot",
  keys = {
    { "<leader>ce", "<cmd>Copilot enable<cr>",  mode = { "n", "v" }, desc = "Copilot: enable github copilot" },
    { "<leader>cd", "<cmd>Copilot disable<cr>",  mode = { "n", "v" }, desc = "Copilot: disable github copilot" },
  },
  config = function()
    require('copilot').setup({
      panel = {
        enabled = true,
        auto_refresh = true,
      },
      suggestion = {
        enabled = true,
        keymap = {
          -- consider off by default and a <leader>cc to suggest, and then something else to accept
          accept = "<S-Tab>",
        },
        auto_trigger = true,
        accept = true,
      },
    })
  end
}

-- Enables interactive chat with copilot
-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
local copilot_chat = {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>cc", "<cmd>CopilotChatToggle<cr>",  mode = { "n", "v" }, desc = "Copilot: enable github copilot" },
    { "<leader>ca", function() local actions = require("CopilotChat.actions"); actions.pick(actions.prompt_actions({ selection = require("CopilotChat.select").visual, })) end, mode = {"n", "v"}, desc="Copilot code actions list" },
  },
  opts = {
    model = 'gpt-4o',
    auto_insert_mode = true,
    context = 'buffers',
  }
}

-- Interactive chat with locally hosted large language models. Something running
-- in the background to host ollama is required.
-- https://github.com/dustinblackman/oatmeal.nvim
-- see this for details about setting up ollama:
-- https://github.com/ollama/ollama
-- and also look at oatmeal as a command line application that gets integrated
-- into vims termianl window
-- https://github.com/dustinblackman/oatmeal
local oatmeal = {
  "dustinblackman/oatmeal.nvim",
  cmd = { "Oatmeal" }, -- documentaiton has a { "Oatmeal" }
  opts = {
    backend = "ollama",
    model = "phind-codellama:latest",
  },
  keys = {
    { "<leader>`", "<cmd>Oatmeal<cr>", mode = { "n", "v", "x" }, desc = "Start an AI chat session" },
  },
}

return { copilot, copilot_chat, oatmeal }
