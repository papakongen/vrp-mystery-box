--██████╗░░█████╗░██████╗░░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗███╗░░██╗
--██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔══██╗████╗░██║██╔════╝░██╔════╝████╗░██║
--██████╔╝███████║██████╔╝███████║█████═╝░██║░░██║██╔██╗██║██║░░██╗░█████╗░░██╔██╗██║
--██╔═══╝░██╔══██║██╔═══╝░██╔══██║██╔═██╗░██║░░██║██║╚████║██║░░╚██╗██╔══╝░░██║╚████║
--██║░░░░░██║░░██║██║░░░░░██║░░██║██║░╚██╗╚█████╔╝██║░╚███║╚██████╔╝███████╗██║░╚███║
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚══╝

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","papa-mystery_box")

RegisterServerEvent("papa:tjekitem")
AddEventHandler("papa:tjekitem", function()
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})

  if vRP.tryGetInventoryItem({user_id, "papabox", 1, true}) then
    TriggerClientEvent("papa:boxOk", source)
  end
end)

RegisterServerEvent("papa:boxreward")
AddEventHandler("papa:boxreward", function()
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})

  local papa = math.random(0, 150)
  local antal = math.random(1, 3)

  if papa >= 0 and papa <= 25 then
      vRP.giveInventoryItem({user_id, "vodka", antal})
  elseif papa >=25 and papa <=50 then
      vRP.giveInventoryItem({user_id, "kebab", antal})
  elseif papa >=50 and papa <=75 then
      vRP.giveInventoryItem({user_id, "pose", antal})
  elseif papa >=75 and papa <=100 then
      vRP.giveInventoryItem({user_id, "lsd", antal})
  elseif papa >=100 and papa <=125 then
      vRP.giveInventoryItem({user_id, "kokain", antal})
  elseif papa >=125 and papa <=150 then
      vRP.giveInventoryItem({user_id, "donut", antal})
	end
end)
