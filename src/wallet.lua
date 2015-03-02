
-- Wallet
-- by Connor Delaney

if not http then
  error("Wallet requires HTTP to talk to the Krist server, please enable HTTP.", 0)
end

if not term.isColour() then
  error("Wallet requires a display that supports colour, try using an advanced computer.", 0)
end

local build = .5
local autoUpdate = true
local cBuild = http.get("https://raw.githubusercontent.com/connordelaneyy/Wallet/master/BUILD").readAll()

local header = function()
  term.setBackgroundColour(colours.grey)
  term.setTextColour(colours.lightGrey)
  term.clear()
  term.setCursorPos(2, 2)
  print("Wallet - Created by CDEL")
end

if autoUpdate == true then
  if build < tonumber(cBuild) then
    local file = fs.open(shell.getRunningProgram(), "w")
    file.write(http.get("https://raw.githubusercontent.com/connordelaneyy/Wallet/master/src/wallet.lua").readAll())
    file.close()
  end
end

local login = function()
  term.setCursorPos(2, 5)
  print("Private Key: ")
  local pkey = io.read()
end

header()
login()
