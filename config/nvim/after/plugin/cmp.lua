local ok_cmp, cmp = pcall(require, 'cmp')
if not ok_cmp then
  return
end

local ok_lspkind, lspkind = pcall(require, 'lspkind')
if not ok_lspkind then
  return
end

local ok_luasnip, luasnip = pcall(require, 'luasnip')
if not ok_luasnip then
  return
end

local ok_cmplsp, cmplsp = pcall(require, 'cmp_nvim_lsp')
if not ok_cmplsp then
  return
end

local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')
if not ok_lspconfig then
  return
end

cmp.setup({
  experimental = {
    ghost_text = false -- this feature conflict with copilot.vim's preview.
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  formatting = {
    expandable_indicator = true,
    fields = { 'abbr', 'kind', 'menu' },
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
  mapping = cmp.mapping.preset.insert({
    -- tab for next /shift-tab to complete?
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = false })
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'nvim_lsp_document_symbol', group_index = 2 },
    { name = 'nvim_lsp_signature_help', group_index = 2 },
    { name = 'lausnip', group_index = 1 },
    { name = 'path', group_index = 2 },
    { name = 'treesitter', group_index = 2 },
  }),
})

-- should probalby pretty load these - see mason config
local capabilities = cmplsp.default_capabilities()
lspconfig['lua_ls'].setup { capabilities = capabilities }
lspconfig['gopls'].setup { capabilities = capabilities }
lspconfig['solargraph'].setup({})
lspconfig['tsserver'].setup { capabilities = capabilities }
