-- see: https://github.com/nvim-treesitter/nvim-treesitter
-- specifiy some dependencies
return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
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
