local ok_cmp, cmp = pcall(require, 'cmp')
if not ok_cmp then
  return
end

local ok_lspkind, lspkind = pcall(require, 'lspkind')
if not ok_lspkind then
  return
end

local ok_lsp, lsp = pcall(require, 'lsp-zero')
if not ok_lsp then
  return
end

local cmp_select = {behavior = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
})


local cmp_config = lsp.defaults.cmp_config({
  mapping = cmp_mappings,
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '…',
    })
  },
  window = {
    completion = cmp.config.window.bordered({
      border = 'rounded',
      scrollbar = false,
      winhighlight = 'Normal:Normal,FloatBorder:CmpMenuBorder,CursorLine:Pmenusel,Search:None',
    }),
    documentation = cmp.config.window.bordered({
      border = 'rounded',
      scrollbar = false,
      winhighlight = 'Normal:Normal,FloatBorder:CmpMenuBorder,CursorLine:Pmenusel,Search:None',
    }),
  },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
  }
})

cmp.setup(cmp_config)
