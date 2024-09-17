return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local nls = require("null-ls")
    nls.setup({
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.prettier,
        nls.builtins.diagnostics.erb_lint,
        nls.builtins.diagnostics.rubocop,
        nls.builtins.formatting.rubocop,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
