-- Enable automatic insertion of mathing quotes and brackets
-- https://github.com/windwp/nvim-autopairs

local autopairs = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
}

-- Further extends treesitter to automatically insert "end" for function sin lua/ruby/etc
-- https://github.com/RRethy/nvim-treesitter-endwise
local endwise = {
	"RRethy/nvim-treesitter-endwise",
	event = "InsertEnter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}

return { autopairs, endwise }
