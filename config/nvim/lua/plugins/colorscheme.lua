-- There are many integrations and options. See here for details
-- https://github.com/catppuccin/nvim
-- Make the color for hidden chars lighter
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
