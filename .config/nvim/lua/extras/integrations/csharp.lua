return {
  {
    "mason-org/mason.nvim",
    opts = { registries = { "github:mason-org/mason-registry", "github:Crashdummyy/mason-registry" } },
  },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "roslyn" } } },
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type RoslynNvimConfig
    opts = {},
  },
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
    opts = {},
  },
}
