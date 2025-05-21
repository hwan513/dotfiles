return {
  { "HiPhish/rainbow-delimiters.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" }, event = "VeryLazy" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    opts = {
      auto_install = true,
      ensure_installed = { "lua", "vim", "vimdoc" },
      highlight = { enable = true },
      indent = { enable = true, disable = { "python" } }, -- autoindent behaviour
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        swap = {
          enable = true,
          swap_next = { ["gs"] = "@parameter.inner" },
          swap_previous = { ["gS"] = "@parameter.inner" },
        },
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
    config = function(_, opts)
      vim.treesitter.language.register("bash", "zsh")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
