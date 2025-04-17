return {
  -- pomodoro timer
  -- {
  -- "epwalsh/pomo.nvim",
  -- version = "*", -- Recommended, use latest release instead of latest commit
  -- lazy = true,
  -- cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  -- dependencies = {
  --   -- Optional, but highly recommended if you want to use the "Default" timer
  --   "rcarriga/nvim-notify",
  -- },
  -- opts = {
  --   -- See below for full list of options 👇
  --   sessions = {
  --     -- Example session configuration for a session called "pomodoro".
  --     pomodoro = {
  --       { name = "Work",        duration = "25m" },
  --       { name = "Short Break", duration = "5m" },
  --       { name = "Work",        duration = "25m" },
  --       { name = "Short Break", duration = "5m" },
  --       { name = "Work",        duration = "25m" },
  --       { name = "Long Break",  duration = "10m" },
  --     },
  --   },
  -- },
  -- },
  -- -- obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   -- "BufReadPre path/to/my-vault/*.md",
    --   -- "BufNewFile path/to/my-vault/*.md",
    --   "BufReadPre " .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/MySecondBrain/*.md",
    --   "BufNewFile " .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/MySecondBrain/*.md",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter",
    },
    opts = {
      workspaces = {
        {
          name = "MySecondBrain",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/MySecondBrain",
        },
        -- {
        --   name = "work",
        --   path = "~/vaults/work",
        -- },
      },
    },
    -- config = function(_, opts)
    --   require("obsidian").setup(opts)
    --   local keymap = vim.keymap
    --   keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "obsidian create new note" })
    --   keymap.set("n", "<leader>og", ":ObsidianSearch<CR>", { desc = "obsidian search note" })
    --   keymap.set("n", "<leader>os", ":ObsidianQuickSwitch<CR>", { desc = "obsidian search note" })
    --   keymap.set("n", "<leader>of", ":ObsidianFollowLink<CR>", { desc = "obsidian follow link with open vertical pane" })
    --   keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "obsidian get backlinks" })
    --   keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "obsidian open note" })
    -- end
  },
}
