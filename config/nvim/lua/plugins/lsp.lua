-- Setup language servers
-- Language Server
--    'nvimdev/lspsaga.nvim',                        -- Nice front end to LSP features
--    {
--      'neovim/nvim-lspconfig',                     -- A basic configuration for LSP to start from
--      dependencies = {
--        {
--          'williamboman/mason.nvim',               -- Manages the installation of LSPs, Linters, formatting, etc.
--          config = true
--          },
--        'williamboman/mason-lspconfig.nvim',       -- makes it easier to use mason with lspconfig
--        'folke/neodev.nvim',                       -- Add neovim power to the LSPs for lua
--      },
--    },

-- Live updating LSP diagnostics
-- https://github.com/onsails/diaglist.nvim
local diaglist = {
	"onsails/diaglist.nvim",
}

return { diaglist }
