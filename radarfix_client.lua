--[[
########################
#                      #
#     Walter White     #
#                      #
#     Irtas Momaki     #
#                      #
#         2018         #
#                      #
########################
--]]

local DrawMarkerShow = false  -- true = Marqueur activé / false = Marqueur desactivé
local DrawBlipTradeShow = false  -- true = Blip activé / false = Blip desactivé
local prixautoroute = 500  -- Prix par contravention lors d'un flash sur l'autoroute 
local prixcentreville = 500  -- Prix par contravention lors d'un flash en centre ville
local vitessemaxcentreville = 70  -- Reglage a partir de quelle vitesse les radars du centre ville vont flasher en km/h
local vitessemaxautoroute = 140  -- Reglage a partir de quelle vitesse les radars des autoroutes vont flasher en km/h

  local player = GetPlayerPed(-1)
  local vitesse = GetEntitySpeed(player)
  local vehicule = GetVehiclePedIsIn(player)
  local conducteur = GetPedInVehicleSeat(vehicule, -1)
  local plaque = GetVehicleNumberPlateText(vehicule)
  local kmhspeed = math.ceil(vitesse*3.6)
  local secours_hash = GetHashKey("policet") or GetHashKey("fbi") or GetHashKey("ambulance") or GetHashKey("fbi2") or GetHashKey("firetruk") or 
                       GetHashKey("lguard") or GetHashKey("pbus") or GetHashKey("police") or GetHashKey("police2") or GetHashKey("police3") or 
                       GetHashKey("police4") or GetHashKey("policeold1") or GetHashKey("policeold2") or GetHashKey("pranger") or GetHashKey("riot") or 
                       GetHashKey("sheriff") or GetHashKey("sheriff2") or GetHashKey("policeb") 

  local voiture_exonerer = IsVehicleModel(vehicule, secours_hash)



local radarcentreville = {
Position={x = 218.90957641602, y = -1036.5207519531, z = 29.360637664795}, --Radar au croisement de la banque centrale (Strawberry Avenue & Vespucci Boulevard)
--Position={x = 0.0, y = 0.0, z = 0.0},
--Position={x = 0.0, y = 0.0, z = 0.0},
--Position={x = 0.0, y = 0.0, z = 0.0},
--Position={x = 0.0, y = 0.0, z = 0.0},
--Position={x = 0.0, y = 0.0, z = 0.0},
}

local radarautoroute = {
Position={x = 218.90957641602, y = -1034.5207519531, z = 29.360637664795}, --Radar au croisement de la banque centrale (Strawberry Avenue & Vespucci Boulevard)
--Position={x = 0.0, y = 0.0, z = 0.0},
--Position={x = 0.0, y = 0.0, z = 0.0},
--Position={x = 0.0, y = 0.0, z = 0.0},
--Position={x = 0.0, y = 0.0, z = 0.0},
--Position={x = 0.0, y = 0.0, z = 0.0},
}

function RadarCentreVille()

    if kmhspeed >= vitessemaxcentreville and conducteur == player and not voiture_exonerer then
      TriggerServerEvent('paiement:radarcentreville', prixcentreville)
      TriggerEvent("InteractSound_CL:PlayOnOne", "Sonradar", 0.2)  -- Le fichier son est fournis avec la ressource il vous suffit de l'ajouter a votre script qui gere les sons de votre serveur
      Citizen.Wait(1000)
      TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Vitesse enregistrée : ~r~" .. kmhspeed.. "~s~ km/h \nImmatriculation : ~r~"..plaque)
      TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Contravention de : ~r~ 500~s~ $\nRetrait de : ~r~1~s~ points")
    else 
      TriggerEvent("InteractSound_CL:PlayOnOne", "Sonradar", 0.2)  -- Le fichier son est fournis avec la ressource il vous suffit de l'ajouter a votre script qui gere les sons de votre serveur
      Citizen.Wait(1000)
      TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Vitesse enregistrée : ~r~" .. kmhspeed.. "~s~ km/h \nImmatriculation : ~r~"..plaque)
      TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Ceci est un vehicule ~r~d'urgence~s~ \nvous etes exonerer de ~r~contravention~s~")
    end    
end


function RadarAutoroute()

    if kmhspeed >= vitessemaxautoroute and conducteur == player and not voiture_exonerer then
      TriggerServerEvent('paiement:radarautoroute', prixautoroute)
      TriggerEvent("InteractSound_CL:PlayOnOne", "Sonradar", 0.2)  -- Le fichier son est fournis avec la ressource il vous suffit de l'ajouter a votre script qui gere les sons de votre serveur
      Citizen.Wait(1000)
      TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Vitesse enregistrée : ~r~" .. kmhspeed.. "~s~ km/h \nImmatriculation : ~r~"..plaque)
      TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Contravention de : ~r~ 500~s~ $\nRetrait de : ~r~1~s~ points")
    else
      TriggerEvent("InteractSound_CL:PlayOnOne", "Sonradar", 0.2)  -- Le fichier son est fournis avec la ressource il vous suffit de l'ajouter a votre script qui gere les sons de votre serveur
      Citizen.Wait(1000)
      TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Vitesse enregistrée : ~r~" .. kmhspeed.. "~s~ km/h \nImmatriculation : ~r~"..plaque)
      TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Ceci est un vehicule ~r~d'urgence~s~ \nvous etes exonerer de ~r~contravention~s~")
    end
end

function BlipTrue()
    local blipcentreville = AddBlipForCoord(radarcentreville.Position.x, radarcentreville.Position.y, radarcentreville.Position.z)
        SetBlipSprite(blipcentreville, 184)
        SetBlipColour(blipcentreville, 1)
        SetBlipScale(blipcentreville, 0.6)
        SetBlipAsShortRange(blipcentreville, true)
        SetBlipFlashes(item.blip, true)
        SetBlipDisplay(item.blip, 2)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Radar Fix")
        EndTextCommandSetBlipName(blipcentreville)
    local blipautoroute = AddBlipForCoord(radarcentreville.Position.x, radarcentreville.Position.y, radarcentreville.Position.z)
        SetBlipSprite(blipautoroute, 184)
        SetBlipColour(blipautoroute, 1)
        SetBlipScale(blipautoroute, 0.6)
        SetBlipAsShortRange(blipautoroute, true)
        SetBlipFlashes(item.blip, true)
        SetBlipDisplay(item.blip, 2)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Radar Fix")
        EndTextCommandSetBlipName(blipautoroute)
end

Citizen.CreateThread(function()
  while true do
    Wait(0)
    for k,v in pairs(radarcentreville) do
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player, true)
    if Vdist2(radarcentreville[k].x, radarcentreville[k].y, radarcentreville[k].z, coords["x"], coords["y"], coords["z"]) < 30 then
        RadarCentreVille()
        Citizen.Wait(500)
    end
  end
 end
end)

Citizen.CreateThread(function()
  while true do
    Wait(0)
    for k,v in pairs(radarautoroute) do
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player, true)
    if Vdist2(radarautoroute[k].x, radarautoroute[k].y, radarautoroute[k].z, coords["x"], coords["y"], coords["z"]) < 10 then
        RadarAutoroute()
        Citizen.Wait(500)
    end
  end
 end
end)

Citizen.CreateThread(function()

  while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      DrawMarker(0, radarcentreville.Position.x, radarcentreville.Position.y, radarcentreville.Position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5001, 1.5001, 0.5001, 255, 123, 123, 255, 2, 0, 0, 0, 0, 0, 0)
      DrawMarker(0, radarautoroute.Position.x, radarautoroute.Position.y, radarautoroute.Position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5001, 1.5001, 0.5001, 255, 125, 123, 255, 2, 0, 0, 0, 0, 0, 0)
    end
  end
end)

AddEventHandler("playerSpawned", function()
    if DrawBlipTradeShow then
        BlipTrue()
    end
end)
