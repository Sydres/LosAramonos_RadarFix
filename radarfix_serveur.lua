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

RegisterServerEvent('paiement:radarcentreville')
RegisterServerEvent('paiement:radarautoroute')

AddEventHandler('paiement:radarcentreville', function(prixcentreville)
  local source = source
    TriggerEvent('es:getPlayerFromId', source, function(user)
        user.removeBank(prixcentreville)
        --Requete sql ici
    end)
end)

AddEventHandler('paiement:radarautoroute', function(prixautoroute)
  local source = source
    TriggerEvent('es:getPlayerFromId', source, function(user)
        user.removeBank(prixautoroute)
        --Requete sql ici
    end)
end)

--[[


Pour le retrait du point sur le permis il vous suffit de faire la requete sql necessaire en fonction de votre bdd ...


--]]
