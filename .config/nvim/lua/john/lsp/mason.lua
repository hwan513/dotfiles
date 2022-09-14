-- require statement {{{
local mason_status_ok, mason = pcall(require, "mason")
local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
local lspconfig = require("lspconfig")
if not (mason_status_ok or mason_lspconfig_status_ok) then
  print("mason failed to load")
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- }}}
-- Include default servers to install {{{
local servers = {
  "clangd",
  "cssls",
  "emmet_ls",
  "html",
  "jdtls",
  "jsonls",
  "ltex",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "tsserver",
  "vimls",
}

mason_lspconfig.setup({
  ensure_installed = servers,
})

-- see Neovim from Scratch
for _, server in pairs(servers) do
  local opts = {
    on_attach = require("john.lsp.handlers").on_attach,
    capabilities = require("john.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "john.lsp.settings." .. server)
  -- use personal custom options if they exist
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  if server == "rust_analyzer" then
    require("rust-tools").setup(opts)
  else
    lspconfig[server].setup(opts)
  end
end
