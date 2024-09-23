-- There are many integrations and options. See here for details
-- https://github.com/catppuccin/nvim
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "macchiato",
    transparent_background = false,
    show_end_of_buffer = false,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.3,
    },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
      comments = {},
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- misc = {},
    },
    custom_highlights = {
      NonText = { fg = "#303446" },
      Whitespace = { fg = "#303446" },
      -- this gets swapped by virtcol
      ColorColumn = { bg = "#363a4f" },
    },
    default_integrations = true,
    -- https://github.com/catppuccin/nvim#integrations
    integrations = {
      cmp = true,
      dap = true,
      dap_ui = true,
      diffview = true,
      gitsigns = true,
      mason = true,
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      overseer = true,
      telescope = { enabled = true },
      treesitter = true,
      lsp_trouble = true,
    }
  },
  config = LazySafeSetup("catppuccin", function()
    vim.cmd.colorscheme("catppuccin")
  end),
}
