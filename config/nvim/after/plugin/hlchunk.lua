local ok, hlchunk = pcall(require, 'hlchunk')
if not ok then
  return
end

hlchunk.setup({
  blank = { enable = false, },
  chunk = { enable = false, },
  line_num = {
    enable = false,
    style = '#88C0D0'
  },
  indent = {
    use_treesitter = true,
    enable = true,
    chars = { "│", "¦", "┆", "┊", },
    style = { '#3B4252' }
  },
})
