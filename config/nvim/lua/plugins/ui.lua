-- Nice UI improvements
--    "stevearc/dressing.nvim",         -- Provides a nicer UI selection system for telescope et al.
--    "Bekaboo/dropbar.nvim",           -- A little bar that gives context on where you are
--    "folke/trouble.nvim",             -- Improved diagnostics
--    "onsails/lspkind.nvim",		-- LSPKind

-- Notifications from language servers and stuff, out of the command line into windows
-- https://github.com/rcarriga/nvim-notify
local notify = {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
    render = "minimal",
    stages = "static",
    timeout = 2000,
    level = 3,
    })
  end
}

-- an experimental plugin that replaces many parts of the vim UI
-- https://github.com/folke/noice.nvim
local noice = {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  opts = {
    routes = {},
    notify = {
      enabled = true,
      view = "notify",
    },
    lsp = {
      progress = {
        enabled = true,
        format = "lsp_progress",
        format_done = "lsp_progress_done",
        throttle = 1000 / 30,
        view = "mini",
      },
      message = {
        -- Messages shown by lsp servers
        enabled = true,
        view = "notify",
        opts = {},
      },
    },
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 20,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    }
  },
}

-- Display status line at the of windows
-- https://github.com/nvim-lualine/lualine.nvim
local lualine = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
    })
  end
}

-- Have better control over the 'cursor colum' showing 80/100/120 lines
-- https://github.com/xiyaowong/virtcolumn.nvim
local virtual_column = {
  "xiyaowong/virtcolumn.nvim",
  -- vim.g.virtcolumn_char = '▕' -- char to display the line
  -- vim.g.virtcolumn_priority = 10 -- priority of extmark
}

-- Highlight the level of indentation for blocks of code
-- https://github.com/shellRaining/hlchunk.nvim
local hlchunk = {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  -- for some reason using opt={} doesn't work
  config = function()
    require("hlchunk").setup({
      blank = { enable = false, },
      chunk = { enable = false, },
      line_num = {
        enable = false,
        style = '#88C0D0'
      },
      indent = {
        use_treesitter = true,
        enable = true,
        chars = { "│", "¦", "┆", "┊", },
        style = { '#3B4252' }
      },
    })
  end
}

-- Show where a closing bracket was opened and provide some context
-- https://github.com/code-biscuits/nvim-biscuits
local biscuits = {
  "code-biscuits/nvim-biscuits",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    toggle_keybind = "<leader>cb", -- see if we can get something better than this
    show_on_start = false,
    cursor_line_only = true,
    -- vim.api.nvim_set_hl(0, "BiscuitColor", { fg="#D08770" })
    -- vim.keymap.set("n", "<leader>cb", "<cmd>lua require('nvim-biscuits').toggle_biscuits()<cr>", { silent = true, desc = "Toggle display of matching 'scope level'"})
    default_config = {
      max_length = 40,
      min_distance = 5,
      prefix_string = " ⬅ "
    },
  }
}

-- Dim sections of a file that you're not actively working at
-- zen mode automatically activates this
-- https://github.com/folke/twilight.nvim
local twilight = {
  "folke/twilight.nvim",
  opts = {
    treesitter = true,
    context = 10,
    dimming = {
      alpha = 0.25,
      color = { "Normal", "#ffffff" },
      term_bg = "#000000",
      inactive = true,
    },
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = {},
  }
}

-- Zooms and focuses a single window
-- https://github.com/folke/zen-mode.nvim
local zenmode = {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader><cr>", "<cmd>ZenMode<cr>", mode = { "n", "v" }, desc = "Zen mode: Focus on the current window exclusively" },
  },
}


-- Hard requirement for neotree: A UI component library
-- https://github.com/MunifTanjim/nui.nvim
local nui = {
  "MunifTanjim/nui.nvim",
}

-- Hard requirement for neotree: a library for asyncronus programming
-- https://github.com/nvim-lua/plenary.nvim
local plenary = {
  "nvim-lua/plenary.nvim",
}

-- Icon library used by several plugins to show icons by files/types
-- https://github.com/nvim-tree/nvim-web-devicons
local web_dev_icons = {
  "nvim-tree/nvim-web-devicons",
  -- there's plenty of options, go read the page
}

-- A file explorer
-- https://github.com/nvim-neo-tree/neo-tree.nvim
local neotree = {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>l", "<cmd>Neotree toggle<cr>",  mode = { "n", "v" }, desc = "Neotree: Toggle file list side bar" },
  },
  opts = {
    window = {
      position = "right",
      width = 40,
    },
    consumers = {
      overseer = require("neotest.consumers.overseer"),
    },
    sources = {
      "filesystem",
      "git_status",
    },
    sort_case_insensitive = true,
    enable_git_status = false,
    enable_diagnostics = false,
    name = {
      git_status_colors = false
    }
  }
  -- consider setting highlight groups
  -- or https://github.com/catppuccin/nvim#overwriting-highlight-groups
  -- lua vim.api.nvim_set_hl(0, 'NeotreeNormal', { bg = "#24273a" })
}

return { noice, notify, nui, plenary, web_dev_icons, neotree, zenmode, twilight, biscuits, virtual_column, hlchunk, lualine }
