return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = { keymaps = { accept_suggestion = "<M-j>", clear_suggestion = "<C-]>", accept_word = "<C-j>" } },
    event = "InsertEnter",
  },

  {
    "olimorris/codecompanion.nvim",
    opts = {
      strategies = { chat = { adapter = "qwen3" }, inline = { adapter = "qwen3" }, cmd = { adapter = "qwen3" } },
      adapters = {
        qwen3 = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = { url = "http://localhost:1234" },
            schema = { model = { default = "qwen3-8b-dwq" } },
          })
        end,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "OXY2DEV/markview.nvim",
        opts = {
          preview = { filetypes = { "codecompanion" }, ignore_buftypes = {} },
          condition = function(buffer)
            local ft, bt = vim.bo[buffer].ft, vim.bo[buffer].bt
            return (ft == "codecompanion") and true or (bt == "nofile") and false or true
          end,
        },
      },
      { "saghen/blink.cmp", opts = { sources = { per_filetype = { codecompanion = { "codecompanion" } } } } },
    },
  },
}
