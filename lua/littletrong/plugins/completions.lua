-- return {
--   {
--     'saghen/blink.cmp',
--     dependencies = {
--       'rafamadriz/friendly-snippets',
--       'neovim/nvim-lspconfig',
--     },
--
--     version = 'v0.*',
--
--     opts = {
--       -- 'default' for mappings similar to built-in completion
--       -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
--       -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
--       -- see the "default configuration" section below for full documentation on how to define
--       -- your own keymap.
--       keymap = {
--         preset = 'enter',
--         ['<C-d>'] = { 'show', 'show_documentation', 'hide_documentation' },
--       },
--
--       appearance = {
--         -- Sets the fallback highlight groups to nvim-cmp's highlight groups
--         -- Useful for when your theme doesn't support blink.cmp
--         -- will be removed in a future release
--         use_nvim_cmp_as_default = true,
--         -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--         -- Adjusts spacing to ensure icons are aligned
--         nerd_font_variant = 'mono'
--       },
--
--       -- default list of enabled providers defined so that you can extend it
--       -- elsewhere in your config, without redefining it, via `opts_extend`
--
--       -- experimental signature help support
--       signature = {
--         enabled = true,
--         window = {
--           border = 'single'
--         }
--       },
--
--       completion = {
--         accept = {
--           -- experimental auto-brackets support
--           auto_brackets = {
--             enabled = false,
--           },
--         },
--       },
--
--       snippets = { preset = 'luasnip' },
--       sources = {
--         -- add vim-dadbod-completion to your completion providers
--         default = { "lsp", "path", "snippets", "buffer", "dadbod" },
--         providers = {
--           dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
--         },
--       }
--     },
--     -- allows extending the providers array elsewhere in your config
--     -- without having to redefine it
--   },
-- }

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local cmp = require 'cmp'

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

          -- For `mini.snippets` users:
          -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
          -- insert({ body = args.body }) -- Insert at cursor
          -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
          -- require("cmp.config").set_onetime({ sources = {} })
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      })
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]] --

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- Set up lspconfig.
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    --   capabilities = capabilities
    -- }
  end
}
