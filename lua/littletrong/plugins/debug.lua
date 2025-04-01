return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
    },
    config = function()
      require("dap-go").setup()
      local dap = require("dap")
      local keymap = vim.keymap
      keymap.set("n", "<F5>", dap.continue, { desc = "Start Debugging" })
      keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
      keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
      keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    end
  }
}
