-- Based on https://doublecmd.github.io/doc/en/lua.html#exampleattr

local params = {...}
local myfileattr

-- Open a new tab in all cases.
DC.ExecuteCommand("cm_NewTab")

-- If in the previous tab, a directory was selected or in focus, switch to it in the new tab.
if #params == 1 then -- We got at least one parameter?
  myfileattr = SysUtils.FileGetAttr(params[1])
  if myfileattr > 0 then -- We got a valid attribut?
    if math.floor(myfileattr / 0x00000010) % 2 ~= 0 then
      -- bit 4 is set? So it's a directory.
      DC.ExecuteCommand("cm_ChangeDir", params[1])
    end
  end
end
