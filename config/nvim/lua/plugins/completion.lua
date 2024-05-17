--  --        'hrsh7th/cmp-nvim-lsp',                    -- use lsp as a completion source
--  --        'hrsh7th/cmp-nvim-lsp-signature-help',     -- show method signature help whie completing
--  --        'hrsh7th/cmp-nvim-lsp-document-symbol',    -- use document symbols as completion sources

-- An auto-completion system that integrates with LSP, treesitter, buffers, and other sources
-- through extensions. It requires a snippet system to work properly.
-- https://github.com/hrsh7th/nvim-cmp
local cmp = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	}
}

-- A snippet engine with completions powered by lua
-- https://github.com/L3MON4D3/LuaSnip
local luasnip = {
	"L3MON4D3/LuaSnip",
	build = (function() return "make install_jsregexp" end)(),
	event = "InsertEnter",
}
-- Uses completions provided by cmp_luasnip for completion:
-- https://github.com/saadparwaiz1/cmp_luasnip
local cmp_luasnip = {
	"saadparwaiz1/cmp_luasnip",
	event = "InsertEnter",
}

-- Uses completions for file system paths from cmp-path
-- https://github.com/hrsh7th/cmp-path
local cmp_path = {
	"hrsh7th/cmp-path",
	event = "InsertEnter",
}

return { cmp, luasnip, cmp_luasnip, cmp_path }
