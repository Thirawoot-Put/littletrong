return {
  -- LSP servers and clients communicate which features they support through  capabilities".
  --  By default, Neovim supports a subset of the LSP specification.
  --  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
  --  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
  --
  -- This can vary by config, but in general for nvim-lspconfig:

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim'
    },

    -- example using `opts` for defining servers
    opts = {
      servers = {
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
      }
    },

    config = function(_, opts)
      require('mason').setup()

      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')

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
      lspconfig.golangci_lint_ls.setup({
        filetypes = { "go", "gomod" },
      })
      lspconfig.sqls.setup({
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(opts.servers), -- Automatically install listed servers
        automatic_installation = true,
      })

      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end
  }
}
