-- A fast document parser that provides syntax coloring, folding, indentation, etc.
-- https://github.com/nvim-treesitter/nvim-treesitter

local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "comment",
      "css",
      "diff",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "graphql",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "ruby",
      "sql",
      "typescript",
      "yaml",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },  
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<c-space>", -- set to `false` to disable one of the mappings
        node_incremental = "<c-space>",
        node_decremental = "<c-s-space>",
      },
    },
    sync_install = false,
    auto_install = true,
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,
        -- consider @scope, @loop, @conditional, @class
        goto_next_start = {
          [']]'] = '@function.outer',
        },
        goto_previous_start = {
          ['[['] = '@function.outer',
        },
        goto_next_end = {
          ['[]'] = '@function.outer',
        },
        goto_previous_end = {
          [']['] = '@function.outer',
        },
      },
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        }
      }
    },
    endwise = {
      enabled = true,
    }
  },
  priority = 100,
  config = LazySafeSetup("nvim-treesitter.configs", function() end)
}

-- Extends text objects by using treesitter for scopes, classes, methods, etc.
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

local textobjects = {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },


}

return { treesitter, textobjects }
