-- Nice UI improvements
--    'stevearc/dressing.nvim',         -- Provides a nicer UI selection system for telescope et al.
--    'nvim-tree/nvim-web-devicons',    -- Icon library used by several plugins to show icons by files/types
--    'rcarriga/nvim-notify',           -- Notifications from language servers and stuff, out of the command line into windows
--    'folke/noice.nvim',               -- Move around command line, notifications, etc. Too much stuff
--    'Bekaboo/dropbar.nvim',           -- A little bar that gives context on where you are
--    'shellRaining/hlchunk.nvim',      -- Visual guidelines for level of indentation
--    'nvim-lualine/lualine.nvim',      -- Status line at bottom of windows
--    'xiyaowong/virtcolumn.nvim',      -- Mark the end of lines using ascii in color column
--    'code-biscuits/nvim-biscuits',    -- show 'opening' context at end of block as virtual text'
--    'folke/zen-mode.nvim',            -- Zooms and focuses a single window
--    'folke/twilight.nvim',            -- Dims text outside of some small context around the current scope
--    'machakann/vim-sandwich',         -- Wrap text objects in brackets, quotes, tags, etc.
--    'folke/trouble.nvim',             -- Improved diagnostics
--    'onsails/lspkind.nvim',		-- LSPKind


-- Hard requirement for neotree: A UI component library
-- https://github.com/MunifTanjim/nui.nvim
local nui = {
	"MunifTanjim/nui.nvim",
}

-- Hard requirement for neotree: a library for asyncronus programming
-- https://github.com/nvim-lua/plenary.nvim
local plenary = {
	"nvim-lua/plenary.nvim",
}

-- A file explorer
-- https://github.com/nvim-neo-tree/neo-tree.nvim
local neotree = {
	"nvim-neo-tree/neo-tree.nvim",

}

return { nui, plenary, neotree }
