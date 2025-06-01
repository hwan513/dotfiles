local function prequire(call)
  local status, _ = pcall(require, call)
  if not status then
    hs.alert(call .. " failed to load")
  end
end

prequire("kanata")
prequire("keyUtils")
prequire("clicker")
prequire("mouselogger")
prequire("reloadConfig") -- Seems to have weird behaviour if not at the bottom
