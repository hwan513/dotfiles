local req = require("john.utils").req
local setup = require("john.utils").setup
local prequire = require("john.utils").prequire
return {
  prequire("john.lsp.lazydev"),
  prequire("john.lsp.conform"),
  { "folke/neoconf.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    config = setup("john.lsp.handlers"),
    event = "VeryLazy",
    dependencies = {
      { "williamboman/mason.nvim", config = req("john.lsp.mason") },
      { "williamboman/mason-lspconfig.nvim" },
    },
  }, -- enable LSP
  { "mfussenegger/nvim-jdtls" },
  require("john.lsp.trouble"),
  { "mrcjkb/rustaceanvim", version = "^4", ft = { "rust" } },
  { "linux-cultist/venv-selector.nvim", branch = "regexp", opts = {}, cmd = { "VenvSelect" } },
}
