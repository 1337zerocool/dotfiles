vim.opt.termguicolors = true
vim.opt.backspace = 'eol,start,indent'
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.autoread = true
vim.opt.completeopt = 'menu,noinsert,menuone,noselect'
vim.opt.hidden = true
vim.opt.history = 1000
vim.opt.mouse = 'a'
vim.opt.errorbells = false
vim.opt.pumheight = 15
vim.opt.shortmess='IcWFsT'
vim.opt.visualbell = false
vim.opt.wildmenu = true
vim.opt.updatetime = 500

--vim.opt.encoding = 'utf-8'
--vim.opt.fileencoding = 'utf-8 nobomb'
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 8

vim.opt.backup = false
vim.opt.backupdir = vim.fn.stdpath('data') .. '/backup'
vim.opt.directory = vim.fn.stdpath('data') .. '/swap'
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'
vim.opt.undofile = true
--vim.opt.spellfile = vim.fn.stdpath('data') .. '/words.txt'
vim.opt.spelllang = 'en_ca'
vim.opt.spell = true

vim.opt.autoindent = true
vim.opt.joinspaces = false
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.wrap = false

vim.opt.inccommand = 'nosplit'
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.smartcase = false
vim.opt.background = 'dark'
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.number = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.signcolumn = 'yes:1'
vim.opt.wildignorecase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.foldenable = false
vim.opt.foldlevel = 2
vim.opt.foldmethod='expr'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
vim.opt.foldminlines = 1
vim.opt.foldcolumn = '0'
vim.opt.list = true
vim.opt.listchars = {
  -- space = '·',
  nbsp = '○',
  tab = '→ ',
  eol = '↵',
  trail = '␣',
  extends = '⇀',
  precedes = '↼'
}

vim.g.virtcolumn_char = '▕'
vim.g.virtcolumn_priority = 10
vim.api.nvim_set_hl(0, 'VirtColumn', { fg='#3B4252' })
vim.opt.colorcolumn = "100"

vim.fn.sign_define("DiagnosticSignError" , { text = "", texthl="DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn" , { text = "", texthl="DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo" , { text = "", texthl="DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint" , { text = "", texthl="DiagnosticSignHint" })

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg='#434C5E'})
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg='#434C5E' })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg='#434C5E' })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg='#434C5E' })

vim.diagnostic.config({
  virtual_text = { prefix = '●', }, -- set to false to disable virtual text
  severity_sort = true,
})
