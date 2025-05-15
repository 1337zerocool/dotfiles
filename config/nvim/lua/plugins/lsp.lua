-- Live updating LSP diagnostics
-- https://github.com/onsails/diaglist.nvim
local diaglist = {
  "onsails/diaglist.nvim",
}

-- Offers a nice front end to LSP features
-- https://github.com/nvimdev/lspsaga.nvim
local lspsaga = {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      ui = {
        title = false,
        border = "rounded",
      },
      diagnostic = {
        on_insert = false,
        on_insert_follow = false,
        border_follow = false,
        show_code_action = true,
        jump_num_shortcut = true,
        diagnostic_only_current = false
      },
      lightbulb = {
        enable = false,
      },
      beacon = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
      outline = {
        win_position = "right",
        win_width = 30,
        auto_preview = false,
        layout = "normal",
        detail = false,
      }
    })
    -- can't use lazy to do keymaps for some reason
    vim.keymap.set({ "n", "v" }, "gd", "<cmd>Lspsaga goto_definition<cr>", { silent = true, desc = "Go to definition" })
    vim.keymap.set({ "n", "v" }, "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, desc = "Show hover documentation" })
    vim.keymap.set({ "n", "v" }, "<leader>o", "<cmd>Lspsaga outline<cr>", { silent = true, desc = "Show outline of the code" })
    vim.keymap.set({ "n", "v" }, "<leader>r", "<cmd>Lspsaga finder<cr>", { silent = true, desc = "Show references" })
    vim.keymap.set({ "n", "v" }, "<leader>p", "<cmd>Lspsaga peek_definition<cr>", { silent = true, desc = "Peek definition" })
    vim.keymap.set({ "n", "v" }, "<leader>=", vim.lsp.buf.format, { silent = true, desc = "Format the current buffer" })
    vim.keymap.set({ "n", "v" }, "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, desc = "Go to next diagnostic" })
    vim.keymap.set({ "n", "v" }, "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true, desc = "Go to previous diagnostic" })
    vim.keymap.set({ "n", "v" }, "<leader>x", "<cmd>Lspsaga code_action<cr>", { silent = true, desc = "Code Actions" })
    -- disable standard vim virtual text becaues it's redundant
    vim.diagnostic.config({ virtual_text = false })
  end,
}

-- LSP configurations to get started with
-- https://github.com/neovim/nvim-lspconfig
local lspconfig = {
  "neovim/nvim-lspconfig",
}


-- connects LSP config to mason
-- https://github.com/williamboman/mason-lspconfig.nvim
local mason_lspconfig = {
  "williamboman/mason-lspconfig.nvim",
}

-- Provides for LSP to be a completion source for CMP
-- https://github.com/hrsh7th/cmp-nvim-lsp
local cmp_lsp = {
  "hrsh7th/cmp-nvim-lsp",
}

-- manages LSPs, Linters, formatters, etc.
-- https://github.com/williamboman/mason.nvim
local mason = {
  "williamboman/mason.nvim",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    mason.setup()

    local mason_lsp = require("mason-lspconfig")
    mason_lsp.setup({
      ensure_installed = {
        "html",
        "denols",
        "cssls",
        "emmet_ls",
        "jsonls",
        "gopls",
        -- "ruby_lsp",
        -- "sorbet",
        -- "solargraph",
        "ts_ls",
        "lua_ls",
      }
    })


    local cmp = require("cmp_nvim_lsp")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp.default_capabilities(capabilities)



    local on_attach = function(_, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "Format current buffer with LSP" })
    end

    -- Some notes on workign with multiple LSPS that provide help
    -- https://github.com/astral-sh/ruff-lsp/issues/78
    -- https://neovim.discourse.group/t/how-to-config-multiple-lsp-for-document-hover/3093/2
    -- lua =vim.lsp.get_active_clients()[1].name
    -- lua =vim.lsp.get_active_clients()[1].server_capabilities
    -- check NoiceAll
    -- then write a custom on-attach
    -- lspconfig['foo'].setup({
    --   enabled = true,
    --   filetypes = { "foo" },
    --   on_attach = function(client, _)
    --     client.server_capabilities.signatureHelpProvider = false
    --   end,
    -- })
    -- 
    local cfg = require("lspconfig")

    -- cfg.ruby_lsp.setup({
    --   enabled = true,
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   -- https://shopify.github.io/ruby-lsp/editors.html#Neovim
    --   init_options = {
    --     enabledFeatures = {
    --       codeActions = true, -- good
    --       codeLens = true,    -- good
    --       completion = false, -- not bad
    --       definition = false,
    --       diagnostics = true,
    --       documentHighlights = false,
    --       documentLink = false,
    --       documentSymbols = true,  -- good
    --       foldingRanges = false,
    --       formatting = false,
    --       hover = false,
    --       inlayHint = true,
    --       onTypeFormatting = true,
    --       selectionRanges = false,
    --       semanticHighlighting = true,
    --       signatureHelp = false,
    --       typeHierarchy = false,
    --       workspaceSymbol = false,
    --     },
    --     featuresConfiguration = {
    --       inlayHints = {
    --         implicitHashValue = true,
    --         implicitRescue = true,
    --       },
    --     },
    --     indexing = {
    --       excludedPatterns = { "*.rbs" },
    --       includedPatterns = { "*.rb" },
    --       excludedGems = { "bundler" },
    --       excludedMagicComments = { "compiled: true" },
    --     },
    --     formatter = 'auto',
    --     linters = { 'rubocop' },
    --   },
    --   filetypes = { "ruby", "erb" },
    -- })
    --
    -- cfg.sorbet.setup({
    --   enabled = true,
    --   capabilities = capabilities,
    --   on_attach = function(client, _)
    --     client.server_capabilities.definitionProvider = false
    --     client.server_capabilities.workspaceSymbolProvider = false
    --     client.server_capabilities.completionProvider = false
    --   end,
    --   -- figure out how to disable definitions
    --   -- make it stop poluting the workspace symbols list
    --   init_options = {
    --     highlightUntyped = true,
    --   },
    --   filetypes = { "ruby", "erb" },
    -- })
    --
    -- cfg.solargraph.setup({
    --   enabled = true,
    --   on_attach = on_attach,
    --   settings = {
    --     solargraph = {
    --       codeActions = false,
    --       codeLens = false,
    --       completion = false,
    --       definition = false,
    --       diagnostics = false,
    --       documentHighlights = false,
    --       documentLink = false,
    --       documentSymbols = false,
    --       foldingRanges = false,
    --       formatting = false,
    --       hover = false,
    --       inlayHint = false,
    --       onTypeFormatting = false,
    --       selectionRanges = false,
    --       semanticHighlighting = false,
    --       signatureHelp = false,
    --       typeHierarchy = false,
    --       workspaceSymbol = true,
    --     },
    --   },
    --   filetypes = { "ruby", "erb" },
    -- })
    --

    cfg.html.setup({ enabled = true, capabilities = capabilities, on_attach = on_attach, })

    cfg.denols.setup({ enabled = true, capabilities = capabilities, on_attach = on_attach, })

    cfg.cssls.setup({ enabled = true, capabilities = capabilities, on_attach = on_attach, })

    cfg.emmet_ls.setup({ enabled = true, capabilities = capabilities, on_attach = on_attach, })

    cfg.jsonls.setup({ enabled = true, capabilities = capabilities, on_attach = on_attach, })

    cfg.gopls.setup({ enabled = true, capabilities = capabilities, on_attach = on_attach, })

    cfg.ts_ls.setup({ enabled = true, capabilities = capabilities, on_attach = on_attach, })

    cfg.lua_ls.setup({
      enabled = true,
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false },
          diagnostics = { globals = { "vim" }, },
        },
      },
    })

  end
}

return { cmp_lsp, diaglist, lspsaga, mason, mason_lspconfig, lspconfig }
