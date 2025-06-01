local function SaveLayers(filename)
  print("Saving layers in: " .. filename)
  print(hs.inspect.inspect(LayerTable))
  io.open(filename, "w+"):write(hs.json.encode(LayerTable)):close()
end

local function LoadLayers(filename)
  local layerFile = io.open(filename, "r")
  if layerFile == nil then
    return {}
  end
  local contents = layerFile:read("*a")
  layerFile:close()
  return hs.json.decode(contents) or {}
end -- Define the TCP host and port

-- Constants
local host = "localhost"
local port = 5829
local layer_file = hs.configdir .. "/.kanata_layers.json"
local default_layer = "dvorak"
local recent_layer = default_layer
local transientLayers = {
  fn1 = true,
  fn2 = true,
  ext = true,
  wm = true,
}

LayerTable = LoadLayers(layer_file)

OnRead = function(data)
  data = hs.json.decode(data)
  if TcpSocket ~= nil and data ~= nil and data.LayerChange ~= nil then
    local layer = data.LayerChange.new
    if layer ~= nil and not transientLayers[layer] then
      recent_layer = layer
    end
    TcpSocket:read("\n")
  end
end

local connect_kanata = function()
  if TcpSocket == nil then
    hs.alert.show("Error occured in hammerspoon while connecting to kanata")
    return
  end
  TcpSocket:connect(host, port, function()
    hs.alert.show("Hammerspoon connected to kanata at port: " .. port)
    TcpSocket:read("\n")
  end)
end

-- Create a TCP socket and start the callback recursion
TcpSocket = hs.socket.new(OnRead)
connect_kanata()

local alertConnection = function()
  if not TcpSocket:connected() then
    hs.alert.show("Hammerspoon failed to connect to kanata at port: " .. port)
    hs.alert.show("Attempting to reconnect...")
    connect_kanata()
  end
end

-- Watch for changes in active application
AppWatcher = hs.application.watcher.new(function(_, eventType, app)
  if eventType == hs.application.watcher.deactivated then
    -- Save layer setting on switch away unless it is the default layer
    if app:bundleID() ~= nil then
      if recent_layer == default_layer then
        LayerTable[app:bundleID()] = nil
      elseif LayerTable[app:bundleID()] ~= recent_layer then
        LayerTable[app:bundleID()] = recent_layer
      end
      SaveLayers(layer_file)
    end
  -- Load layer setting on switch to an application
  elseif eventType == hs.application.watcher.activated then
    alertConnection()
    local newLayer = LayerTable[app:bundleID()]
    if newLayer == nil or newLayer == "" or newLayer == "noop" then
      newLayer = default_layer
    end
    if newLayer ~= recent_layer then
      TcpSocket:write(hs.json.encode({ ChangeLayer = { new = newLayer } }))
    end
  end
end)

AppWatcher:start()
