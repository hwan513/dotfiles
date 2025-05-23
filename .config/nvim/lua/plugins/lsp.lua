return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    lazy = false, -- don't lazy load as this breaks auto install functionality
    opts_extend = { "ensure_installed" },
    opts = { auto_update = true },
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      opts = {},
      dependencies = { { "mason-org/mason.nvim", opts = {} }, "neovim/nvim-lspconfig" },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    opts = { format_on_save = { timeout_ms = 500, lsp_format = "fallback" } },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    event = "LspAttach",
    config = function(_, opts)
      require("lint").linters_by_ft = opts.linters_by_ft
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
