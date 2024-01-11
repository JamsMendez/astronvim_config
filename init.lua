return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  -- colorscheme = "tokyonight",
  -- colorscheme = "astrodark",
  colorscheme = "darcula-dark",

  icons = {
    VimIcon = "",
  },
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- on_attach = function(client, bufnr)
    --   if client.server_capabilities.inlayHintProvider then
    --     local inlayhints_avail, inlayhints = pcall(require, "lsp-inlayhints")
    --     if inlayhints_avail then inlayhints.on_attach(client, bufnr) end
    --   end
    --   require("lsp-inlayhints").toggle()

    -- -- fix denols vs tsserver
    -- local active_clients = vim.lsp.get_active_clients()
    -- if client.name == "denols" then
    --   for _, client_ in pairs(active_clients) do
    --     -- stop tsserver if denols is already active
    --     if client_.name == "tsserver" then client_.stop() end
    --   end
    -- elseif client.name == "tsserver" then
    --   for _, client_ in pairs(active_clients) do
    --     -- prevent tsserver from starting if denols is already active
    --     if client_.name == "denols" then client.stop() end
    --   end
    -- end
    -- end,
    setup_handlers = {
      -- add custom handler
      --   rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
    },
    config = {
      denols = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        return opts
      end,
      eslint = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern(".eslintrc.json", ".eslintrc.js", ".eslintrc.cjs")
        return opts
      end,
      tsserver = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json")
        opts.single_file_support = false
        opts.settings = {
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        }
        return opts
      end,
      gopls = function(opts)
        opts.settings = {
          gopls = {
            semanticTokens = true,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            gofumpt = true,
          },
        }
        return opts
      end,
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen",
        },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }

    -- vim.cmd [[
    --   let g:clipboard = {
    --   \   'name': 'win32yank-wsl',
    --   \   'copy': {
    --   \      '+': 'win32yank.exe -i --crlf',
    --   \      '*': 'win32yank.exe -i --crlf',
    --   \    },
    --   \   'paste': {
    --   \      '+': 'win32yank.exe -o --lf',
    --   \      '*': 'win32yank.exe -o --lf',
    --   \   },
    --   \   'cache_enabled': 1,
    --   \ }
    -- ]]
  end,
}
