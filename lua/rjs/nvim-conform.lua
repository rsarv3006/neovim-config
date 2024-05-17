local cachedConfig = nil
local searchedForConfig = false

function Find_conform_config()
  if searchedForConfig then
    return cachedConfig
  end

  -- find .swiftformat config file in the working directory
  -- could be simplified if you keep it always in the root directory
  local swiftFormatConfigs = vim.fn.systemlist({
    "find",
    vim.fn.getcwd(),
    "-maxdepth",
    "2", -- if you need you can set higher number
    "-iname",
    ".swiftformat",
    "-not",
    "-path",
    "*/.*/*",
  })
  searchedForConfig = true

  if vim.v.shell_error ~= 0 then
    return nil
  end

  table.sort(swiftFormatConfigs, function(a, b)
    return a ~= "" and #a < #b
  end)

  if swiftFormatConfigs[1] then
    cachedConfig = string.match(swiftFormatConfigs[1], "^%s*(.-)%s*$")
  end

  return cachedConfig
end
