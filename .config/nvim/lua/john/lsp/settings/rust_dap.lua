local extension_path = require("mason-core.package").get_install_path("codelldb") .. "/codelldb/extension/"
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
return {
  adapter = require('rust-tools.dap').get_codelldb_adapter(
    codelldb_path, liblldb_path)
}
