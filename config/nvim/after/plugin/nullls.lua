local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

local ruby_code_actions = require('ruby-code-actions')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.diagnostics.rubocop,
    ruby_code_actions.autocorrect_with_rubocop,
  },
})
