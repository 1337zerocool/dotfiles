local ok, prettyfold = pcall(require, 'pretty-fold')
if not ok then
  return
end

prettyfold.setup({
  sections = {
    left = {'content'},
    right = {'number_of_folded_lines'},
    fill_char = '-',
    remove_fold_markers = true,
    keep_indentation = true,
    process_comment_signs = 'spaces',
  }
})
