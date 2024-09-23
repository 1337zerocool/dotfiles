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
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      -- add [telescope-alternate] = {}

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

      extensions = {
        ast_grep = {},
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      }

    })
    telescope.load_extension("ast_grep")
      telescope.load_extension("undo")
      telescope.load_extension("fzf")
      telescope.load_extension("telescope-alternate")
      -- telescope.load_extension('dap')

  end,
  keys = {
    { "<leader><leader>", "<cmd>Telescope find_files<cr>", mode = { "n", "v" }, desc = "Telescope: open files by path or name" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", mode = { "n", "v" },  desc = "Telescope: open files by content" },
    { "<leader>'", "<cmd>Telescope ast_grep<cr>",  mode = { "n", "v" }, desc = "Telescope: open files matching an AST (abstract syntax tree) pattern" },
    { "<leader>b", "<cmd>Telescope buffers<cr>",  mode = { "n", "v" }, desc = "Telescope: switch buffers" },
    { "<leader>?", "<cmd>Telescope current_buffer_fuzzy_find<cr>",  mode = { "n", "v" }, desc = "Telescope: find in the current buffer" },
    { "<leader>k", "<cmd>Telescope keymaps<cr>",  mode = { "n", "v" }, desc = "Telescope: keymaps" },
    { "<leader>m", "<cmd>Telescope telescope-alternate alternate_file<cr>",  mode = { "n", "v" }, desc = "Telescope: jump to matching or alternate file" },
    { "<leader>u", "<cmd>Telescope undo<cr>",  mode = { "n", "v" }, desc = "Telescope: undo history" },
    { "<leader>:", "<cmd>Telescope command_history<cr>",  mode = { "n", "v" }, desc = "Telescope: command history" },
    { "<leader>gf", "<cmd>Telescope git_bcommits<cr>",  mode = { "n", "v" }, desc = "Telescope: git commit history for current file (buffer)" },
    { "<leader>gh", "<cmd>Telescope git_commits<cr>",  mode = { "n", "v" }, desc = "Telescope: git commit history for current workspace" },
    { "z=", function() require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({})) end, mode = { "n", "v" }, desc = "Show spell check suggestions" },
    -- dap breakpoints
    -- lsp document symbols
    -- lsp workspace symbols
    -- lsp diagnostics

  },

  -- config = function(_, opts)
  --   local t = require('telescope)
  --   t.setup(opts)
  --   t.load_extension('foo')
  -- end,
}

return { plenary, fzf, telescope, telescope_undo, telescope_alternate, telescope_undo }
