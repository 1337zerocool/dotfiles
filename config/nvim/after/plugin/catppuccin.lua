-- This requires some updates for 'warnings'
local ok, color = pcall(require, "catppuccin")
if not ok then
  return
end

color.setup({
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "macchiato",
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
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
    -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
  color_overrides = {},
  custom_highlights = function(colors)
    return {
      NonText = { fg = colors.surface0 }, -- dimming listchars
    }
  end,
  default_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

vim.cmd.colorscheme "catppuccin"

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg="#494D64"})
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg="#494D64" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg="#494D64" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg="#494D64" })
