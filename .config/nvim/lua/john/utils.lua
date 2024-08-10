local M = {}
M = {
  prequire = function(filename)
    local status_ok, result = pcall(require, filename)
    if not status_ok then
      print(string.format("%s failed to load", filename))
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

  map = vim.api.nvim_set_keymap, -- keymaps function shortened
  map_opts = function(desc)
    return { noremap = true, silent = true, desc = desc }
  end,
}

return M
