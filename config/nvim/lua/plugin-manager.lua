-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

-- A global "Safe load and run some code" function for lazy=configured plugins
function LazySafeSetup(name, callback)
	return function(plugin, opts)
		local ok, module = pcall(require, name)
		if ok then
			module.setup(opts)
			callback()
		else
			print("Error in LazySafeSetup for '" .. name .. "'")
		end
	end
end

-- Setup some options for Lazy plugin loader
local options = {
	install = {
		missing = true,
		colorscheme = { "catppuccin" },
	},
	checker = {
		enabled = true,
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			reset = true,
			disabled_plugins = { },
		},
	},
}

-- Automatically install lazy plugin loader
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy plugin manager
local ok, lazyplugins = pcall(require, "lazy")
if ok then
	lazyplugins.setup("plugins", options)
else
	print("Failed to load 'lazy' plugin manager")
end
