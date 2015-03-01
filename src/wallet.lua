
-- Wallet
-- by Connor Delaney

local build = .5
local cBuild = http.get("https://raw.githubusercontent.com/connordelaneyy/Wallet/master/BUILD").readAll()

if build < tonumber(cBuild) then
  local file = fs.open(shell.getRunningProgram(), "w")
  file.write
  file.close()
end

local header = function()
  term.setBackgroundColour(colours.grey)
  term.setTextColour(colours.lightGrey)
  term.clear()
  term.setCursorPos(2, 2)
  print("Wallet - Created by CDEL")
end
