-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      -- ensure_installed = { "lua_ls" },
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "gopls",
        "rust_analyzer",
        "golangci_lint_ls",
        "denols",
        "eslint",
        "dockerls",
        "cssls",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      -- ensure_installed = { "prettier", "stylua" },
      ensure_installed = { "prettier", "stylua" },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = { "delve" },
      -- handlers = {
      --   delve = function(source_name)
      --     local dap = require "dap"
      --     dap.adapters.delve = {
      --       type = "executable",
      --       command = "dlv",
      --       args = { "dap", "-l", "127.0.0.1:38697" },
      --     }
      --     -- Configuración de la sesión de depuración (debug session) para Golang
      --     dap.configurations.delve = {
      --       {
      --         type = "go",
      --         name = "Debug",
      --         request = "launch",
      --         program = "${file}",
      --       },
      --       {
      --         type = "go",
      --         name = "Debug attach",
      --         request = "launch",
      --         program = "${file}",
      --       },
      --       {
      --         type = "go",
      --         name = "Debug test",
      --         request = "launch",
      --         mode = "test",
      --         program = "${file}",
      --       },
      --       {
      --         type = "go",
      --         name = "Debug test (go.mod)",
      --         request = "launch",
      --         mode = "test",
      --         program = "./${relativeFileDirname}",
      --       },
      --     }
      --   end,
      -- },
    },
  },
}
