local prequire = require("john.utils").prequire
return {
  { "rayliwell/tree-sitter-rstml", opts = {}, ft = "rust" },
  prequire("john.treesitter.illuminate"),
  prequire("john.treesitter.treesitter"),
}
