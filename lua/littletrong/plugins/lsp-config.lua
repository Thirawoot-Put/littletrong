return {
  -- LSP servers and clients communicate which features they support through  capabilities".
  --  By default, Neovim supports a subset of the LSP specification.
  --  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
  --  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
  --
  -- This can vary by config, but in general for nvim-lspconfig:
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = "LspInfo",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- 'saghen/blink.cmp',
      'williamboman/mason-lspconfig.nvim'
    },

    -- example using `opts` for defining servers
    opts = {
      servers = {
        -- terraform-ls
        terraformls = {},

        lua_ls = {},
        -- golang
        gopls = {},
        golangci_lint_ls = {},

        -- typescript/javascript
        ts_ls = {},
        vtsls = {},
        biome = {},
        quick_lint_js = {},

        -- frontend core
        html = {},
        cssls = {},
        cssmodules_ls = {},
        unocss = {},
        tailwindcss = {},

        -- docker
        dockerls = {},
        docker_compose_language_service = {},

        eslint = {},

        -- haskell
        --  hls = {},

        -- openapi/yaml
        spectral = {},
        vacuum = {},
        hydra_lsp = {},
        yamlls = {},

        prismals = {}, -- prisma

        -- sql
        sqlls = {},
        sqls = {},

        -- rust
        rust_analyzer = {},

        -- php
        intelephense = {},

        -- buffer, proto
        buf_ls = {}
      }
    },

    config = function(_, opts)
      require('mason').setup()

      local lsp_zero = require("lsp-zero")
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')

      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        local lsp_zero_opts = { buffer = bufnr }

        lsp_zero.default_keymaps(lsp_zero_opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, lsp_zero_opts)
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<cr>")
        vim.keymap.set("n", "gr", vim.lsp.buf.references, lsp_zero_opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, lsp_zero_opts)
        vim.keymap.set("n", "gx", "<cmd>lua vim.lsp.buf.code_action()<cr>", lsp_zero_opts)
        vim.keymap.set("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<cr>", lsp_zero_opts)
        vim.keymap.set("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", lsp_zero_opts)

        lsp_zero.buffer_autoformat()
      end)

      lsp_zero.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
      })

      lspconfig.ts_ls.setup({
        root_dir = lspconfig.util.root_pattern(
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json"
        ),
      })

      lspconfig.gopls.setup({
        gofumpt = true,
        staticcheck = true,
        analyses = { unusedparams = true },
      })

      lspconfig.golangci_lint_ls.setup({
        filetypes = { "go", "gomod" },
        cmd = { "golangci-lint", "run", "--fix", "--out-format", "json" },
        root_dir = lspconfig.util.root_pattern(".git", "go.mod", "go.work"),
        -- settings = {
        -- golangci_lint = {
        --   linters = { "govet", "gosec", "staticcheck" },
        -- }
        -- }
      })

      lspconfig.terraformls.setup({
        settings = {
          terraform = {
            validateOnSave = true,
          },
        },
      })


      lspconfig.sqls.setup({
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })

      lspconfig.buf_ls.setup({})

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(opts.servers), -- Automatically install listed servers
        automatic_installation = true,
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            lspconfig.lua_ls.setup(lua_opts)
          end,
        },
      })

      -- for server, config in pairs(opts.servers) do
      -- config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      -- lspconfig[server].setup(config)
      -- end
    end
  }
}
