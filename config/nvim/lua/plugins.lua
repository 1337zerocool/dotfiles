local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_setup = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_setup = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

local ok, packer = pcall(require, 'packer')
if ok then
  packer.startup(function(use)
    -- Shared Utilities
    use('wbthomason/packer.nvim')                      -- Packer manages plugins. By adding this here it can manage itself from within vim
    use('nvim-lua/plenary.nvim')                       -- Utility library used by several plugins
    use('MunifTanjim/nui.nvim')                        -- A UI component library used by several plugins
    use('nvim-tree/nvim-web-devicons')                 -- Icon library used by several plugins to show icons by files/types

    -- Editing Improvements
    use('lukas-reineke/indent-blankline.nvim')         -- Visual guidelines for level of indentation
    use('machakann/vim-sandwich')                      -- Wrap text objects in brackets, quotes, tags, etc.
    use('terrortylor/nvim-comment')                    -- Comment and un-comment lines blocks lines of code
    use('windwp/nvim-autopairs')                       -- Automatically insert matching pairs of quotes and brackets
    use('RRethy/nvim-treesitter-endwise')              -- Automatically create `end` blocks in Lua, Ruby, Bash, and Elixir 

    -- Snippets
    use('L3MON4D3/LuaSnip')                            -- Automatic snippets defined in Lua

    -- User interface improvements
    use('nvim-neo-tree/neo-tree.nvim')                 -- A 'tree' file explorer for the sidebar
    use('anuvyklack/pretty-fold.nvim')                 -- Customize the display of folded text
    use('tpope/vim-projectionist')                     -- Jump between "alternate" files: Header to Implementation to Test to Model to View...
    use('mbbill/undotree')                             -- Sidebar to explore vim's branching history
    use('folke/zen-mode.nvim')                         -- Zooms and focuses a single window
    use('folke/twilight.nvim')                         -- Dims text outside of some small context around the current scope
    use('nvim-lualine/lualine.nvim')                   -- Status line at bottom of windows
    use('andersevenrud/nordic.nvim')                   -- 'Cool' colour scheme. Some additional HL groups are required for consistency

    -- Fuzzy finder
    use('nvim-telescope/telescope.nvim')               -- Fuzzy finder UI for several features
    use('debugloop/telescope-undo.nvim')               -- Use Telescope to search the undo history for current file
    use('nvim-telescope/telescope-ui-select.nvim')     -- Use Telescope as selection UI for standard vim features
    use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }) -- Plugin for telescope to use FZF. Better performance, more features

    -- git stuff
    use('lewis6991/gitsigns.nvim')                     -- Show git additions, changes, and deletions in the signcolumn and inline
    use('ruifm/gitlinker.nvim')                        -- Create links to text in buffers hosted on Github and other locations
    use('sindrets/diffview.nvim')                      -- A better way to navigate git changes
    use('pwntester/octo.nvim')                         -- Interact with Github

    -- Build Tasks
    use('stevearc/overseer.nvim')                      -- Expose takes' files like Make, VSCode, Rake. On file save and one-off

    -- Language Servers
    use('VonHeikemen/lsp-zero.nvim')                   -- Simple configuration for LSP and CMP
    use('neovim/nvim-lspconfig')                       -- Common configurations for LSPs
    use('williamboman/mason.nvim')                     -- Manager for installing Language Servers and Debuggers
    use('williamboman/mason-lspconfig.nvim')           -- Connects Mason to LSP-config
    use('jose-elias-alvarez/null-ls.nvim')             -- Framework for connecting non-LSP sources to hook into the LSP
    use('jay-babu/mason-null-ls.nvim')                 -- Connects Mason to Null-LS
    use('folke/trouble.nvim')                          -- Navigates diagnostic messages from the language server
    use('glepnir/lspsaga.nvim')                        -- UI for langauge server features like goto and peek definition, hoverdoc, etc.
    use('j-hui/fidget.nvim')                           -- Updates on LSP status in the lower right corner of windows

    -- Autocompletion
    use('hrsh7th/nvim-cmp')                            -- Completion engine
    use('hrsh7th/cmp-buffer')                          -- Suggestions from open buffers
    use('hrsh7th/cmp-path')                            -- Suggestions from the file system
    use('saadparwaiz1/cmp_luasnip')                    -- Suggestions from Luasnip
    use('hrsh7th/cmp-nvim-lsp')                        -- Suggestions from the LSP
    use('hrsh7th/cmp-nvim-lua')                        -- Suggestions form the Neovm lua interface (e.g. `vim.api.nvim_cmd`)
    use('onsails/lspkind.nvim')                        -- Icons instead of text in the completion suggestion window

    -- debug stuff
    use('mfussenegger/nvim-dap')                       -- Common configurations for DAP
    use('rcarriga/nvim-dap-ui')                        -- A Debugger interface wrapped around DAP
    use('theHamsta/nvim-dap-virtual-text')             -- Show status (like variable values) from the debugger as virtual text
    -- test stuff
    -- use('nvim-neotest/neotest')
    -- use('antoinemadec/FixCursorHold.nvim')

    -- Language parsing help
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) -- Builds ASTs from current document to power other plugins
    use('nvim-treesitter/nvim-treesitter-textobjects') -- Use treesitter to create new text objects


    -- ruby stuff
    use('semanticart/ruby-code-actions.nvim')          -- Adds LSP code actions from Rubocop autosuggestions/diagnostics
    use('suketa/nvim-dap-ruby')                        -- Adds Debug Adapter support via debug.rb

    -- 6502 assembly stuff
    use('maxbane/vim-asm_ca65')                        -- Adds File type support for the ca65 6502 assembler
  end)

  if is_setup then
    packer.sync()
  end
end

if is_setup then
  print 'Plugins are being installed'
  print 'restart neovim once packer completes'
  return
end
