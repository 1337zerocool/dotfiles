-- Define plugins managed by lazy
local plugins = {
  'nvim-lua/plenary.nvim',                       -- Utility library used by several plugins
  'MunifTanjim/nui.nvim',                        -- A UI component library used by several plugins
  'nvim-tree/nvim-web-devicons',                 -- Icon library used by several plugins to show icons by files/types
  {
    'nvim-telescope/telescope-fzf-native.nvim',  -- Improved fuzzy finder performance with FZF
    build = 'make'
  },
  'nvim-telescope/telescope-ui-select.nvim',     -- Use Telescope as selection UI for standard vim features
  'nvim-telescope/telescope.nvim',               -- Fuzzy finder UI for several features
  'debugloop/telescope-undo.nvim',               -- Use Telescope to search the undo history for current file
  'nvim-neo-tree/neo-tree.nvim',                 -- A 'tree' file explorer for the sidebar
  'andersevenrud/nordic.nvim',                   -- 'Cool' colour scheme. Some additional HL groups are required for consistency
  'anuvyklack/pretty-fold.nvim',                 -- Customize the display of folded text
  'lukas-reineke/indent-blankline.nvim',         -- Visual guidelines for level of indentation
  'nvim-lualine/lualine.nvim',                   -- Status line at bottom of windows
  'folke/zen-mode.nvim',                         -- Zooms and focuses a single window
  'folke/twilight.nvim',                         -- Dims text outside of some small context around the current scope
  'folke/trouble.nvim',                          -- Improved diagnostics
  'machakann/vim-sandwich',                      -- Wrap text objects in brackets, quotes, tags, etc.
  'terrortylor/nvim-comment',                    -- Comment and un-comment lines blocks lines of code
  'windwp/nvim-autopairs',                       -- Automatically insert matching pairs of quotes and brackets
  'lewis6991/gitsigns.nvim',                     -- Show git additions, changes, and deletions in the signcolumn and inline
  'ruifm/gitlinker.nvim',                        -- Create links to text in buffers hosted on Github and other locations
  'sindrets/diffview.nvim',                      -- A better way to navigate git changes
  {
    'nvim-treesitter/nvim-treesitter',           -- Builds ASTs from current document to power other plugins
     build = ':TSUpdate' ,
  },
  'nvim-treesitter/nvim-treesitter-textobjects', -- Use treesitter to create new text objects
  'RRethy/nvim-treesitter-endwise',              -- Automatically create `end` blocks in Lua, Ruby, Bash, and Elixir 
  'onsails/lspkind.nvim',
  {
    'neovim/nvim-lspconfig',                     -- A basic configuration for LSP to start from
    dependencies = {
      {
        'williamboman/mason.nvim',               -- Manages the installation of LSPs, Linters, formatting, etc.
        config = true
      },
      'williamboman/mason-lspconfig.nvim',       -- makes it easier to use mason with lspconfig
      'folke/neodev.nvim',                       -- Add neovim power to the LSPs for lua
    },
  },
  'nvimdev/lspsaga.nvim',                        -- Nice front end to LSP features
  {
    'hrsh7th/nvim-cmp',                          -- completion engine
    dependencies = {
      {
        'L3MON4D3/LuaSnip',                      -- Snippets
        build = (function() return 'make install_jsregexp' end)(),
      },
      'saadparwaiz1/cmp_luasnip',                -- complete from snipets
      'hrsh7th/cmp-nvim-lsp',                    -- use lsp as a completion source
      'hrsh7th/cmp-nvim-lsp-signature-help',     -- show method signature help whie completing
      'hrsh7th/cmp-nvim-lsp-document-symbol',    -- use document symbols as completion sources
      'hrsh7th/cmp-path',                        -- use filesystem as completion source
    },
  }
}
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
