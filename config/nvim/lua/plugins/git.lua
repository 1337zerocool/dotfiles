-- Displays git diff status in the sign column and blaming on lines.
-- https://github.com/lewis6991/gitsigns.nvim
local gitsigns = {
  "lewis6991/gitsigns.nvim",
}

-- Generates links to code on popular source-sharing websites like github and
-- opens them in browser and/or puts them on the clipboard
-- https://github.com/linrongbin16/gitlinker.nvim
local gitlinker = {
  "linrongbin16/gitlinker.nvim",
  cmd = "GitLink",
  opts = {},
  keys = {
    { "<leader>gl", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Git Link: copy github.com link to current file" },
    { "<leader>gL", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Git link: open current file on github.com in browser" },
  },
}

-- Generates "pastebins" or "gists". Takes text in your editor and puts them on the
-- internet so you can share the links with people without creating a repository.
-- https://github.com/rktjmp/paperplanes.nvim
local paperplanes = {
  "rktjmp/paperplanes.nvim",
  cmd = "PP",
  opts = {
    register = "+",
    provider = "gist",
    provider_options = {
      command = "gh",
    },
    notifier = vim.notify or print,
  },
  keys = {
    { "<leader>gg", "<cmd>PP<cr>", mode = { "n" }, desc = "Git Gist: create a github gist with the current buffer and put the link on the clipboard" },
    { "<leader>gg", "<cmd>'<,'>PP<cr>", mode = { "v" }, desc = "Git Gist: create a github gist with the selection and open it in the browser" },
  }
}

-- Shows what's changed in a source repository. Diff files side-by-side, browse history of changes
-- compare revisions, branches, or handle merging.
-- https://github.com/sindrets/diffview.nvim
local diffview = {
  "sindrets/diffview.nvim",
  keys = {
    -- Todo, make this a toggle
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", mode = { "n" }, desc = "Git diff the current buffer" }
  }
}

return { gitsigns, gitlinker, paperplanes, diffview }