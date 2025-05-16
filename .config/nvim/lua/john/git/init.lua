local prequire = require("config.utils").prequire
return {
  prequire("john.git.neogit"),
  prequire("john.git.gitsigns"),
  { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
}
