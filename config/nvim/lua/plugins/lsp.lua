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
    local lspcfg = require("mason-lspconfig")
    local cmp = require("cmp_nvim_lsp")

    -- maybe interesting:
    -- https://www.reddit.com/r/ruby/comments/1c06zr9/neovim_and_lsp_in_2024/
    -- https://github.com/mariochavez/lazyvim-config/blob/main/lua/plugins/ror.lua
    local servers = {
      ruby_lsp = {
        -- https://github.com/Shopify/ruby-lsp/blob/bc51df52ae5a1c532869b7750e4238203e6df0c2/jekyll/editors.markdown?plain=1#L48
        -- does everything by default
        -- except document symbols, workplace symbols, and hoverdoc
      },
      solargraph = {
        -- https://github.com/castwide/solargraph/blob/master/lib/solargraph/language_server/message/initialize.rb#L28
        -- https://github.com/luong-komorebi/neovim-dotfiles/blob/1e813e010d9bb21f83cd43f2a5b13bbfe7047711/lua/config/lang_config.lua#L118
        -- https://github.com/williamboman/mason.nvim/issues/1292
        -- adds only document and workplace symbols
      },
      sorbet = {
        -- adds only highlight untyped and maybe code actions, particularly on errors
        -- and hoverdoc
        -- https://github.com/sodiumjoe/dotfiles/blob/master/neovim/lua/sodium/plugins.lua
      },
      html = {},
      denols = {},
      cssls = {},
      emmet_ls = {},
      jsonls = {},
      gopls = {},
      -- https://github.com/Shopify/ruby-lsp/blob/bc51df52ae5a1c532869b7750e4238203e6df0c2/vscode/package.json#L375
      -- ruby_lsp = {
      --   mason = false,
      --   single_file_support = true,
      --   filetypes = { "ruby", "erb" },
      --   -- https://shopify.github.io/ruby-lsp/editors.html
      --   init_options = {
      --     rubyVersionManager = "chruby",
      --     enabledFeatures = {
      --       diagnostics = true,
      --       hover = false,
      --       completion = true,
      --     },
      --     formatter = "auto",
      --     linters = { "rubocop" },
      --   },
      -- },
      -- sorbet = {
      --   cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
      --   init_options = {
      --     highlightUntyped = true,
      --     enabledFeatures = {
      --       hover = false,
      --     }
      --
      --   },
      -- },
      -- solargraph = {
      --   -- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/solargraph.lua
      --   autoformat = false,
      --   formatting = false,
      --   completion = true,
      --   diagnostic = false,
      --   folding = true,
      --   references = false,
      --   rename = true,
      --   symbols = true,
      --   hover = false,
      -- },
      ts_ls = {},
      lua_ls = {
        Lua = {
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false },
          diagnostics = { globals = { "vim" }, },
        },
      },
    }


    mason.setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp.default_capabilities(capabilities)

    local on_attach = function(_, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "Format current buffer with LSP" })
    end

    lspcfg.setup({ ensure_installed = vim.tbl_keys(servers) })
    lspcfg.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        })
      end,
    })
  end
}

return { cmp_lsp, diaglist, lspsaga, mason, mason_lspconfig, lspconfig }
