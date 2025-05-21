local extra_plugins_path = vim.fn.stdpath("config") .. "/lua/config/extra_plugins.lua"
local load_success, extra_plugins = pcall(require, "config.extra_plugins")

--- Gets all Lua modules in a given directory and its subdirectories
---@param directory_name string
---@return table list of all modules in given directory
local update_extras_enabled = function(directory_name)
  local paths = vim.api.nvim_get_runtime_file("lua/" .. directory_name .. "/**/*.lua", true)
  local module_names = {}
  for _, path in ipairs(paths) do
    local module_name = path:match(vim.fn.stdpath("config") .. "/lua/(.+)%.lua$")
    if module_name then
      module_name = module_name:gsub("/", ".") -- Convert path to module name
      -- Set the update any new modules with disabled, while keeping old enabled status
      module_names[module_name] = (load_success and extra_plugins[module_name] ~= nil) and extra_plugins[module_name]
        or false
    end
  end
  return module_names
end

local refresh_extras = function()
  local module_names = update_extras_enabled("extras")
  local file = io.open(extra_plugins_path, "w")
  if not file then
    vim.notify("Failed to open file: " .. extra_plugins_path, vim.log.levels.ERROR)
    return
  end
  file:write("return " .. vim.inspect(module_names))
  file:close()
  return module_names
end

vim.api.nvim_create_user_command("RefreshExtras", refresh_extras, { desc = "Update extra plugins being tracked" })

-- Try refreshing extras if loading failed initially
if not load_success then
  vim.notify("extra_plugins.lua was not found, attempting to refresh extras", vim.log.levels.INFO)
  local module_names = refresh_extras()
  if module_names then
    vim.notify("Refresh successful, loading extras", vim.log.levels.INFO)
    extra_plugins = module_names
  else
    vim.notify("Failed to refresh extras. Extra plugins will not be loaded", vim.log.levels.ERROR)
    return {}
  end
end

-- Filter out any modules that are not enabled
local enabled_extras = vim.tbl_filter(function(key)
  return extra_plugins[key]
end, vim.tbl_keys(extra_plugins))

-- Return in format for lazy spec
return vim.tbl_map(function(key)
  return { import = key }
end, enabled_extras)
