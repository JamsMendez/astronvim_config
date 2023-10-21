return {
  {
    "noice.nvim",
    opts = {
      cmdline = {
        enabled = true,
      },
      messages = {
        enabled = false,
      },
      popupmenu = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = false,
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        hover = {
          border = {
            style = "rounded",
            padding = { 0, 2 },
          },
        },
      },
    },
  },
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"

      opts.statusline = {
        status.component.mode {
          mode_text = {
            icon = {
              kind = "VimIcon",
              padding = {
                right = 1,
                left = 1,
              },
            },
            padding = {
              right = 1,
            },
          },
        }, -- add all the other components for the statusline
        status.component.git_branch(),
        status.component.file_info(),
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
      }
      return opts
    end,
  },
  --   {
  --     "xiantang/darcula-dark.nvim",
  --     dependencies = {
  --       "nvim-treesitter/nvim-treesitter",
  --     },
  --   },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup {
        style = "storm",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        -- on_colors = function (colors)
        -- end
      }
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },

  --   {
  --     "baliestri/aura-theme",
  --     lazy = false,
  --     priority = 1000,
  --     config = function(plugin)
  --       vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
  --       -- vim.cmd [[colorscheme aura-dark]]
  --     end,
  --   },
  -- { "lvimuser/lsp-inlayhints.nvim", config = true },
  -- { "fatih/vim-go" },
  --   { "ray-x/guihua.lua" },
  --   {
  --     "ray-x/go.nvim",
  --     requires = {
  --       "ray-x/guihua.lua",
  --       "neovim/nvim-lspconfig",
  --       "nvim-treesitter/nvim-treesitter",
  --     },
  --     config = function()
  --       require("go").setup {
  --         lsp_inlay_hints = {
  --           enable = true,
  --           -- Only show inlay hints for the current line
  --           only_current_line = false,
  --           -- Event which triggers a refersh of the inlay hints.
  --           -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
  --           -- not that this may cause higher CPU usage.
  --           -- This option is only respected when only_current_line and
  --           -- autoSetHints both are true.
  --           only_current_line_autocmd = "CursorHold,CursorMoved,CursorMovedI",
  --           -- whether to show variable name before type hints with the inlay hints or not
  --           -- default: false
  --           show_variable_name = true,
  --           -- prefix for parameter hints
  --           parameter_hints_prefix = " ",
  --           show_parameter_hints = true,
  --           -- prefix for all the other hints (type, chaining)
  --           other_hints_prefix = "=> ",
  --           -- whether to align to the lenght of the longest line in the file
  --           max_len_align = false,
  --           -- padding from the left if max_len_align is true
  --           max_len_align_padding = 1,
  --           -- whether to align to the extreme right or not
  --           right_align = false,
  --           -- padding from the right if right_align is true
  --           right_align_padding = 6,
  --           -- The color of the hints
  --           highlight = "Comment",
  --         },
  --       }
  --     end,
  --     event = { "CmdlineEnter" },
  --     build = ':lua require("go.install").update_all_sync()',
  --   },
  --   {
  --     "simrat39/rust-tools.nvim",
  --     {
  --       "williamboman/mason-lspconfig.nvim",
  --       opts = {
  --         ensure_installed = { "rust_analyzer" },
  --       },
  --     },
  --   },
}
