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
}
