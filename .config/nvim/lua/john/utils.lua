local M = {}
M = {
  prequire = function(filename)
    local status_ok, result = pcall(require, filename)
    if not status_ok then
      print(string.format("%s failed to load", filename))
      return
    end
    return result
  end
}

return M
