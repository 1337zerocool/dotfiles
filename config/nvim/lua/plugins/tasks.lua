-- A task runner and job framework
-- https://github.com/stevearc/overseer.nvim
local overseer = {
  "stevearc/overseer.nvim",
  keys = {
    { "<leader>a", "<cmd>OverseerRun<cr>", mode = { "n", "v" }, desc ="Overseer: create or run a task" },
    { "<leader>A", "<cmd>OverseerToggle<cr>", mode = { "n", "v" }, desc = "Overseer: toggle task list" },
  },
  opts = {
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
  }
}

return { overseer }
