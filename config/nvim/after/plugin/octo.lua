local ok, octo = pcall(require, 'octo')
if not ok then
  return
end

-- https://github.com/pwntester/octo.nvim
-- There are so many mappings you need to go check those out
octo.setup({
  mappings = {
    issue = {},
    pull_request = {},
    review_thread = {},
    submit_win = {},
    review_diff = {},
    file_panel = {
      next_entry = { lhs = 'j', desc = 'move to next changed file' },
      prev_entry = { lhs = 'k', desc = 'move to previous changed file' },
      select_entry = { lhs = '<cr>', desc = 'show selected changed file diffs' },
      refresh_files = { lhs = 'R', desc = 'refresh changed files panel' },
      close_review_tab = { lhs = '<C-c>', desc = 'close review tab' },
      toggle_viewed = { lhs = '<leader><space>', desc = 'toggle viewer viewed state' },
    },
  },
})
