local prequire = require("john.utils").prequire
return {
  prequire("john.editor.bufferline"),
  prequire("john.editor.dropbar"),
  prequire("john.editor.lualine"),
  prequire("john.editor.nvim-tree"),
  prequire("john.editor.statuscol"),
  prequire("john.editor.toggleterm"),
}
