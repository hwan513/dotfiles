local req = require("john.utils").req
return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  { "folke/neoconf.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    config = req("lspconfig"),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", config = req("john.lsp.mason") },
      { "stevearc/conform.nvim", config = req("john.lsp.conform") },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      { "jayp0521/mason-null-ls.nvim" },
      { "mfussenegger/nvim-jdtls" },
      {
        "nvimtools/none-ls.nvim",
        config = req("john.lsp.null-ls"),
        dependencies = {
          "nvimtools/none-ls-extras.nvim",
        },
      },
    },
  }, -- enable LSP
  require("john.lsp.trouble"),
  { "mrcjkb/rustaceanvim", version = "^4", ft = { "rust" } },
  { "linux-cultist/venv-selector.nvim", branch = "regexp", opts = {}, cmd = { "VenvSelect" } },
}
