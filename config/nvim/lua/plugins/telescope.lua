-- Hard requirement for Telescope: a library for asyncronus programming
-- https://github.com/nvim-lua/plenary.nvim
local plenary = {
  "nvim-lua/plenary.nvim"
}

-- Uses a native (compiled c) version of FZF for fuzzy finding. This improves performance and enables
-- additional syntax for filtering results.
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim?tab=readme-ov-file
local fzf = {
  "nvim-telescope/telescope-fzf-native.nvim",
  build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
}

-- Allow Telescope to visualize the undo tree
-- https://github.com/debugloop/telescope-undo.nvim
local telescope_undo = {
  "debugloop/telescope-undo.nvim",
}

-- Enables telescope jumping of "alternate" files, like headers/implementations in C.
-- https://github.com/otavioschwanck/telescope-alternate.nvim
local telescope_alternate = {
  "otavioschwanck/telescope-alternate",
}

-- A tool for searching the AST of files in a program. For syntax see
-- https://ast-grep.github.io/guide/quick-start.html
-- https://github.com/Marskey/telescope-sg
local telescope_sg = {
  "Marskey/telescope-sg",
}
-- An all-purpose fuzzy-find stuff in a list utility. Files, buffers, breakpoints, git history,
-- and anything else can be added with extensions
-- https://github.com/nvim-telescope/telescope.nvim
local telescope = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "debugloop/telescope-undo.nvim",
    "otavioschwanck/telescope-alternate",
    "Marskey/telescope-sg",
  },
  opts = {
    defaults = {
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      layout_config = {
        vertical = {
          mirror = true,
          prompt_position = "top",
        },
      },
    },
  },
}

return { plenary, fzf, telescope, telescope_undo, telescope_alternate, telescope_undo }
