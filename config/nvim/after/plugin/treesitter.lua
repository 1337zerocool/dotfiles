local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

treesitter.setup({
  ensure_installed = {
    'arduino',
    'c',
    'comment',
    'css',
    'diff',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'go',
    'graphql',
    'html',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'regex',
    'ruby',
    'rust',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  endwise = {
    enable = true,
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = true,
      -- consider @scope, @loop, @conditional, @class
      goto_next_start = {
        [']]'] = '@function.outer',
      },
      goto_previous_start = {
        ['[['] = '@function.outer',
      },
      goto_next_end = {
        ['[]'] = '@function.outer',
      },
      goto_previous_end = {
        [']['] = '@function.outer',
      },
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    }
  },
})

-- setup keymaps for ;,ft to repeat ts moves too
-- vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
-- vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)
-- vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
-- vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
-- vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
-- vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)
