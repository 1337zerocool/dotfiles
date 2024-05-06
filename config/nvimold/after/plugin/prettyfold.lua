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

-- Some notes on folding
-- zn fold nothing
-- zN fold normally
-- zi toggle folding nothing/normally
-- za toggle fold at current level
-- zo open (capital for recursive)
-- zc close (capital for recursive)
-- zr fold reduce
-- zm fold more
-- zM fold everything
-- zR unfold everything
