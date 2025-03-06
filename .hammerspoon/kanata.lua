-- Define the TCP host and port
local host = "localhost"
local port = 5829

local transientLayers = {
  fn1 = true,
  fn2 = true,
  ext = true,
  wm = true,
}

local function SaveLayers()
  print("Saving layers")
  print(hs.inspect.inspect(LayerTable))
  io.open(".kanata_layers.json", "w+"):write(hs.json.encode(LayerTable)):close()
end

local function LoadLayers()
  local layerFile = io.open(".kanata_layers.json", "r")
  if layerFile == nil then
    return {}
  end

  local contents = layerFile:read("*a")
  layerFile:close()
  if contents == nil then
    return {}
  end
  return hs.json.decode(contents)
end

LayerTable = LoadLayers()
DefaultLayer = "dvorak"
RecentLayer = DefaultLayer

OnRead = function(data)
  data = hs.json.decode(data)
  if TcpSocket ~= nil and data ~= nil and data.LayerChange ~= nil then
    local layer = data.LayerChange.new
    if layer ~= nil and not transientLayers[layer] then
      RecentLayer = layer
    end
    TcpSocket:read("\n")
  end
end

local alertConnection = function()
  if not TcpSocket:connected() then
    hs.alert.show("Hammerspoon is not connected to kanata socket")
    TcpSocket:connect(host, port)
  end
end

-- Create a TCP socket and start the callback recursion
TcpSocket = hs.socket.new(OnRead)
TcpSocket:connect(host, port)
TcpSocket:read("\n")

-- Watch for changes in active application
AppWatcher = hs.application.watcher.new(function(_, eventType, app)
  if eventType == hs.application.watcher.deactivated then
    -- Save layer setting on switch away unless it is the default layer
    if app:bundleID() ~= nil then
      if RecentLayer == DefaultLayer then
        LayerTable[app:bundleID()] = nil
      elseif LayerTable[app:bundleID()] ~= RecentLayer then
        LayerTable[app:bundleID()] = RecentLayer
      end
      SaveLayers()
    end
  -- Load layer setting on switch to an application
  elseif eventType == hs.application.watcher.activated then
    alertConnection()
    local newLayer = LayerTable[app:bundleID()]
    if newLayer == nil or newLayer == "" or newLayer == "noop" then
      newLayer = DefaultLayer
    end
    if newLayer ~= RecentLayer then
      TcpSocket:write(hs.json.encode({ ChangeLayer = { new = newLayer } }))
    end
  end
end)

AppWatcher:start()
