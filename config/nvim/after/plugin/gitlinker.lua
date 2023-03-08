local ok, gitlinker = pcall(require, 'gitlinker')
if not ok then
  return
end
gitlinker.setup({
  mappings = nil
})
-- yank to clipboard
-- lua require('gitlinker').get_buf_range_url()
-- lua require('gitlinker').get_buf_range_url()
-- lua package.loaded.gitlinker.get_buf_range_url()
