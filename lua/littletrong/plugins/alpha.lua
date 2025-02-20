return {
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      -- local ctp = require("catppuccin.palettes").get_palette() -- Get the Catppuccin color palette

      -- vim.api.nvim_set_hl(0, "DashboardHeader", { fg = ctp.lavender })

      dashboard.section.header.val = {
        [[                                                                                         ]],
        [[     __     ______  ______  ______  __       ____               ______   __  __          ]],
        [[    /\ \   /\__  _\/\__  _\/\__  _\/\ \     /\  _`\    /'\_/`\ /\  _  \ /\ \/\ \         ]],
        [[    \ \ \  \/_/\ \/\/_/\ \/\/_/\ \/\ \ \    \ \ \L\_\ /\      \\ \ \L\ \\ \ `\\ \        ]],
        [[     \ \ \  __\ \ \   \ \ \   \ \ \ \ \ \  __\ \  _\L \ \ \__\ \\ \  __ \\ \ , ` \       ]],
        [[      \ \ \L\ \\_\ \__ \ \ \   \ \ \ \ \ \L\ \\ \ \L\ \\ \ \_/\ \\ \ \/\ \\ \ \`\ \      ]],
        [[       \ \____//\_____\ \ \_\   \ \_\ \ \____/ \ \____/ \ \_\\ \_\\ \_\ \_\\ \_\ \_\     ]],
        [[        \/___/ \/_____/  \/_/    \/_/  \/___/   \/___/   \/_/ \/_/ \/_/\/_/ \/_/\/_/     ]],
        [[                                                                                         ]],
        [[                                                                                         ]],
      }

      dashboard.section.header.opts = {
        position = "center",
        hl = "DashboardHeader"
      }

      dashboard.section.buttons.val = {
        dashboard.button("L", "[0] > Open Lazy", "<cmd>Lazy <CR>"),
        dashboard.button("M", "[1] > Open Lazy", "<cmd>Mason <CR>"),
        dashboard.button("e", "  > Toggle file explorer", ":NvimTreeToggle <CR>"),
        dashboard.button("f", "  > Find file", ":Telescope find_files <CR>"),
        dashboard.button("s", "  > Find text", ":Telescope live_grep <CR>"),
      }

      dashboard.config.layout = {
        { type = "padding", val = 10 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.opts)

      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
  },
}
