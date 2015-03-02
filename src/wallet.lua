
-- Wallet
-- by Connor Delaney

if not http then
  error("Wallet requires HTTP to talk to the Krist server, please enable HTTP.", 0)
end

if not term.isColour() then
  error("Wallet requires a display that supports colour, try using an advanced computer.", 0)
end

local uData = {
  pkey = nil,
  balance = 0
}

local build = .5
local autoUpdate = true
local url = "http://65.26.252.225/quest/dia/krist/"
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
  header()
  term.setCursorPos(2, 4)
  print("Enter your Private Key to use Krist. If this is\n your first time using Krist, a wallet will be\n generated with the Private Key you enter.")
  term.setCursorPos(2, 8)
  write("Private Key: ")
  uData.pkey = read("*")
end

local menu = function()
  uData.balance = http.get(url..?balance..uData.pkey).readAll()
  
  header()
  term.setCursorPos(2, 4)
  print("Balance: "..uData.balance)
end

login()
menu()
