--[[

########################
#                      #
#     Walter White     #
#                      #
#                      #
#         2018         #
#                      #
#                      #
########################

--]]

function Radar()
  local player = GetPlayerPed(-1)
  local vitesse = GetEntitySpeed(player)
  local vehicule = GetVehiclePedIsIn(player)
  local conducteur = GetPedInVehicleSeat(vehicule, -1)
  local plaque = GetVehicleNumberPlateText(vehicule)
  local kmhspeed = math.ceil(vitesse*3.6)
  local police_hash1 = GetHashKey("ambulance")
  local police_hash2 = GetHashKey("policet")
  local police_hash3 = GetHashKey("fbi")
  local police_hash4 = GetHashKey("fbi2")
  local police_hash5 = GetHashKey("firetruk")
  local police_hash6 = GetHashKey("lguard")
  local police_hash7 = GetHashKey("pbus")
  local police_hash8 = GetHashKey("police")
  local police_hash9 = GetHashKey("police2")
  local police_hash10 = GetHashKey("police3")
  local police_hash11 = GetHashKey("police4")
  local police_hash12 = GetHashKey("policeold1")
  local police_hash13 = GetHashKey("policeold2")
  local police_hash14 = GetHashKey("pranger")
  local police_hash15 = GetHashKey("riot")
  local police_hash16 = GetHashKey("sheriff")
  local police_hash17 = GetHashKey("sheriff2")
  local police_hash18 = GetHashKey("policeb")
  local voiture_exonerer1 = IsVehicleModel(vehicule, police_hash1)
  local voiture_exonerer2 = IsVehicleModel(vehicule, police_hash2)
  local voiture_exonerer3 = IsVehicleModel(vehicule, police_hash3)
  local voiture_exonerer4 = IsVehicleModel(vehicule, police_hash4)
  local voiture_exonerer5 = IsVehicleModel(vehicule, police_hash5)
  local voiture_exonerer6 = IsVehicleModel(vehicule, police_hash6)
  local voiture_exonerer7 = IsVehicleModel(vehicule, police_hash7)
  local voiture_exonerer8 = IsVehicleModel(vehicule, police_hash8)
  local voiture_exonerer9 = IsVehicleModel(vehicule, police_hash9)
  local voiture_exonerer10 = IsVehicleModel(vehicule, police_hash10)
  local voiture_exonerer11 = IsVehicleModel(vehicule, police_hash11)
  local voiture_exonerer12 = IsVehicleModel(vehicule, police_hash12)
  local voiture_exonerer13 = IsVehicleModel(vehicule, police_hash13)
  local voiture_exonerer14 = IsVehicleModel(vehicule, police_hash14)
  local voiture_exonerer15 = IsVehicleModel(vehicule, police_hash15)
  local voiture_exonerer16 = IsVehicleModel(vehicule, police_hash16)
  local voiture_exonerer17 = IsVehicleModel(vehicule, police_hash17)
  local voiture_exonerer18 = IsVehicleModel(vehicule, police_hash18)
    if ServicePublique == true then
      if kmhspeed >= vitessemax and conducteur == player and not voiture_exonerer1 and not voiture_exonerer2 and not voiture_exonerer3 and not voiture_exonerer4 and not voiture_exonerer5 and not voiture_exonerer6 and not voiture_exonerer7 and not voiture_exonerer8 and not voiture_exonerer9 and not voiture_exonerer10 and not voiture_exonerer11 and not voiture_exonerer12 and not voiture_exonerer13 and not voiture_exonerer14 and not voiture_exonerer15 and not voiture_exonerer16 and not voiture_exonerer17 and not voiture_exonerer18 then
        TriggerServerEvent('paiement:radar', prixcontravention)
        Wait(1000)
        TriggerEvent("InteractSound_CL:PlayOnOne", "Sonradar", 0.2)
        TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Vitesse enregistrée : ~r~" .. kmhspeed.. "~s~ km/h \nImmatriculation : ~r~"..plaque)
        TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Contravention de : ~r~"..prixcontravention.."~s~ $\nRetrait de : ~r~1~s~ points")
      end
        if kmhspeed >= vitessemax and voiture_exonerer1 or voiture_exonerer2 or voiture_exonerer3 or voiture_exonerer4 or voiture_exonerer5 or voiture_exonerer6 or voiture_exonerer7 or voiture_exonerer8 or voiture_exonerer9 or voiture_exonerer10 or voiture_exonerer11 or voiture_exonerer12 or voiture_exonerer13 or voiture_exonerer14 or voiture_exonerer15 or voiture_exonerer16 or voiture_exonerer17 or voiture_exonerer18 then
          Wait(1000)
        TriggerEvent("InteractSound_CL:PlayOnOne", "Sonradar", 0.2)
        TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Vitesse enregistrée : ~r~" .. kmhspeed.. "~s~ km/h \nImmatriculation : ~r~"..plaque)
        TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Ceci est un vehicule ~r~d'urgence~s~ \nvous etes exonerer de ~r~contravention~s~")
        end
    else  
      if kmhspeed >= vitessemax and conducteur == player then
        TriggerServerEvent('paiement:radar', prixcontravention)
        Wait(1000)
        TriggerEvent("InteractSound_CL:PlayOnOne", "Sonradar", 0.2)
        TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Vitesse enregistrée : ~r~" .. kmhspeed.. "~s~ km/h \nImmatriculation : ~r~"..plaque)
        TriggerEvent("citizenv:notify", "CHAR_LS_TOURIST_BOARD", 1, "RADAR FIX", false, "Contravention de : ~r~"..prixcontravention.."~s~ $\nRetrait de : ~r~1~s~ points")
      end
    end
end
 
Citizen.CreateThread(function()
	for _, item in pairs(radar) do
		local choixblip = item.blipshow
		if DrawBlipShow then
			if choixblip == true then
    			local blip = AddBlipForCoord(item.x, item.y, item.z)
        		SetBlipSprite(blip, item.idblip)
        		SetBlipColour(blip, item.couleurblip)
        		SetBlipScale(blip, item.tailleblip)
        		SetBlipFlashes(blip, item.clignotementblip)
        		SetBlipAsShortRange(blip, false)
        		BeginTextCommandSetBlipName("STRING")
        		AddTextComponentString(item.nom)
        		EndTextCommandSetBlipName(blip)
        	end
    	end
    end
end)
 
Citizen.CreateThread(function()
  while true do
    Wait(0)
    for _, item in pairs(radar) do
      local player = GetPlayerPed(-1)
      local coords = GetEntityCoords(player, true)
      local choixmarker = item.markershow
      if (Vdist(item.x, item.y, item.z, coords["x"], coords["y"], coords["z"]) <= item.distanceactivation) then
    	  vitessemax = item.vitessemax
    	  prixcontravention = item.prixamende
        Radar()
        Wait(2500)
      end
    	  if DrawMarkerShow then
    		  if choixmarker == true then
      		  DrawMarker(item.idmarqueur, item.x, item.y, item.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, item.taille1, item.taille2, item.taille3, item.couleurR, item.couleurG, item.couleurB, item.transparence, 2, 0, 0, 0, 0, 0, 0)
      	  end
    	  end
    end
 end
end)

AddEventHandler('onClientMapStart', function()

RequestModel(1581098148)
while not HasModelLoaded(1581098148) do
    Wait(1)
end

RequestModel(2046537925)
while not HasModelLoaded(2046537925) do
  	Wait(1)
end

RequestModel("prop_cctv_pole_01a")
while not HasModelLoaded("prop_cctv_pole_01a") do
    Wait(1)
end

  if FlicEnVille then
  	for _, item in pairs(positionsflics) do
    	flic = CreatePed(item.type, item.hash, item.x, item.y, item.z, item.h, false, false)
    	PlaceObjectOnGroundProperly(flic)
    	SetEntityInvincible(flic, true)
    	SetBlockingOfNonTemporaryEvents(flic, true)
    	TaskStartScenarioInPlace(flic, "WORLD_HUMAN_BINOCULARS", 0, true)
    	SetPedCanRagdoll(flic, false)
    	FreezeEntityPosition(flic, true)
  	end
  end

  if VoitureFlicEnville then
  	for _, item in pairs(positionsvoitureflics) do
    	voiture = CreateVehicle(item.hash, item.x, item.y, item.z, item.h, false, false)
    	SetVehicleOnGroundProperly(voiture)
    	SetEntityInvincible(voiture, true)
    	SetBlockingOfNonTemporaryEvents(voiture, true)
    	FreezeEntityPosition(voiture, false)
    	SetVehicleDoorsLocked(voiture, 2)
    	SetVehicleSiren(voiture, true)
  	end
  end

  if CameraRadar then
  	for _, item in pairs(positionsCamera) do
    	camera = CreateObject(GetHashKey(item.nom), item.x, item.y, item.z, false, true, false)
        SetObjectTargettable(camera, true)
    	SetEntityInvincible(camera, true)
    	SetBlockingOfNonTemporaryEvents(camera, false)
    	FreezeEntityPosition(camera, true)
    	SetEntityHeading(camera, item.h)
  	end
  end

end)
