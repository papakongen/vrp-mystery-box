--██████╗░░█████╗░██████╗░░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗███╗░░██╗
--██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔══██╗████╗░██║██╔════╝░██╔════╝████╗░██║
--██████╔╝███████║██████╔╝███████║█████═╝░██║░░██║██╔██╗██║██║░░██╗░█████╗░░██╔██╗██║
--██╔═══╝░██╔══██║██╔═══╝░██╔══██║██╔═██╗░██║░░██║██║╚████║██║░░╚██╗██╔══╝░░██║╚████║
--██║░░░░░██║░░██║██║░░░░░██║░░██║██║░╚██╗╚█████╔╝██║░╚███║╚██████╔╝███████╗██║░╚███║
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚══╝

HT = nil
TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","papa-mystery_box")

HT.RegisterServerCallback('papa:getmysterybox', function(source, cb)
    local user_id = vRP.getUserId({source})
    if vRP.hasInventoryItem({user_id, "papa_Mysterybox", 1, false}) then
        cb = true
    else 
        cb = false
        print('Du har ikke nogen mysterybox')
    end
end)

RegisterServerEvent("papa:boxreward")
AddEventHandler("papa:boxreward", function()
  local user_id = vRP.getUserId({source})
  local papa = math.random(0, 150)

  if papa >= 0 and papa <= 25 then
      vRP.giveInventoryItem({user_id, "vodka", 1})
  elseif papa >=25 and papa <=50 then
      vRP.giveInventoryItem({user_id, "kebab", 1})
  elseif papa >=50 and papa <=75 then
      vRP.giveInventoryItem({user_id, "pose", 1})
  elseif papa >=75 and papa <=100 then
      vRP.giveInventoryItem({user_id, "lsd", 1})
  elseif papa >=100 and papa <=125 then
      vRP.giveInventoryItem({user_id, "kokain", 1})
  elseif papa >=125 and papa <=150 then
      vRP.giveInventoryItem({user_id, "donut", 1})
	end
end)
