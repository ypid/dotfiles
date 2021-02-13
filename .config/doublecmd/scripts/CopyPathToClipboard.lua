local params = {...}
local path

function escape_pattern(text)
    return text:gsub("([^%w])", "%%%1")
end

-- Note: This function exists in multiple files and even languages (Lua, AHK). Refer to the AHK implementation for details. AHK is considered the reference implementation.
function clean_path_in_clipboard(path)
  if package.config:sub(1,1) == '\\' then
    if os.getenv("USERPROFILE") ~= nil then
      path = path:gsub("^" .. escape_pattern(os.getenv("USERPROFILE")), "%%USERPROFILE%%")
    end
    if not path:find("\\{2}") then -- not UNC path.
      path = path:gsub("\\", "/")
    end
  end
  return path
end

if #params == 1 then -- We got at least one parameter?
  path = params[1]
  path = clean_path_in_clipboard(path)
  Clipbrd.SetAsText(path)
end
