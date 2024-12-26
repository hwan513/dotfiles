local lspconfig = require("lspconfig")
local servers = require("john.lsp.servers")

local create_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
  end
  return capabilities
end

for _, server in pairs(servers) do
  local opts = { capabilities = create_capabilities() }

  local has_custom_opts, server_custom_opts = pcall(require, "john.lsp.settings." .. server)
  if has_custom_opts then -- use personal custom options if they exist
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  if server == "rust_analyzer" then
    require("john.lsp.settings.rustaceanvim").setup({ server = opts })
  elseif server == "jdtls" then
    local group = vim.api.nvim_create_augroup("jdtls", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        require("jdtls").start_or_attach(opts)
      end,
      group = group,
    })
  else
    lspconfig[server].setup(opts)
  end
end
