local M = {}
M = {
  prequire = function(filename)
    local status_ok, result = pcall(require, filename)
    if not status_ok then
      vim.notify(string.format("%s failed to load ", filename), vim.log.levels.ERROR)
      return {}
    end
    return result
  end,

  setup = function(modname, args)
    return function()
      require(modname).setup(args)
    end
  end,

  req = function(modname)
    return function()
      require(modname)
    end
  end,

  map = vim.keymap.set, -- keymaps function shortened
  ---@param desc string?
  map_opts = function(desc)
    return { noremap = true, silent = true, desc = desc }
  end,

  ft_ignore = { "NvimTree", "toggleterm", "NeogitStatus", "lazy", "help", "Trouble", "dashboard" },

  --- Gets all Lua modules in a given directory and its subdirectories
  ---@param directory_name string
  ---@return table list of all modules in given directory
  get_lua_modules = function(directory_name)
    local paths = vim.api.nvim_get_runtime_file("lua/" .. directory_name .. "/**/*.lua", true)
    local modules = {}
    for _, path in ipairs(paths) do
      local module = path:match(vim.fn.stdpath("config") .. "/lua/(.+)%.lua$")
      if module then
        module = module:gsub("/", ".") -- convert path to module name
        table.insert(modules, module)
      end
    end
    table.sort(modules)
    return modules
  end,
}

return M
