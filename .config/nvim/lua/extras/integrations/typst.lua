vim.lsp.config("tinymist", {
  settings = {
    exportPdf = "onSave", -- Choose onType, onSave or never.,
    formatterMode = "typstyle",
  },
})

return {
  { "chomosuke/typst-preview.nvim", ft = "typst", opts = {} },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "tinymist" } } },
  { "OXY2DEV/markview.nvim", opts = { preview = { filetypes = { "typst" } } } },
}
