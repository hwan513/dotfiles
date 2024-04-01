local is_correct = function(file_path)
  if file_path:sub(-2) == ".c" then
    return true
  elseif file_path:sub(-8) == "Makefile" then
    return true
  end
  return false
end

local alert = function(path, flags)
  for index, file_path in pairs(path) do
    local file_name = hs.fs.displayName(file_path)
    local new_path = os.getenv("HOME") .. "/Documents/ubuntu_shared/"
    if is_correct(file_path) then
      print(string.format([[cp "%s" "%s%s"]], file_path, new_path, file_name))
      os.execute(string.format([[cp "%s" "%s%s"]], file_path, new_path, file_name))
    end
  end
end

MyWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/Documents/Learning/SOFTENG370/Assignments/Assignment 1/", alert)
MyWatcher:start()
