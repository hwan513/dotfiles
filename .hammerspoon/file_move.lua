local is_correct_filetype = function(file_path)
  if file_path:sub(-4) == ".mp4" then
    return "/Recordings/"
  elseif file_path:sub(-4) == ".pdf" then
    return "/Slides/"
  end
end

local contains_keywords = function(file_name)
  local keywords = {
    { "lecture%d%d", "SOFTENG370" },
    { "SOFTENG 370", "SOFTENG370" },
    { "SOFTENG 351", "SOFTENG351" },
    { "SOFTENG 350", "SOFTENG350" },
    { "ENGGEN",      "ENGGEN303" },
    { "_%d%d",       "" },
  };

  for _, pattern in ipairs(keywords) do
    local key, value = pattern[1], pattern[2]
    print(key, value)
    if file_name:find(key) then
      return true, os.getenv("HOME") .. "/Documents/Learning/" .. value .. is_correct_filetype(file_name), value
    end
  end
  return false
end


local is_start_not_indexed = function(file_name)
  return string.find(file_name:sub(1, 3), "L%d") == nil
end

local find_index = function(file_name)
  local patterns = { "lecture%d%d", "L%d%d", "%_%d%d" }
  for _, pattern in pairs(patterns) do
    local _, finish = file_name:find(pattern);
    if finish then
      return "L" .. file_name:sub(finish - 1, finish) .. " "
    end
  end
end


local alert = function(path, flags)
  for index, file_path in pairs(path) do
    for key, value in pairs(flags[index]) do
      -- print(key)
      -- print(value)
    end
    local file_name = hs.fs.displayName(file_path)
    local file_root = file_path:sub(0, #file_path - #file_name)
    if is_correct_filetype(file_path) and contains_keywords(file_name) then
      local pos = ""
      if is_start_not_indexed(file_name) then
        pos = find_index(file_name)
      end
      local _, file_root_temp, value = contains_keywords(file_name)
      if value ~= "" then
        file_root = file_root_temp
      end
      print(string.format([[mv "%s" "%s%s%s"]], file_path, file_root, pos, file_name))
      os.execute(string.format([[mv "%s" "%s%s%s"]], file_path, file_root, pos, file_name))
    end
  end
end

MyWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/Downloads/Staging/", alert)
MyWatcher:start()
