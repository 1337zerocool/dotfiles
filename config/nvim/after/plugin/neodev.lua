local ok, neodev = pcall(require, 'neodev')
if not ok then
  return
end

neodev.setup({
  library = {
    enabled = true,
    runtime = true,
    types = true,
    plugins = { "nvim-dap-ui", "neotest" },
  },
  override = function(root_dir, options) end,
  setup_jsonls = true,
  lspconfig = true,
  pathStrict = true,
})
