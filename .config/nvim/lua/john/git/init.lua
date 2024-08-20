local prequire = require("john.utils").prequire
return {
  prequire("john.git.neogit"),
  prequire("john.git.gitsigns"),
  { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
  { "pwntester/octo.nvim", opts = {}, event = "VeryLazy" },
}
