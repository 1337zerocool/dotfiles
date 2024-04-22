vim.opt.formatoptions = 'nt' -- t = autowrap textwidth
                             -- n = recognize numbered lists
vim.opt.textwidth = 80
vim.opt.smartindent = false
vim.opt.wrapmargin = 0
vim.opt.autoindent = false
vim.opt.cindent = false
vim.opt.indentexpr = ''

-- fixes busted highligting when treesitter is around
vim.cmd('TSDisable highlight')
