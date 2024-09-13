cmp.lua
comment.lua
copilot.lua
copilotchat.lua
dap.lua
diffview.lua
dropbar.lua
gitsigns.lua
lspsaga.lua
luasnip.lua
mason.lua
neodev.lua
neotest.lua
oatmeal.lua
overseer.lua
trouble.lua






  'stevearc/overseer.nvim',                      -- Task running library
  'nvim-lua/plenary.nvim',                       -- Utility library used by several plugins
  'MunifTanjim/nui.nvim',                        -- A UI component library used by several plugins
  'nvim-tree/nvim-web-devicons',                 -- Icon library used by several plugins to show icons by files/types
    'nvim-telescope/telescope-fzf-native.nvim',  -- Improved fuzzy finder performance with FZF
  'stevearc/dressing.nvim',                      -- Provides a nicer UI selection system for telescope et al.
  'nvim-telescope/telescope.nvim',               -- Fuzzy finder UI for several features
  'debugloop/telescope-undo.nvim',               -- Use Telescope to search the undo history for current file
  'otavioschwanck/telescope-alternate.nvim',     -- quickly jump between and create alternate files
  'Marskey/telescope-sg',                        -- AST Grep for telescope: search on code structure
  'nvim-neo-tree/neo-tree.nvim',                 -- A 'tree' file explorer for the sidebar
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
  'shellRaining/hlchunk.nvim',                   -- Visual guidelines for level of indentation
  'nvim-lualine/lualine.nvim',                   -- Status line at bottom of windows
  'xiyaowong/virtcolumn.nvim',                   -- Mark the end of lines using ascii in color column
  'code-biscuits/nvim-biscuits',                 -- show 'opening' context at end of block as virtual text'
  'folke/twilight.nvim',                         -- Dims text outside of some small context around the current scope
  'folke/trouble.nvim',                          -- Improved diagnostics
  'machakann/vim-sandwich',                      -- Wrap text objects in brackets, quotes, tags, etc.
  'terrortylor/nvim-comment',                    -- Comment and un-comment lines blocks lines of code
  'windwp/nvim-autopairs',                       -- Automatically insert matching pairs of quotes and brackets
  'lewis6991/gitsigns.nvim',                     -- Show git additions, changes, and deletions in the signcolumn and inline
  'linrongbin16/gitlinker.nvim',                 -- Create links to text in buffers hosted on Github and other locations
  'rktjmp/paperplanes.nvim',                     -- Create gists from content of buffers
  'sindrets/diffview.nvim',                      -- A better way to navigate git changes
    'nvim-treesitter/nvim-treesitter',           -- Builds ASTs from current document to power other plugins
  'nvim-treesitter/nvim-treesitter-textobjects', -- Use treesitter to create new text objects
  'RRethy/nvim-treesitter-endwise',              -- Automatically create `end` blocks in Lua, Ruby, Bash, and Elixir 
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
  'dustinblackman/oatmeal.nvim',                 -- Experiment with interactive AI chat
  'rcarriga/nvim-notify',                        -- Notifications from language servers and stuff, out of the command line into windows
  'folke/noice.nvim',                            -- Move around command line, notifications, etc. Too much stuff
  'Bekaboo/dropbar.nvim',                        -- A little bar that gives context on where you are
