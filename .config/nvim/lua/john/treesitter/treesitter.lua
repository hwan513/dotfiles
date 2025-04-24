return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-textsubjects",
  },
  opts = {
    auto_install = true,
    ensure_installed = { "lua", "vim", "vimdoc" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "python" } }, -- autoindent behaviour
    textsubjects = require("john.treesitter.textsubjects"),
  },
  config = function(_, opts)
    vim.treesitter.language.register("bash", "zsh")
    require("nvim-treesitter.configs").setup(opts)
  end,
}
