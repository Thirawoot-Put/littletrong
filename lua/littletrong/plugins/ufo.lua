return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" }, -- Required dependency
  config = function()
    -- Configuration for nvim-ufo goes here
    local ufo = require("ufo")
    ufo.setup({
      -- Enable folding for all file types
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" 󰁂 %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end,
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" } -- Use treesitter and indent-based folding
      end,
      close_fold_kinds = { "imports" },   -- Automatically close folds for imports
      preview = {
        win_config = {
          border = "rounded",             -- Border style for the preview window
          winhighlight = "Normal:Folded", -- Highlight for the preview window
          winblend = 0,                   -- Transparency for the preview window
        },
        mappings = {
          scrollU = "<C-u>", -- Scroll up in the preview window
          scrollD = "<C-d>", -- Scroll down in the preview window
        },
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
    keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
    keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "Open folds except kinds" })
    keymap.set("n", "zm", ufo.closeFoldsWith, { desc = "Close folds with" })
    keymap.set("n", "zp", ufo.peekFoldedLinesUnderCursor, { desc = "Peek folded lines" })

    local api = vim.api
    api.nvim_set_hl(0, "Folded", { fg = "#c678dd", bg = "#282c34", italic = true })
    api.nvim_set_hl(0, "FoldColumn", { fg = "#c678dd", bg = "#282c34" })
  end,
}
