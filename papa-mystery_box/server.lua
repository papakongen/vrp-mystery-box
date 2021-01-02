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

  local noroc = math.random(0, 150)
  local suma = math.random(1, 3)

  if noroc >= 0 and noroc <= 25 then
      vRP.giveInventoryItem({user_id, "vodka", suma})
  elseif noroc >=25 and noroc <=50 then
      vRP.giveInventoryItem({user_id, "kebab", suma})
  elseif noroc >=50 and noroc <=75 then
      vRP.giveInventoryItem({user_id, "pose", suma})
  elseif noroc >=75 and noroc <=100 then
      vRP.giveInventoryItem({user_id, "lsd", suma})
  elseif noroc >=100 and noroc <=125 then
      vRP.giveInventoryItem({user_id, "kokain", suma})
  elseif noroc >=125 and noroc <=150 then
      vRP.giveInventoryItem({user_id, "donut", suma})
	end
end)