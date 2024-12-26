local prequire = require("john.utils").prequire

return {
  prequire("john.lsp.lspconfig"),
  prequire("john.lsp.conform"),
  prequire("john.lsp.lazydev"),
  prequire("john.lsp.trouble"),

  { "mfussenegger/nvim-jdtls" },
  { "mrcjkb/rustaceanvim", version = "^5", ft = { "rust" } },
  { "linux-cultist/venv-selector.nvim", branch = "regexp", opts = {}, cmd = { "VenvSelect" } },
  prequire("john.lsp.file-operations"),
}
