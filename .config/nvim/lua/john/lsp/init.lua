local prequire = require("config.utils").prequire
prequire("john.lsp.diagnostics")
prequire("john.lsp.keymaps")
prequire("john.lsp.setup")

return {
  prequire("john.lsp.conform"),
  prequire("john.lsp.trouble"),
  prequire("john.lsp.mason"),
  { "neovim/nvim-lspconfig" },
  { "folke/neoconf.nvim", opts = {} },
  { "mfussenegger/nvim-jdtls" },
  { "mrcjkb/rustaceanvim", version = "^6", lazy = false },
  { "linux-cultist/venv-selector.nvim", branch = "regexp", opts = {}, cmd = { "VenvSelect" } },
}
