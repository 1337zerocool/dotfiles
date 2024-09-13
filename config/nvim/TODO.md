cmp.lua
copilot.lua
copilotchat.lua
dap.lua
diffview.lua
gitsigns.lua
lspsaga.lua
luasnip.lua
mason.lua
neodev.lua
neotest.lua
oatmeal.lua
overseer.lua






  'stevearc/overseer.nvim',                      -- Task running library
  'otavioschwanck/telescope-alternate.nvim',     -- quickly jump between and create alternate files
  'Marskey/telescope-sg',                        -- AST Grep for telescope: search on code structure
  'catppuccin/nvim',                             -- a surprisingly colorful theme
    'nvim-neotest/neotest',                      -- run related tests
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'zidhuss/neotest-minitest',                -- make it work with minitest
    'rcarriga/nvim-dap-ui',                      -- A UI for debugger access protocol
      'mfussenegger/nvim-dap',                   -- Support for debugger access protocol. Unfortunately mason is limited
      'nvim-neotest/nvim-nio',                   -- an async-io library for vim
      'suketa/nvim-dap-ruby',                    -- dap config for ruby -- might be better to do this manually. see dap.lua for notes
      'nvim-telescope/telescope-dap.nvim',       -- explore breakpoints, variables, frames, and debugger command in telescope
      'theHamsta/nvim-dap-virtual-text',         -- when using the debugger put variable values in virtual text in the source
  'lewis6991/gitsigns.nvim',                     -- Show git additions, changes, and deletions in the signcolumn and inline
  'sindrets/diffview.nvim',                      -- A better way to navigate git changes
    'nvim-treesitter/nvim-treesitter',           -- Builds ASTs from current document to power other plugins
  'nvim-treesitter/nvim-treesitter-textobjects', -- Use treesitter to create new text objects
  'onsails/lspkind.nvim',
    'neovim/nvim-lspconfig',                     -- A basic configuration for LSP to start from
        'williamboman/mason.nvim',               -- Manages the installation of LSPs, Linters, formatting, etc.
      'williamboman/mason-lspconfig.nvim',       -- makes it easier to use mason with lspconfig
      'folke/neodev.nvim',                       -- Add neovim power to the LSPs for lua
  'nvimdev/lspsaga.nvim',                        -- Nice front end to LSP features
    'hrsh7th/nvim-cmp',                          -- completion engine
        'L3MON4D3/LuaSnip',                      -- Snippets
      'saadparwaiz1/cmp_luasnip',                -- complete from snipets
      'hrsh7th/cmp-nvim-lsp',                    -- use lsp as a completion source
      'hrsh7th/cmp-nvim-lsp-signature-help',     -- show method signature help whie completing
      'hrsh7th/cmp-nvim-lsp-document-symbol',    -- use document symbols as completion sources
      'hrsh7th/cmp-path',                        -- use filesystem as completion source
  'zbirenbaum/copilot.lua',                      -- Enable github copilot
"CopilotC-Nvim/CopilotChat.nvim",            -- Chat with copilot
