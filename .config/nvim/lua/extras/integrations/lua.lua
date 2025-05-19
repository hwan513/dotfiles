vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      codeLens = { enable = true },
      completion = { callSnippet = "Replace" },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = "Disable",
        semicolon = "Disable",
        arrayIndex = "Disable",
      },
    },
  },
})

return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = {
      { "LuaCATS/luassert", name = "luassert-types", lazy = true },
      { "LuaCATS/busted", name = "busted-types", lazy = true },
    },
    opts = {
      library = {
        "lazy.nvim",
        "snacks.nvim",
        { path = "luassert-types/library", words = { "assert" } },
        { path = "busted-types/library", words = { "describe" } },
      },
    },
  },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "lua_ls", "stylua" } } },
  { "stevearc/conform.nvim", opts = { formatters_by_ft = { lua = { "stylua" } } } },
}
