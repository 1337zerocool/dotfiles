-- Define plugins managed by lazy
local plugins = {
  -- Shared Utilities
  'nvim-lua/plenary.nvim',                       -- Utility library used by several plugins
  'MunifTanjim/nui.nvim',                        -- A UI component library used by several plugins
  'nvim-tree/nvim-web-devicons',                 -- Icon library used by several plugins to show icons by files/types
  '3rd/image.nvim',                              -- Images in preview window

  -- User interface improvements
  'nvim-telescope/telescope.nvim',               -- Fuzzy finder UI for several features
  'nvim-telescope/telescope-ui-select.nvim',     -- Use Telescope as selection UI for standard vim features
  {
    'nvim-telescope/telescope-fzf-native.nvim',  -- Improved fuzzy finder performance with FZF
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  'debugloop/telescope-undo.nvim',               -- Use Telescope to search the undo history for current file
  'nvim-neo-tree/neo-tree.nvim',                 -- A 'tree' file explorer for the sidebar
  'andersevenrud/nordic.nvim',                   -- 'Cool' colour scheme. Some additional HL groups are required for consistency
  'anuvyklack/pretty-fold.nvim',                 -- Customize the display of folded text
  'lukas-reineke/indent-blankline.nvim',         -- Visual guidelines for level of indentation
  'nvim-lualine/lualine.nvim',                   -- Status line at bottom of windows

  'folke/zen-mode.nvim',                         -- Zooms and focuses a single window
  'folke/twilight.nvim',                         -- Dims text outside of some small context around the current scope

  'machakann/vim-sandwich',                      -- Wrap text objects in brackets, quotes, tags, etc.
  'terrortylor/nvim-comment',                    -- Comment and un-comment lines blocks lines of code
  'windwp/nvim-autopairs',                       -- Automatically insert matching pairs of quotes and brackets

  'lewis6991/gitsigns.nvim',                     -- Show git additions, changes, and deletions in the signcolumn and inline
  'ruifm/gitlinker.nvim',                        -- Create links to text in buffers hosted on Github and other locations
  'sindrets/diffview.nvim',                      -- A better way to navigate git changes
  'pwntester/octo.nvim',                         -- Interact with Github

  {
    'nvim-treesitter/nvim-treesitter',           -- Builds ASTs from current document to power other plugins
     build = ':TSUpdate' ,
  },
  'nvim-treesitter/nvim-treesitter-textobjects', -- Use treesitter to create new text objects
  'RRethy/nvim-treesitter-endwise',              -- Automatically create `end` blocks in Lua, Ruby, Bash, and Elixir 

  -- 'stevearc/overseer.nvim',                      -- Expose task files like Make, VSCode, Rake. On file save and one-off
  -- 'vs-tasks.nvim'                                -- an alternative to overseer
  -- 'neovim/nvim-lspconfig',                       -- Common configurations for LSPs
  -- 'VonHeikemen/lsp-zero.nvim',                   -- Simple configuration for LSP and CMP

  -- 'williamboman/mason.nvim',                     -- Manager for installing Language Servers and Debuggers
  -- 'williamboman/mason-lspconfig.nvim',           -- Connects Mason to LSP-config

  -- 'hrsh7th/nvim-cmp',                            -- Completion engine
  -- 'onsails/lspkind.nvim',                        -- Icons instead of text in the completion suggestion window
  -- 'hrsh7th/cmp-buffer',                          -- Suggestions from open buffers
  -- 'hrsh7th/cmp-path',                            -- Suggestions from the file system
  -- 'hrsh7th/cmp-nvim-lsp',                        -- Suggestions from the LSP
  -- 'hrsh7th/cmp-nvim-lua')                        -- Suggestions form the Neovm lua interface (e.g. `vim.api.nvim_cmd`,
  -- 'saadparwaiz1/cmp_luasnip',                    -- Suggestions from Luasnip

  -- 'folke/trouble.nvim',                          -- Navigates diagnostic messages from the language server
-- 'glepnir/lspsaga.nvim',                        -- UI for langauge server features like goto and peek definition, hoverdoc, etc.
-- 'j-hui/fidget.nvim',                           -- Updates on LSP status in the lower right corner of windows
-- 'jose-elias-alvarez/null-ls.nvim',             -- Framework for connecting non-LSP sources to hook into the LSP
-- 'jay-babu/mason-null-ls.nvim',                 -- Connects Mason to Null-LS
-- 'L3MON4D3/LuaSnip',                            -- Automatic snippets defined in Lua
-- 'mfussenegger/nvim-dap',                       -- Common configurations for DAP
-- 'rcarriga/nvim-dap-ui',                        -- A Debugger interface wrapped around DAP
-- 'theHamsta/nvim-dap-virtual-text')             -- Show status (like variable values, from the debugger as virtual text
-- 'nvim-neotest/neotest',
-- 'antoinemadec/FixCursorHold.nvim',
-- 'semanticart/ruby-code-actions.nvim',          -- Adds LSP code actions from Rubocop autosuggestions/diagnostics
-- 'maxbane/vim-asm_ca65',                        -- Adds File type support for the ca65 6502 assembler
 'zbirenbaum/copilot.lua',
}

-- Configure some standard global options for lazy
local opts = {}

-- Start by installing the Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Ensure that it actually loaded and if not print a helpful error
local ok, lazy = pcall(require, 'lazy')
if not ok then
  print 'Failed to load "Lazy" plugin manager'
end

lazy.setup(plugins, opts)

