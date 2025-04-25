local mason_tools = require("john.lsp.mason-installed")
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = vim.list_extend(
        mason_tools.servers,
        vim.list_extend(mason_tools.linters, mason_tools.formatters)
      ),
      auto_update = true,
    },
    dependencies = {
      { "williamboman/mason.nvim", opts = {}, dependencies = { "williamboman/mason-lspconfig.nvim" } },
    },
  },
}
