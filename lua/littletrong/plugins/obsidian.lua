return {
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

    ui = {
      enable = true,
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" }, -- task
        ["x"] = { char = "", hl_group = "ObsidianDone" }, -- task complete
        [">"] = { char = "", hl_group = "ObsidianRightArrow" }, -- task migrate
        -- ["<"] = { char = "", hl_group = "ObsidianLeftArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" }, -- task canceled
        ["!"] = { char = "", hl_group = "ObsidianImportant" }, -- important
        ["e"] = { char = "󰯸", hl_group = "ObsidianEvent" }, -- event
      },

      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
        ObsidianEvent = { bg = "#FFFF00" }
      },
    },
    mappings = {
      ["<CR>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      }
    },
  },
  config = function(_, opts)
    require('obsidian').setup(opts)
    --   local keymap = vim.keymap
    --   keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "obsidian create new note" })
    --   keymap.set("n", "<leader>og", ":ObsidianSearch<CR>", { desc = "obsidian search note" })
    --   keymap.set("n", "<leader>os", ":ObsidianQuickSwitch<CR>", { desc = "obsidian search note" })
    --   keymap.set("n", "<leader>of", ":ObsidianFollowLink<CR>", { desc = "obsidian follow link with open vertical pane" })
    --   keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "obsidian get backlinks" })
    --   keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "obsidian open note" })
  end
}
