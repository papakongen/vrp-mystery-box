--██████╗░░█████╗░██████╗░░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗███╗░░██╗
--██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔══██╗████╗░██║██╔════╝░██╔════╝████╗░██║
--██████╔╝███████║██████╔╝███████║█████═╝░██║░░██║██╔██╗██║██║░░██╗░█████╗░░██╔██╗██║
--██╔═══╝░██╔══██║██╔═══╝░██╔══██║██╔═██╗░██║░░██║██║╚████║██║░░╚██╗██╔══╝░░██║╚████║
--██║░░░░░██║░░██║██║░░░░░██║░░██║██║░╚██╗╚█████╔╝██║░╚███║╚██████╔╝███████╗██║░╚███║
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚══╝

HT = nil

Citizen.CreateThread(function()
    while HT == nil do
        TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand("mysterybox",function(source, args)
    HT.TriggerServerCallback('papa:getmysterybox', function(cb)
        if cb then
	TriggerEvent("papa:boxOpen")
        end
    end)
  end)
  
  RegisterNetEvent("papa:boxOpen")
  AddEventHandler("papa:boxOpen", function()
	local plyCoords = GetEntityCoords(PlayerPedId())
    local x, y, z = table.unpack(plyCoords)

    HT.Game.SpawnLocalObject("prop_box_ammo04a", vector3(x+0.95, y, z-1), function(papa_box) 
    loadAnimDict( "anim@amb@clubhouse@tutorial@bkr_tut_ig3@" ) 
    TaskPlayAnim(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
    FreezeEntityPosition(true)
        --------------
        Din progressbar lige her
        -----------------------
	Citizen.Wait(5000)
	FreezeEntityPosition(false)
	ClearPedTasks(PlayerPedId())
	HT.Game.DeleteObject(papa_box)
	TriggerServerEvent("papa:boxreward")
	end)
end)


function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 
