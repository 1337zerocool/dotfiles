-- This makes weird unexpected imports
-- expects that cmp_nvim LSP are there
-- expects that lsp config is there
local ok, mason = pcall(require, 'mason')
if not ok then
  return
end

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
  return
end

local servers = {
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  -- jsonls = {}
  -- arduino_language_server = {}
  gopls = {},
  tsserver = {},
  solargraph = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}
mason.setup()
mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

local ok, cmp = pcall(require, 'cmp_nvim_lsp')
if not ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp.default_capabilities(capabilities)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

mason_lspconfig.setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
})
