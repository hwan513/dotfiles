local sonar_language_server_path = require("mason-registry").get_package("sonarlint-language-server"):get_install_path()
local analyzers_path = sonar_language_server_path .. "/extension/analyzers"
return {
  server = {
    cmd = {
      "sonarlint-language-server",
      "-stdio",
      "-analyzers",
      vim.fn.expand(analyzers_path .. "/sonarpython.jar"),
      vim.fn.expand(analyzers_path .. "/sonarjs.jar"),
      -- vim.fn.expand(analyzers_path .. "/sonarcfamily.jar"),
      vim.fn.expand(analyzers_path .. "/sonarjava.jar"),
    },
  },
  filetypes = {
    "python",
    "javascript",
    -- "cpp",
    "java",
  },
  on_attach = require("john.lsp.handlers").on_attach,
  capabilities = require("john.lsp.handlers").capabilities,
}
