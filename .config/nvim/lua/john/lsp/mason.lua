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
-- Include servers to run {{{
local servers = {
  "basedpyright",
  "bashls",
  "biome",
  "clangd",
  "cssls",
  -- "css_variables",
  "emmet_ls",
  "eslint",
  "html",
  "jdtls",
  -- "jsonls",
  "lemminx",
  "ltex",
  "lua_ls",
  "marksman",
  "omnisharp",
  -- "quick_lint_js",
  "rust_analyzer",
  "ruff_lsp",
  "taplo",
  "texlab",
  "tsserver",
  "typst_lsp",
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
    require("john.lsp.settings.rustaceanvim").setup({ server = opts })
  elseif server == "jdtls" then
    local config = vim.tbl_deep_extend("force", opts, require("john.lsp.settings.nvim-jdtls"))
    local group = vim.api.nvim_create_augroup("jdtls", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        require("jdtls").start_or_attach(config)
      end,
      group = group,
    })
  else
    lspconfig[server].setup(opts)
  end
end
