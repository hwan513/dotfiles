return {
  -- Markdown Editing
  { "preservim/vim-markdown", ft = "markdown" },
  { "lukas-reineke/headlines.nvim", ft = "markdown" },

  -- Typst Editing
  { "kaarmu/typst.vim", ft = { "typst" } },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "0.3.*",
    build = function()
      require("typst-preview").update()
    end,
  },

  -- Latex Editing
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_compiler_method = "tectonic"
    end,
  },
}
