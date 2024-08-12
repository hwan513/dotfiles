local req = require("john.utils").req

return {
  { "rayliwell/tree-sitter-rstml", opts = {}, ft = "rust" },
  require("john.treesitter.illuminate"),
  require("john.treesitter.treesitter"),
}
