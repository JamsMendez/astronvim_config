return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = { -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.prettier.with {
        extra_args = {
          "--no-semi",
          "--single-quote",
          "--trailing-comma none",
          "--jsx-single-quote",
          "--use-tabs",
          "--tab-width 4",
          "--html-whitespace-sensitivity css",
          "--embedded-language-formatting=auto"
        },
      },
      null_ls.builtins.formatting.stylua,
    }
    return config -- return final config table
  end,
}
