local prequire = require("john.utils").prequire
local servers = require("john.lsp.servers")

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    prequire("john.lsp.diagnostics")
    prequire("john.lsp.keymaps")
    prequire("john.lsp.setup")
  end,

  dependencies = {
    { "folke/neoconf.nvim", opts = {} },
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = { ensure_installed = servers, automatic_installation = true } },
  },
}
