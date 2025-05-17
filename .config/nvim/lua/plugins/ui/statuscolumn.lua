local ft_ignore = require("config.utils").ft_ignore
return {
  {
    "luukvbaal/statuscol.nvim",
    opts = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      local builtin = require("statuscol.builtin")
      return {
        -- configuration goes here, for example:
        relculright = true,
        ft_ignore = ft_ignore,
        segments = {
          { sign = { namespace = { "gitsigns" }, colwidth = 1, wrap = true }, click = "v:lua.ScSa" },
          { sign = { namespace = { "diagnostic" }, colwidth = 2, maxwidth = 1 }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
        },
        clickhandlers = {
          FoldOther = false,
        },
      }
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    opts = {},
    event = "VeryLazy",
    keys = {
      { "zR", "<cmd>lua require('ufo').openAllFolds()<cr>", desc = "Open all folds" },
      { "zM", "<cmd>lua require('ufo').closeAllFolds()<cr>", desc = "Close all folds" },
      { "zr", "<cmd>lua require('ufo').openFoldsExceptKinds()<cr>", desc = "Fold less " },
      { "zm", "<cmd>lua require('ufo').closeFoldsWith()<cr>", desc = "Fold more " },
      { "zk", "<cmd>lua require('ufo').peekFoldedLinesUnderCursor()<cr>", desc = "Peek fold" },
    },
  },
}
