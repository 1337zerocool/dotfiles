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
}

-- Shows what's changed in a source repository. Diff files side-by-side, browse history of changes
-- compare revisions, branches, or handle merging.
-- https://github.com/sindrets/diffview.nvim
local diffview = {
  "sindrets/diffview.nvim",
}

return { gitsigns, gitlinker, paperplanes, diffview }
