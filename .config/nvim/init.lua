local prequire = require("utils").prequire

prequire("john.default")
prequire("john.lazy").setup()
prequire("john.lsp")
prequire("john.treesitter")
prequire("john.interface")
prequire("john.qol")
prequire("john.dap")
