call plug#begin()
  Plug 'arcticicestudio/nord-vim'          " A pretty set of colors
  Plug 'machakann/vim-sandwich'            " Manage 'surrounding' things like tags, brackets, and quotes
  Plug 'tpope/vim-commentary'              " Quickly toggle a line, block, etc. as comments

  " These are some dependencies for the file picker
  Plug 'nvim-lua/plenary.nvim'             " Shared function library
  Plug 'nvim-telescope/telescope.nvim'     " Telescope, a nice file chooser
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } "improves performance by using native FZF

  " Some helpful auto complete sources"
  Plug 'dcampos/nvim-snippy'                " Snippets for every language, like textmate
  Plug 'mattn/emmet-vim'                    " Clever ways to create HTML by writing CSS selectors

  " Completion via LSP
  Plug 'neovim/nvim-lspconfig'              " The ability to use language servers, needed elsewhere too
  Plug 'glepnir/lspsaga.nvim'               " A nice set of interfaces for LSP
  Plug 'hrsh7th/cmp-nvim-lsp'               " Use the LSP for completion
  Plug 'hrsh7th/nvim-cmp'                   " The menu completion system
  Plug 'dcampos/cmp-snippy'                 " Autocompletion from Snippet sources

  " Help make languages work better
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}    " Improve syntax highlighting
  Plug 'vim-ruby/vim-ruby'                                       " Features for Ruby
  Plug 'tpope/vim-rails'                                         " Features for Rails

  " consider prettyfold, indentblankline, formatter, dap, lsp, treesitter, testrunner, refactoring, diffview
  " highlightedyank, bufdelete, autopairs
  Plug 'folke/zen-mode.nvim'               " A replacement for my 'zoom to focus' function

call plug#end()

filetype plugin indent on                  " Enable automatic file type detection & indentation
set autoread                               " Enable automatic reloading of open files edited outside Vim
set backspace=eol,start,indent             " Enable backspace past end of line, start of edit, etc.
set clipboard+=unnamed                     " Enable the system clipboard unless a register is specified
set completeopt=menu,noinsert,menuone,noselect  " Don't auto-select unless a choice is made, use menu even with single option
set hidden                                 " Disable unloading of buffers that aren't visible
set history=1000                           " Enable remembering of 1000 commands, searches, inputs, and expressions
set mouse=a                                " Enable use of the mouse
set noerrorbells                           " Disable all error bells
set pumheight=15                           " Set an upper limit on the size of the pop-up menu
set shortmess+=I                           " Disable show the startup screen
set shortmess+=c                           " Disable Completion messages
set shortmess+=W                           " Disable 'wrote file' messages
set shortmess+=F                           " Disable file info when editing
set shortmess+=s                           " Disable Search wrapping messages
set visualbell                             " Disable beeping, use the visual bell instead
set wildmenu                               " Enable showing suggestions when using auto complete in command mode
set updatetime=500                         " Write to swap after 500ms of inactivity, also delay for cursor hold commands

" File encoding
set encoding=utf-8 nobomb                  " Make new files UTF-8 without BOM by default (BOM can cause issues)
set fileencoding=utf-8                     " Enable saving files as UTF-8 by default
set expandtab                              " Enable the use of spaces instead of tabs when indenting
set shiftwidth=2                           " Enable using 2 spaces for each level of indent
set softtabstop=2                          " Enable inserting 2 spaces when you press Tab
set tabstop=8                              " Enable treating Tabs as 8 spaces to keep layout in tabbed files sane

" Backup, swap, and history
set backupdir=~/.local/share/nvim/backup   " Path to store backup files (in case we screw up without real VCS)
set directory=~/.local/share/nvim/swap     " Path to store swap files (so we don't pollute other paths)
set nobackup                               " Disable backup files (because we use Git for versioning)

" Persistent undo
set undodir=~/.local/share/nvim/undo       " Path to persist undo files (for history that lasts cross-session)
set undofile                               " Enable saving backups between sessions

set spellfile=~/.local/share/nvim/words.utf-8.add
set spelllang=en_ca                        " Enable the Canadian English spelling dictionary
set spell                                  " Enable spell checking

" Indentation / cursor behaviour
" set cursorline                             " Highlight the line with the cursor
set autoindent                             " Enable Copy the current line's indent when making a new line
set nojoinspaces                           " Disable inserting two spaces after punctuation when you use a Join
set smartindent                            " Enable 'smarter' auto-indenting watching Syntax for hints
set smarttab                               " Enable tab matching indentation when used at the start of a line
set nowrap                                 " Disable automatic line wrapping

" Search and replace
set inccommand=nosplit                     " Show a preview of replacement commands as you type
set incsearch                              " Enable preview of a search while typing
set nohlsearch                             " Disable highlighting previous search results
set nosmartcase                            " Type what you want to find with capitalization

" Color and appearance
colorscheme nord                           " Use the nord colour scheme
let g:nord_italic=1                        " Enable italics for comments and args
set termguicolors                          " enable 'true color' mode. Note you have to use `gui=italic` or `guibg=italic` with this on
set background=dark                        " Enable Vim's 'use colours that look good on dark background' mode
set laststatus=2                           " Enable always showing the status line
set list                                   " Enable the display of 'invisible' characters like Tab, EOL, etc.
set number                                 " Enable line-number display
set scrolloff=5                            " Enable always showing 5 lines above/below the cursor position
set showcmd                                " Enable size of selection in command area
set noshowmode                             " Disable showing the mode in the status line
set sidescrolloff=10                       " Enable always showing 10 characters to the right of the cursor
set signcolumn=yes                         " Enable the display of the sign column at all times
set wildignorecase                         " Ignore case sensitivity in wildmenu (like tab-completing :commands)
syntax enable                              " Enable syntax highlighting

" Window and buffer management
set splitbelow                             " Open new splits below the currently active one
set splitright                             " Open new splits to the right of the currently active one

" Code folding
set nofoldenable                           " Disable folding by default - zi to enable
set foldlevel=2                            " Enable folding at the 'first level' inside of class/modules
set foldexpr=nvim_treesitter#foldexpr()    " Use Treesitter for folding
set foldmethod=expr                        " Enable treesitter-based indenting (as opposed to syntax/manual/indent)
set foldminlines=1                         " Enable folding of 'anything', even one line methods
set foldcolumn=0                           " Disable the column that shows folds
" set foldtext=v:folddashes
highlight Folded guifg=#616E88

" Create a custom status-line
set statusline=%<                                        " Where to truncate the file name
set statusline+=%f                                       " Path of the file in the buffer, relative to CWD
set statusline+=%=                                       " Split between left and right side items
set statusline+=%{''!=#&filetype?&filetype:'none'}       " File-type mode flag
set statusline+=%{&readonly?'\ ×\ ':'\ \ \ '}            " Read-only flag
set statusline+=%{&modified?'\ ✎\ ':'\ \ \ '}            " Modified flag
set statusline+=%4v                                      " Row of cursor
set statusline+=,                                        " Literal comma
set statusline+=%-4l                                     " Column of cursor
set statusline+=%3p%%                                    " Percentage through the file

" Toggle 'zooming' a split to fill the screen and restore to it's previous size
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()

" Move a visual selection up and down as a group
function! s:Move(address, at_limit)
  if visualmode() == 'V' && !a:at_limit
    execute "'<,'>move " . a:address
    call feedkeys('gv=', 'n')
  endif
  call feedkeys('gv', 'n')
endfunction
function! VisualUp() abort range
  let l:at_top=a:firstline == 1
  call s:Move("'<-2", l:at_top)
endfunction
function! VisualDown() abort range
  let l:at_bottom=a:lastline == line('$')
  call s:Move("'>+1", l:at_bottom)
endfunction

" Configure Telescope
lua << TELESCOPE
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }
  require('telescope').load_extension('fzf')
TELESCOPE

" Configure treesitter
lua << TREESITTER
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "ruby", "typescript", "json", "markdown", "python", "lua", "c", "rust", "go", "html", "css", },
    auto_install = true,
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    }
  }
TREESITTER

" Configure the LSP
lua << LSPCONFIG
  local lspconfig = require('lspconfig')

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  lspconfig.sorbet.setup({
    capabilities = capabilities,
  })

  lspconfig.cssls.setup({
    capabilities = capabilities,
  })

  lspconfig.html.setup({
    capabilities = capabilities,
  })
  
  lspconfig.tsserver.setup({
    capabilities = capabilities,
  })
  
  lspconfig.eslint.setup({
    capabilities = capabilities,
  })

  lspconfig.graphql.setup({
    capabilities = capabilities,
  })
LSPCONFIG

" Configure LSP Saga
lua << LSPSAGA
  require'lspsaga'.setup({
    symbol_in_winbar = {
      enable = false,
    },
    ui = {
      theme = 'round',
      title = false,
      border = 'solid',
      winblend = 0,
      diagnostic = '!',
      code_action = 'a',
      incoming = 'i',
      outgoing = 'o',
      preview = 'p',
      colapse = 'c',
      expand = 'e',
      colors = {
        normal_bg = '#000000',
        title_bg = '#333333',
        red = '#FF0000',
        magenta = '#FF00FF',
        orange = '#FF8700',
        yellow = '#f7bb3b',
        green = '#00FF00',
        cyan = '#36d0e0',
        blue = '#0000FF',
        purple = '#CBA6F7',
        white = '#FFFFFF',
        black = '#000000',
      },
      kind = {},
    }
  })
LSPSAGA

" Configure the completion system
lua << NVIMCMP
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        require('snippy').expand_snippet(args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      -- insert keybindings here
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'snippy' },
    }, {
      { name = 'buffer' },
    })
  })
NVIMCMP

" some key bindings for window and buffer management
let mapleader="\<Space>"
nnoremap <silent> <leader>\| :vsplit<cr>
nnoremap <silent> <leader>- :split<cr>
nnoremap <silent> <leader>] :bnext<cr>
nnoremap <silent> <leader>[ :bprev<cr>
nnoremap <silent> <leader>\ :bdelete!<cr>
nnoremap <silent> <leader><BS> :close<cr>
nnoremap <silent> <C-h> :wincmd h<cr>
nnoremap <silent> <C-j> :wincmd j<cr>
nnoremap <silent> <C-k> :wincmd k<cr>
nnoremap <silent> <C-l> :wincmd l<cr>
nnoremap <silent> ZZ ZQ

" expand %% do the path of current document when entering a command
cnoremap %% <C-R>=expand("%:h").'/'<cr>

" Bindings for my custom functions
xnoremap <silent> J :call VisualDown()<cr>
xnoremap <silent> K :call VisualUp()<cr>
nnoremap <silent> <leader>z :ZoomToggle<cr>

" Plugin bindings for telescope
nnoremap <silent> z= :Telescope spell_suggest<cr>
nnoremap <silent> <leader>t :Telescope find_files<cr>
nnoremap <silent> <leader>f :Telescope live_grep<cr>
nnoremap <silent> <leader>F :Telescope grep_string<cr>
nnoremap <silent> <leader>b :Telescope buffers<cr>
" nnoremap <silent> <leader>m :Telescope treesitter<cr>
" nnoremap <silent> <leader>M :Telescope lsp_workspace_symbols<cr>
" nnoremap <silent> gd :Telescope lsp_definitions<cr>

" LSP Saga bindings
nnoremap <silent> K :Lspsaga hover_doc<cr>
nnoremap <silent> <leader>p :Lspsaga peek_definition<cr>
nnoremap <silent> <leader>r :Lspsaga lsp_finder<cr>
