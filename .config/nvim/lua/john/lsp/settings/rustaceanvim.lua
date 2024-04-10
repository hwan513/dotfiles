local M = {}

M.setup = function(input)
  vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
    },
    -- LSP configuration
    server = input.server,
    -- DAP configuration
    -- dap = input.dap,
  }
end

return M
