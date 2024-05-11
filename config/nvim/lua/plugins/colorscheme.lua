-- see: https://github.com/catppuccin/nvim
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "macchiato",
		transparent_background = true,
	},
	config = LazySafeSetup("catppuccin", function()
		vim.cmd.colorscheme("catppuccin")
	end),
}
