-- 'nvim-neotest/neotest',                      -- run related tests
-- 'nvim-neotest/nvim-nio',
-- 'nvim-lua/plenary.nvim',
-- 'antoinemadec/FixCursorHold.nvim',
-- 'nvim-treesitter/nvim-treesitter',
-- 'zidhuss/neotest-minitest',                -- make it work with minitest
--
--
--
-- Hard requirement for Neotest: a library for asyncronus programming
-- https://github.com/nvim-neotest/nvim-nio
local nvio = {
	"nvim-neotest/nvim-nio",
	priority = 100,
}

-- Hard requirement for Neotest: a library for asyncronus programming
-- https://github.com/nvim-lua/plenary.nvim
local plenary = {
	"nvim-lua/plenary.nvim",
}

-- Hard requirement for Neotest. See treesitter.lua for the full config
-- https://github.com/nvim-treesitter/nvim-treesitter
local treesitter = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}

-- Interact with test framworks from within neovim
-- https://github.com/nvim-neotest/neotest
local neotest = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	}
}

return { nvio, plenary, treesitter, neotest }
