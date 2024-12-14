local req = require("john.utils").req
local prequire = require("john.utils").prequire
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    prequire("john.lsp.options")
    prequire("john.lsp.keymaps")
  end,
  dependencies = {
    { "folke/neoconf.nvim", opts = {} },
    { "williamboman/mason.nvim", config = req("john.lsp.mason") },
    { "williamboman/mason-lspconfig.nvim" },
  },
}
