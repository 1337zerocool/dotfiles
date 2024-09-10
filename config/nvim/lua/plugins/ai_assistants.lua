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
}

-- Enables interactive chat with copilot
-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
local copilot_chat = {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
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
