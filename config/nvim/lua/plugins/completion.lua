--  --        'hrsh7th/cmp-nvim-lsp',                    -- use lsp as a completion source
--  --        'hrsh7th/cmp-nvim-lsp-signature-help',     -- show method signature help whie completing
--  --        'hrsh7th/cmp-nvim-lsp-document-symbol',    -- use document symbols as completion sources

-- Add some nice pictograms to the completion menu
-- https://github.com/onsails/lspkind.nvim
local lspkind = {
  'onsails/lspkind.nvim',
  opts = {
    preset = 'codicons',
    symbol_map = {
      Copilot = "",
    }
  }
}

-- add copilot as a completion source
-- https://github.com/zbirenbaum/copilot-cmp
local copilot_cmp = {
  "zbirenbaum/copilot-cmp",
  config = function()
    require("copilot_cmp").setup()
  end
}

-- An auto-completion system that integrates with LSP, treesitter, buffers, and other sources
-- through extensions. It requires a snippet system to work properly.
-- https://github.com/hrsh7th/nvim-cmp
local cmp = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "zbirenbaum/copilot-cmp",
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

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
          maxwidth = 50,
          mode = "symbol",
          ellipsis_char = "…",
          show_labelDetails = true,
          -- before = function (entry, vim_item)
          --   return vim_item
          -- end
        }),
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.close(),

        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {"i", "s"}),
      }),

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

      sources = cmp.config.sources({
        { name = "copilot", group_index = 2 },
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'nvim_lsp_document_symbol', group_index = 2 },
        { name = 'nvim_lsp_signature_help', group_index = 2 },
        { name = 'lausnip', group_index = 1 },
        { name = 'path', group_index = 2 },
        { name = 'treesitter', group_index = 2 },
      }),

    })

    -- should probalby pretty load these - see mason config
    -- local capabilities = cmplsp.default_capabilities()
    -- lspconfig['lua_ls'].setup { capabilities = capabilities }
    -- lspconfig['gopls'].setup { capabilities = capabilities }
    -- lspconfig['solargraph'].setup({})
    -- lspconfig['tsserver'].setup { capabilities = capabilities }

  end,
}

-- A snippet engine with completions powered by lua
-- https://github.com/L3MON4D3/LuaSnip
local luasnip = {
  "L3MON4D3/LuaSnip",
  build = (function() return "make install_jsregexp" end)(),
  event = "InsertEnter",
}
-- Uses completions provided by cmp_luasnip for completion:
-- https://github.com/saadparwaiz1/cmp_luasnip
local cmp_luasnip = {
  "saadparwaiz1/cmp_luasnip",
  event = "InsertEnter",
}

-- Uses completions for file system paths from cmp-path
-- https://github.com/hrsh7th/cmp-path
local cmp_path = {
  "hrsh7th/cmp-path",
  event = "InsertEnter",
}

return { lspkind, copilot_cmp, cmp, luasnip, cmp_luasnip, cmp_path }
