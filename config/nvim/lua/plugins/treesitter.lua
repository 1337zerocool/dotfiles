-- A fast document parser that provides syntax coloring, folding, indentation, etc.
-- https://github.com/nvim-treesitter/nvim-treesitter

local treesitter = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"comment",
			"css",
			"diff",
			"git_config",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"graphql",
			"html",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"ruby",
			"sql",
			"typescript",
			"yaml",
		},
		highlight = { enable = true },
		indent = { enable = true },  
	},
	priority = 100,
	config = LazySafeSetup("nvim-treesitter.configs", function() end)
}

-- Extends text objects by using treesitter for scopes, classes, methods, etc.
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

local textobjects = {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},


}

return { treesitter, textobjects }
