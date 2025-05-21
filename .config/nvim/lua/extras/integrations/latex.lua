vim.lsp.config("texlab", {
  settings = {
    texlab = {
      build = {
        onSave = true,
        executable = "tectonic",
        args = {
          "%f",
          "--synctex",
          "--keep-logs",
          "--keep-intermediates",
        },
      },
    },
  },
})

return {
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_compiler_method = "tectonic"
    end,
  },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "texlab", "tex-fmt" } } },
  { "stevearc/conform.nvim", opts = { formatters_by_ft = { tex = { "tex-fmt" } } } },
}
